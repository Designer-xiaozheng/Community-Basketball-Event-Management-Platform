<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','course_name') || $check_field('add','course_name') || $check_field('set','course_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="课程名称" prop="course_name">
												<el-input id="course_name" v-model="form['course_name']" placeholder="请输入课程名称"
							  v-if="user_group === '管理员' || (form['course_test_id'] && $check_field('set','course_name')) || (!form['course_test_id'] && $check_field('add','course_name'))" :disabled="disabledObj['course_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','course_name')">{{form['course_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','teacher_no') || $check_field('add','teacher_no') || $check_field('set','teacher_no')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="教师编号" prop="teacher_no">
													<el-select v-if="user_group === '管理员' || (form['course_test_id'] && $check_field('set','teacher_no')) || (!form['course_test_id'] && $check_field('add','teacher_no'))" id="teacher_no" v-model="form['teacher_no']" :disabled="disabledObj['teacher_no_isDisabled']">
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
													<el-select v-if="user_group === '管理员' || (form['course_test_id'] && $check_field('set','student_no')) || (!form['course_test_id'] && $check_field('add','student_no'))" id="student_no" v-model="form['student_no']" :disabled="disabledObj['student_no_isDisabled']">
							<el-option v-for="o in list_user_student_no" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','student_no')" id="student_no" v-model="form['student_no']" :disabled="true">
							<el-option v-for="o in list_user_student_no" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','student_name') || $check_field('add','student_name') || $check_field('set','student_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="学生姓名" prop="student_name">
												<el-input id="student_name" v-model="form['student_name']" placeholder="请输入学生姓名"
							  v-if="user_group === '管理员' || (form['course_test_id'] && $check_field('set','student_name')) || (!form['course_test_id'] && $check_field('add','student_name'))" :disabled="disabledObj['student_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','student_name')">{{form['student_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','test_name') || $check_field('add','test_name') || $check_field('set','test_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="测试名称" prop="test_name">
												<el-input id="test_name" v-model="form['test_name']" placeholder="请输入测试名称"
							  v-if="user_group === '管理员' || (form['course_test_id'] && $check_field('set','test_name')) || (!form['course_test_id'] && $check_field('add','test_name'))" :disabled="disabledObj['test_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','test_name')">{{form['test_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','release_time') || $check_field('add','release_time') || $check_field('set','release_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="发布时间" prop="release_time">
								<el-date-picker :disabled="disabledObj['release_time_isDisabled']" v-if="user_group === '管理员' || (form['course_test_id'] && $check_field('set','release_time')) || (!form['course_test_id'] && $check_field('add','release_time'))" id="release_time"
						v-model="form['release_time']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','release_time')">{{form['release_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','test_content') || $check_field('add','test_content') || $check_field('set','test_content')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="测试内容" prop="test_content">
												<div v-if="disabledObj['test_content_isDisabled']">
						<div v-if="$check_field('get','test_content')">
							<el-button type="primary" @click="$download($fullUrl(form['test_content']),form['test_content'])">下载<i
									class="el-icon-download el-icon--right"></i></el-button>
						</div>
					</div>
					<div v-else>
						<el-upload v-if="user_group === '管理员' || (form['course_test_id'] && $check_field('set','test_content')) || (!form['course_test_id'] && $check_field('add','test_content'))" class="upload-demo" drag
								   action="" style="max-width: 300px;width: 100%;" :http-request="upload_test_content" :limit="1" accept="">
							<i class="el-icon-upload"></i>
							<div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
						</el-upload>
						<div v-else-if="$check_field('get','test_content')">
							<el-button type="primary" @click="$download($fullUrl(form['test_content']),form['test_content'])">下载<i
									class="el-icon-download el-icon--right"></i></el-button>
						</div>
					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','description_of_requirements') || $check_field('add','description_of_requirements') || $check_field('set','description_of_requirements')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="要求说明" prop="description_of_requirements">
								<el-input type="textarea" id="description_of_requirements" v-model="form['description_of_requirements']" placeholder="请输入要求说明"
						v-if="user_group === '管理员' || (form['course_test_id'] && $check_field('set','description_of_requirements')) || (!form['course_test_id'] && $check_field('add','description_of_requirements'))" :disabled="disabledObj['description_of_requirements_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','description_of_requirements')">{{form['description_of_requirements']}}</div>
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
				field: "course_test_id",
				url_add: "~/api/course_test/add?",
				url_set: "~/api/course_test/set?",
				url_get_obj: "~/api/course_test/get_obj?",
				url_upload: "~/api/course_test/upload?",

				query: {
					"course_test_id": 0,
				},

				form: {
								"course_name":  '', // 课程名称
										"teacher_no": 0, // 教师编号
										"student_no": 0, // 学生学号
										"student_name":  '', // 学生姓名
										"test_name":  '', // 测试名称
										"release_time":  '', // 发布时间
										"test_content":  '', // 测试内容
										"description_of_requirements":  '', // 要求说明
											"course_test_id": 0, // ID
						
				},
				disabledObj:{
								"course_name_isDisabled": false,
										"teacher_no_isDisabled": false,
										"student_no_isDisabled": false,
										"student_name_isDisabled": false,
										"test_name_isDisabled": false,
										"release_time_isDisabled": false,
										"test_content_isDisabled": false,
										"description_of_requirements_isDisabled": false,
										},

	
		
					// 用户列表
				list_user_teacher_no: [],
				
					// 用户列表
				list_user_student_no: [],
				
		
		
		
		
	
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
			 * 上传测试内容
			 * @param {Object} param 文件参数
			 */
			upload_test_content(param){
						this.uploadFile(param.file, "test_content");
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
												        if (this.form["release_time"].indexOf("-")===-1){
          this.form["release_time"] = this.$toTime(parseInt(this.form["release_time"]),"yyyy-MM-dd")
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


																	        if(this.form["release_time"]=="0000-00-00"){
          this.form["release_time"] = null;
        }
				if(parseInt(this.form["release_time"]) > 9999){
					this.form["release_time"] = this.$toTime(parseInt(this.form["release_time"]),"yyyy-MM-dd")
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
					bl = this.$check_action('/course_test/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/course_test/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/course_test/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/course_test/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/course_test/view','get');
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
