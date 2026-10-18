<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','course_name') || $check_field('add','course_name') || $check_field('set','course_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="课程名称" prop="course_name">
												<el-input id="course_name" v-model="form['course_name']" placeholder="请输入课程名称"
							  v-if="user_group === '管理员' || (form['course_selection_information_id'] && $check_field('set','course_name')) || (!form['course_selection_information_id'] && $check_field('add','course_name'))" :disabled="disabledObj['course_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','course_name')">{{form['course_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','class_location') || $check_field('add','class_location') || $check_field('set','class_location')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="上课地点" prop="class_location">
												<el-input id="class_location" v-model="form['class_location']" placeholder="请输入上课地点"
							  v-if="user_group === '管理员' || (form['course_selection_information_id'] && $check_field('set','class_location')) || (!form['course_selection_information_id'] && $check_field('add','class_location'))" :disabled="disabledObj['class_location_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','class_location')">{{form['class_location']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','start_time') || $check_field('add','start_time') || $check_field('set','start_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="开始时间" prop="start_time">
												<el-input id="start_time" v-model="form['start_time']" placeholder="请输入开始时间"
							  v-if="user_group === '管理员' || (form['course_selection_information_id'] && $check_field('set','start_time')) || (!form['course_selection_information_id'] && $check_field('add','start_time'))" :disabled="disabledObj['start_time_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','start_time')">{{form['start_time']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','end_time') || $check_field('add','end_time') || $check_field('set','end_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="结束时间" prop="end_time">
												<el-input id="end_time" v-model="form['end_time']" placeholder="请输入结束时间"
							  v-if="user_group === '管理员' || (form['course_selection_information_id'] && $check_field('set','end_time')) || (!form['course_selection_information_id'] && $check_field('add','end_time'))" :disabled="disabledObj['end_time_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','end_time')">{{form['end_time']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','teacher_no') || $check_field('add','teacher_no') || $check_field('set','teacher_no')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="教师编号" prop="teacher_no">
													<el-select v-if="user_group === '管理员' || (form['course_selection_information_id'] && $check_field('set','teacher_no')) || (!form['course_selection_information_id'] && $check_field('add','teacher_no'))" id="teacher_no" v-model="form['teacher_no']" :disabled="disabledObj['teacher_no_isDisabled']">
							<el-option v-for="o in list_user_teacher_no" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','teacher_no')" id="teacher_no" v-model="form['teacher_no']" :disabled="true">
							<el-option v-for="o in list_user_teacher_no" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','student_no') || $check_field('add','student_no') || $check_field('set','student_no')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="学生学号" prop="student_no">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_student_no(form['student_no']) }}
							<!--<el-input id="business_name" v-model="form['student_no']" placeholder="请输入学生学号"-->
							<!--v-if="user_group === '管理员' || (form['course_selection_information_id'] && $check_field('set','student_no')) || (!form['course_selection_information_id'] && $check_field('add','student_no'))" :disabled="disabledObj['student_no_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','student_no')">{{form['student_no']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['course_selection_information_id'] && $check_field('set','student_no')) || (!form['course_selection_information_id'] && $check_field('add','student_no'))" id="student_no" v-model="form['student_no']" :disabled="disabledObj['student_no_isDisabled']">
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
							  v-if="user_group === '管理员' || (form['course_selection_information_id'] && $check_field('set','student_name')) || (!form['course_selection_information_id'] && $check_field('add','student_name'))" :disabled="disabledObj['student_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','student_name')">{{form['student_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','course_selection_time') || $check_field('add','course_selection_time') || $check_field('set','course_selection_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="选课时间" prop="course_selection_time">
								<el-date-picker :disabled="disabledObj['course_selection_time_isDisabled']" v-if="user_group === '管理员' || (form['course_selection_information_id'] && $check_field('set','course_selection_time')) || (!form['course_selection_information_id'] && $check_field('add','course_selection_time'))" id="course_selection_time"
						v-model="form['course_selection_time']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','course_selection_time')">{{form['course_selection_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','annotation_notes') || $check_field('add','annotation_notes') || $check_field('set','annotation_notes')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="标注说明" prop="annotation_notes">
												<el-input id="annotation_notes" v-model="form['annotation_notes']" placeholder="请输入标注说明"
							  v-if="user_group === '管理员' || (form['course_selection_information_id'] && $check_field('set','annotation_notes')) || (!form['course_selection_information_id'] && $check_field('add','annotation_notes'))" :disabled="disabledObj['annotation_notes_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','annotation_notes')">{{form['annotation_notes']}}</div>
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
				field: "course_selection_information_id",
				url_add: "~/api/course_selection_information/add?",
				url_set: "~/api/course_selection_information/set?",
				url_get_obj: "~/api/course_selection_information/get_obj?",
				url_upload: "~/api/course_selection_information/upload?",

				query: {
					"course_selection_information_id": 0,
				},

				form: {
								"course_name":  '', // 课程名称
										"class_location":  '', // 上课地点
										"start_time":  '', // 开始时间
										"end_time":  '', // 结束时间
										"teacher_no": 0, // 教师编号
										"student_no": 0, // 学生学号
										"student_name":  '', // 学生姓名
										"course_selection_time":  '', // 选课时间
										"annotation_notes":  '', // 标注说明
											"course_selection_information_id": 0, // ID
						
				},
				disabledObj:{
								"course_name_isDisabled": false,
										"class_location_isDisabled": false,
										"start_time_isDisabled": false,
										"end_time_isDisabled": false,
										"teacher_no_isDisabled": false,
										"student_no_isDisabled": false,
										"student_name_isDisabled": false,
										"course_selection_time_isDisabled": false,
										"annotation_notes_isDisabled": false,
										},

	
		
		
		
		
					// 用户列表
				list_user_teacher_no: [],
				
					// 用户列表
				list_user_student_no: [],
						// 用户组
				group_user_student_no: "",
				
		
		
	
			}
		},
		methods: {


	
	
			
	
			
	
			
	
			
	
				/**
			 * 获取教师用户列表
			 */
			async get_list_user_teacher_no() {
                // if(this.user_group !== "管理员" && this.form["teacher_no"] === 0) {
                //     this.form["teacher_no"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=教师");
                if(json.result && json.result.list){
                    this.list_user_teacher_no = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					get_user_teacher_no(id){
				var obj = this.list_user_teacher_no.getObj({"user_id":id});
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
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
													// 获取缓存数据附加
				form = $.db.get("form");
							$.push(this.form ,form);
																						
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
																        if (this.form["course_selection_time"].indexOf("-")===-1){
          this.form["course_selection_time"] = this.$toTime(parseInt(this.form["course_selection_time"]),"yyyy-MM-dd")
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


																							        if(this.form["course_selection_time"]=="0000-00-00"){
          this.form["course_selection_time"] = null;
        }
				if(parseInt(this.form["course_selection_time"]) > 9999){
					this.form["course_selection_time"] = this.$toTime(parseInt(this.form["course_selection_time"]),"yyyy-MM-dd")
				}
					

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
					bl = this.$check_action('/course_selection_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/course_selection_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/course_selection_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/course_selection_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/course_selection_information/view','get');
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
													this.get_list_user_teacher_no();
								this.get_list_user_student_no();
					this.get_group_user_student_no();
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
