<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','course_name') || $check_field('add','course_name') || $check_field('set','course_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="课程名称" prop="course_name">
												<el-input id="course_name" v-model="form['course_name']" placeholder="请输入课程名称"
							  v-if="user_group === '管理员' || (form['submit_test_id'] && $check_field('set','course_name')) || (!form['submit_test_id'] && $check_field('add','course_name'))" :disabled="disabledObj['course_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','course_name')">{{form['course_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','teacher_no') || $check_field('add','teacher_no') || $check_field('set','teacher_no')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="教师编号" prop="teacher_no">
													<el-select v-if="user_group === '管理员' || (form['submit_test_id'] && $check_field('set','teacher_no')) || (!form['submit_test_id'] && $check_field('add','teacher_no'))" id="teacher_no" v-model="form['teacher_no']" :disabled="disabledObj['teacher_no_isDisabled']">
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
													<el-select v-if="user_group === '管理员' || (form['submit_test_id'] && $check_field('set','student_no')) || (!form['submit_test_id'] && $check_field('add','student_no'))" id="student_no" v-model="form['student_no']" :disabled="disabledObj['student_no_isDisabled']">
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
							  v-if="user_group === '管理员' || (form['submit_test_id'] && $check_field('set','student_name')) || (!form['submit_test_id'] && $check_field('add','student_name'))" :disabled="disabledObj['student_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','student_name')">{{form['student_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','test_name') || $check_field('add','test_name') || $check_field('set','test_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="测试名称" prop="test_name">
												<el-input id="test_name" v-model="form['test_name']" placeholder="请输入测试名称"
							  v-if="user_group === '管理员' || (form['submit_test_id'] && $check_field('set','test_name')) || (!form['submit_test_id'] && $check_field('add','test_name'))" :disabled="disabledObj['test_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','test_name')">{{form['test_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','release_time') || $check_field('add','release_time') || $check_field('set','release_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="发布时间" prop="release_time">
												<el-input id="release_time" v-model="form['release_time']" placeholder="请输入发布时间"
							  v-if="user_group === '管理员' || (form['submit_test_id'] && $check_field('set','release_time')) || (!form['submit_test_id'] && $check_field('add','release_time'))" :disabled="disabledObj['release_time_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','release_time')">{{form['release_time']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','submission_time') || $check_field('add','submission_time') || $check_field('set','submission_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="提交时间" prop="submission_time">
								<el-date-picker :disabled="disabledObj['submission_time_isDisabled']" v-if="user_group === '管理员' || (form['submit_test_id'] && $check_field('set','submission_time')) || (!form['submit_test_id'] && $check_field('add','submission_time'))" id="submission_time"
						v-model="form['submission_time']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','submission_time')">{{form['submission_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','related_attachments') || $check_field('add','related_attachments') || $check_field('set','related_attachments')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="相关附件" prop="related_attachments">
												<div v-if="disabledObj['related_attachments_isDisabled']">
						<div v-if="$check_field('get','related_attachments')">
							<el-button type="primary" @click="$download($fullUrl(form['related_attachments']),form['related_attachments'])">下载<i
									class="el-icon-download el-icon--right"></i></el-button>
						</div>
					</div>
					<div v-else>
						<el-upload v-if="user_group === '管理员' || (form['submit_test_id'] && $check_field('set','related_attachments')) || (!form['submit_test_id'] && $check_field('add','related_attachments'))" class="upload-demo" drag
								   action="" style="max-width: 300px;width: 100%;" :http-request="upload_related_attachments" :limit="1" accept="">
							<i class="el-icon-upload"></i>
							<div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
						</el-upload>
						<div v-else-if="$check_field('get','related_attachments')">
							<el-button type="primary" @click="$download($fullUrl(form['related_attachments']),form['related_attachments'])">下载<i
									class="el-icon-download el-icon--right"></i></el-button>
						</div>
					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','remarks') || $check_field('add','remarks') || $check_field('set','remarks')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="备注" prop="remarks">
												<el-input id="remarks" v-model="form['remarks']" placeholder="请输入备注"
							  v-if="user_group === '管理员' || (form['submit_test_id'] && $check_field('set','remarks')) || (!form['submit_test_id'] && $check_field('add','remarks'))" :disabled="disabledObj['remarks_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','remarks')">{{form['remarks']}}</div>
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
				field: "submit_test_id",
				url_add: "~/api/submit_test/add?",
				url_set: "~/api/submit_test/set?",
				url_get_obj: "~/api/submit_test/get_obj?",
				url_upload: "~/api/submit_test/upload?",

				query: {
					"submit_test_id": 0,
				},

				form: {
								"course_name":  '', // 课程名称
										"teacher_no": 0, // 教师编号
										"student_no": 0, // 学生学号
										"student_name":  '', // 学生姓名
										"test_name":  '', // 测试名称
										"release_time":  '', // 发布时间
										"submission_time":  '', // 提交时间
										"related_attachments":  '', // 相关附件
										"remarks":  '', // 备注
											"submit_test_id": 0, // ID
						
				},
				disabledObj:{
								"course_name_isDisabled": false,
										"teacher_no_isDisabled": false,
										"student_no_isDisabled": false,
										"student_name_isDisabled": false,
										"test_name_isDisabled": false,
										"release_time_isDisabled": false,
										"submission_time_isDisabled": false,
										"related_attachments_isDisabled": false,
										"remarks_isDisabled": false,
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
			 * 上传相关附件
			 * @param {Object} param 文件参数
			 */
			upload_related_attachments(param){
						this.uploadFile(param.file, "related_attachments");
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
														        if (this.form["submission_time"].indexOf("-")===-1){
          this.form["submission_time"] = this.$toTime(parseInt(this.form["submission_time"]),"yyyy-MM-dd")
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


																				        if(this.form["submission_time"]=="0000-00-00"){
          this.form["submission_time"] = null;
        }
				if(parseInt(this.form["submission_time"]) > 9999){
					this.form["submission_time"] = this.$toTime(parseInt(this.form["submission_time"]),"yyyy-MM-dd")
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
					bl = this.$check_action('/submit_test/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/submit_test/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/submit_test/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/submit_test/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/submit_test/view','get');
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
