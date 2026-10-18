<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','student_no') || $check_field('add','student_no') || $check_field('set','student_no')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="学生编号" prop="student_no">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_student_no(form['student_no']) }}
							<!--<el-input id="business_name" v-model="form['student_no']" placeholder="请输入学生编号"-->
							<!--v-if="user_group === '管理员' || (form['student_information_id'] && $check_field('set','student_no')) || (!form['student_information_id'] && $check_field('add','student_no'))" :disabled="disabledObj['student_no_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','student_no')">{{form['student_no']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['student_information_id'] && $check_field('set','student_no')) || (!form['student_information_id'] && $check_field('add','student_no'))" id="student_no" v-model="form['student_no']" :disabled="disabledObj['student_no_isDisabled']">
								<el-option v-for="o in list_user_student_no" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','student_no')" id="student_no" v-model="form['student_no']" :disabled="true">
								<el-option v-for="o in list_user_student_no" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="student_no" v-model="form['student_no']" :disabled="disabledObj['student_no_isDisabled']">
							<el-option v-for="o in list_user_student_no" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','student_name') || $check_field('add','student_name') || $check_field('set','student_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="学生姓名" prop="student_name">
												<el-input id="student_name" v-model="form['student_name']" placeholder="请输入学生姓名"
							  v-if="user_group === '管理员' || (form['student_information_id'] && $check_field('set','student_name')) || (!form['student_information_id'] && $check_field('add','student_name'))" :disabled="disabledObj['student_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','student_name')">{{form['student_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','gender') || $check_field('add','gender') || $check_field('set','gender')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="性别" prop="gender">
												<el-input id="gender" v-model="form['gender']" placeholder="请输入性别"
							  v-if="user_group === '管理员' || (form['student_information_id'] && $check_field('set','gender')) || (!form['student_information_id'] && $check_field('add','gender'))" :disabled="disabledObj['gender_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','gender')">{{form['gender']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','name_of_department') || $check_field('add','name_of_department') || $check_field('set','name_of_department')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="院系名称" prop="name_of_department">
								<el-select id="name_of_department" v-model="form['name_of_department']"
						v-if="user_group === '管理员' || (form['student_information_id'] && $check_field('set','name_of_department')) || (!form['student_information_id'] && $check_field('add','name_of_department'))">
						<el-option v-for="o in list_name_of_department" :key="o['name_of_department']" :label="o['name_of_department']"
							:value="o['name_of_department']">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','name_of_department')">{{form['name_of_department']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','major') || $check_field('add','major') || $check_field('set','major')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="学习专业" prop="major">
								<el-select id="major" v-model="form['major']"
						v-if="user_group === '管理员' || (form['student_information_id'] && $check_field('set','major')) || (!form['student_information_id'] && $check_field('add','major'))">
						<el-option v-for="o in list_major" :key="o['major_name']" :label="o['major_name']"
							:value="o['major_name']">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','major')">{{form['major']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','class_name') || $check_field('add','class_name') || $check_field('set','class_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="班级名称" prop="class_name">
								<el-select id="class_name" v-model="form['class_name']"
						v-if="user_group === '管理员' || (form['student_information_id'] && $check_field('set','class_name')) || (!form['student_information_id'] && $check_field('add','class_name'))">
						<el-option v-for="o in list_class_name" :key="o['class_name']" :label="o['class_name']"
							:value="o['class_name']">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','class_name')">{{form['class_name']}}</div>
							</el-form-item>
			</el-col>
					
	
	
	
	
	
	
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item>
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				field: "student_information_id",
				url_add: "~/api/student_information/add?",
				url_set: "~/api/student_information/set?",
				url_get_obj: "~/api/student_information/get_obj?",
				url_upload: "~/api/student_information/upload?",

				query: {
					"student_information_id": 0,
				},

				form: {
								"student_no": 0, // 学生编号
										"student_name":  '', // 学生姓名
										"gender":  '', // 性别
										"name_of_department":  '', // 院系名称
										"major":  '', // 学习专业
										"class_name":  '', // 班级名称
											"student_information_id": 0, // ID
						
				},
				disabledObj:{
								"student_no_isDisabled": false,
										"student_name_isDisabled": false,
										"gender_isDisabled": false,
										"name_of_department_isDisabled": false,
										"major_isDisabled": false,
										"class_name_isDisabled": false,
										},

	
					// 用户列表
				list_user_student_no: [],
						// 用户组
				group_user_student_no: "",
				
		
						// 院系名称选项列表
				list_name_of_department: [""],
	
						// 学习专业选项列表
				list_major: [""],
	
						// 班级名称选项列表
				list_class_name: [""],
	
	
			}
		},
		methods: {


	
	
				/**
			 * 获取学生用户列表
			 */
			async get_list_user_student_no() {
                // if(this.user_group !== "管理员" && this.form["student_no"] === 0) {
                //     this.form["student_no"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=学生");
                if(json.result && json.result.list){
                    this.list_user_student_no = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					/**
			 * 获取学生用户组
			 */
			async get_group_user_student_no() {
							this.form["student_no"] = this.user.user_id;
							var json = await this.$get("~/api/user_group/get_obj?name=学生");
				if(json.result && json.result.obj){
					this.group_user_student_no = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_student_no(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_student_no.source_table+"/get_obj?"
				this.$get(url, user_id, function(res) {
					if (res.result && res.result.obj) {
						var arr = []
						for (let key in res.result.obj) {
							arr.push(key)
						}
						var arrForm = []
									for (let key in _this.form) {
							arrForm.push(key)
						}
												_this.form["student_no"] = id
									_this.disabledObj['student_no' + '_isDisabled'] = true
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
							for (var j = 0; j < arrForm.length; j++) {
							  if (arr[i] === arrForm[j]) {
								if (arr[i] !== "student_no") {
			                      _this.form[arrForm[j]] = res.result.obj[arr[i]]
			                      _this.disabledObj[arrForm[j] + '_isDisabled'] = true
								  break;
								} else {
								  _this.disabledObj[arrForm[j] + '_isDisabled'] = true
								}
							  }
							}
						  }
						}
					}
				});
			},
					get_user_student_no(id){
				var obj = this.list_user_student_no.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},
			
	
			
	
			
				/**
			 * 获取院系名称列表
			 */
			async get_list_name_of_department() {
				var json = await this.$get("~/api/department_management/get_list?");
				if(json.result && json.result.list){
					this.list_name_of_department = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
	
			
				/**
			 * 获取学习专业列表
			 */
			async get_list_major() {
				var json = await this.$get("~/api/professional_management/get_list?");
				if(json.result && json.result.list){
					this.list_major = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
	
			
				/**
			 * 获取班级名称列表
			 */
			async get_list_class_name() {
				var json = await this.$get("~/api/class_management/get_list?");
				if(json.result && json.result.list){
					this.list_class_name = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
																										
				if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							// if(dbKey === "charging_standard"){
							// 	this.form['charging_rules'] = form[dbKey];
							// 	this.disabledObj['charging_rules_isDisabled'] = true;
							// };
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
							}
						})
					})
				}
																$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){


																		

			},

			/**
			 * 提交前验证事件
			 * @param {Object} 请求参数
			 * @return {String} 验证成功返回null, 失败返回错误提示
			 */
			submit_check(param) {
				let msg = null
																								return msg;
			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/student_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/student_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/student_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/student_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/student_information/view','get');
					console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
				}

				console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

				return bl;
			},
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},

		},
		created() {
					this.get_list_user_student_no();
					this.get_group_user_student_no();
											this.get_list_name_of_department();
						this.get_list_major();
						this.get_list_class_name();
				},
	}
</script>

<style>
	.avatar-uploader .el-upload {
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
	}

	.avatar-uploader .el-upload:hover {
		border-color: #409EFF;
	}

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}




</style>
