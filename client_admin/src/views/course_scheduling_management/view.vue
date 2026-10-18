<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','title') || $check_field('add','title') || $check_field('set','title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="标题" prop="title">
												<el-input id="title" v-model="form['title']" placeholder="请输入标题"
							  v-if="user_group === '管理员' || (form['course_scheduling_management_id'] && $check_field('set','title')) || (!form['course_scheduling_management_id'] && $check_field('add','title'))" :disabled="disabledObj['title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','title')">{{form['title']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','course_name') || $check_field('add','course_name') || $check_field('set','course_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="课程名称" prop="course_name">
												<el-input id="course_name" v-model="form['course_name']" placeholder="请输入课程名称"
							  v-if="user_group === '管理员' || (form['course_scheduling_management_id'] && $check_field('set','course_name')) || (!form['course_scheduling_management_id'] && $check_field('add','course_name'))" :disabled="disabledObj['course_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','course_name')">{{form['course_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','class_location') || $check_field('add','class_location') || $check_field('set','class_location')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="上课地点" prop="class_location">
								<el-select id="class_location" v-model="form['class_location']"
						v-if="user_group === '管理员' || (form['course_scheduling_management_id'] && $check_field('set','class_location')) || (!form['course_scheduling_management_id'] && $check_field('add','class_location'))">
						<el-option v-for="o in list_class_location" :key="o['classroom_name']" :label="o['classroom_name']"
							:value="o['classroom_name']">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','class_location')">{{form['class_location']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','start_time') || $check_field('add','start_time') || $check_field('set','start_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="开始时间" prop="start_time">
								<el-date-picker :disabled="disabledObj['start_time_isDisabled']" v-if="user_group === '管理员' || (form['course_scheduling_management_id'] && $check_field('set','start_time')) || (!form['course_scheduling_management_id'] && $check_field('add','start_time'))" id="start_time"
						v-model="form['start_time']" type="datetime" placeholder="选择日期时间">
					</el-date-picker>
					<div v-else-if="$check_field('get','start_time')">{{form['start_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','end_time') || $check_field('add','end_time') || $check_field('set','end_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="结束时间" prop="end_time">
								<el-date-picker :disabled="disabledObj['end_time_isDisabled']" v-if="user_group === '管理员' || (form['course_scheduling_management_id'] && $check_field('set','end_time')) || (!form['course_scheduling_management_id'] && $check_field('add','end_time'))" id="end_time"
						v-model="form['end_time']" type="datetime" placeholder="选择日期时间">
					</el-date-picker>
					<div v-else-if="$check_field('get','end_time')">{{form['end_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','teacher_no') || $check_field('add','teacher_no') || $check_field('set','teacher_no')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="教师编号" prop="teacher_no">
													<el-select v-if="user_group === '管理员' || (form['course_scheduling_management_id'] && $check_field('set','teacher_no')) || (!form['course_scheduling_management_id'] && $check_field('add','teacher_no'))" id="teacher_no" v-model="form['teacher_no']" :disabled="disabledObj['teacher_no_isDisabled']">
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
								<el-col v-if="user_group === '管理员' || $check_field('get','full_name') || $check_field('add','full_name') || $check_field('set','full_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="姓名" prop="full_name">
												<el-input id="full_name" v-model="form['full_name']" placeholder="请输入姓名"
							  v-if="user_group === '管理员' || (form['course_scheduling_management_id'] && $check_field('set','full_name')) || (!form['course_scheduling_management_id'] && $check_field('add','full_name'))" :disabled="disabledObj['full_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','full_name')">{{form['full_name']}}</div>
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
				field: "course_scheduling_management_id",
				url_add: "~/api/course_scheduling_management/add?",
				url_set: "~/api/course_scheduling_management/set?",
				url_get_obj: "~/api/course_scheduling_management/get_obj?",
				url_upload: "~/api/course_scheduling_management/upload?",

				query: {
					"course_scheduling_management_id": 0,
				},

				form: {
								"title":  '', // 标题
										"course_name":  '', // 课程名称
										"class_location":  '', // 上课地点
										"start_time":  '', // 开始时间
										"end_time":  '', // 结束时间
										"teacher_no": 0, // 教师编号
										"full_name":  '', // 姓名
											"course_scheduling_management_id": 0, // ID
						
				},
				disabledObj:{
								"title_isDisabled": false,
										"course_name_isDisabled": false,
										"class_location_isDisabled": false,
										"start_time_isDisabled": false,
										"end_time_isDisabled": false,
										"teacher_no_isDisabled": false,
										"full_name_isDisabled": false,
										},

	
		
						// 上课地点选项列表
				list_class_location: [""],
	
		
		
		
					// 用户列表
				list_user_teacher_no: [],
				
	
			}
		},
		methods: {


	
	
			
	
			
				/**
			 * 获取上课地点列表
			 */
			async get_list_class_location() {
				var json = await this.$get("~/api/classroom_management/get_list?");
				if(json.result && json.result.list){
					this.list_class_location = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
	
			
	
			
	
			
	
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
							        if (this.form["start_time"].indexOf("-")===-1){
            this.form["start_time"] = this.$toTime(parseInt(this.form["start_time"]),"yyyy-MM-dd hh:mm:ss")
        }
			        if (this.form["end_time"].indexOf("-")===-1){
            this.form["end_time"] = this.$toTime(parseInt(this.form["end_time"]),"yyyy-MM-dd hh:mm:ss")
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


										        if(this.form["start_time"]=="0000-00-00 00:00:00"){
          this.form["start_time"] = null;
        }
				if(parseInt(this.form["start_time"]) > 9999){
					this.form["start_time"] = this.$toTime(parseInt(this.form["start_time"]),"yyyy-MM-dd hh:mm:ss")
				}
				        if(this.form["end_time"]=="0000-00-00 00:00:00"){
          this.form["end_time"] = null;
        }
				if(parseInt(this.form["end_time"]) > 9999){
					this.form["end_time"] = this.$toTime(parseInt(this.form["end_time"]),"yyyy-MM-dd hh:mm:ss")
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
					bl = this.$check_action('/course_scheduling_management/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/course_scheduling_management/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/course_scheduling_management/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/course_scheduling_management/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/course_scheduling_management/view','get');
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
								this.get_list_class_location();
											this.get_list_user_teacher_no();
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
