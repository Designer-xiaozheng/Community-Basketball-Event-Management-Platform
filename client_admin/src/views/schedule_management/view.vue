<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','title') || $check_field('add','title') || $check_field('set','title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="标题" prop="title">
												<el-input id="title" v-model="form['title']" placeholder="请输入标题"
							  v-if="user_group === '管理员' || (form['schedule_management_id'] && $check_field('set','title')) || (!form['schedule_management_id'] && $check_field('add','title'))" :disabled="disabledObj['title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','title')">{{form['title']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','date') || $check_field('add','date') || $check_field('set','date')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="日期" prop="date">
								<el-date-picker :disabled="disabledObj['date_isDisabled']" v-if="user_group === '管理员' || (form['schedule_management_id'] && $check_field('set','date')) || (!form['schedule_management_id'] && $check_field('add','date'))" id="date"
						v-model="form['date']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','date')">{{form['date']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','the_first_class') || $check_field('add','the_first_class') || $check_field('set','the_first_class')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="第一节课" prop="the_first_class">
												<el-input id="the_first_class" v-model="form['the_first_class']" placeholder="请输入第一节课"
							  v-if="user_group === '管理员' || (form['schedule_management_id'] && $check_field('set','the_first_class')) || (!form['schedule_management_id'] && $check_field('add','the_first_class'))" :disabled="disabledObj['the_first_class_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','the_first_class')">{{form['the_first_class']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','the_second_class') || $check_field('add','the_second_class') || $check_field('set','the_second_class')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="第二节课" prop="the_second_class">
												<el-input id="the_second_class" v-model="form['the_second_class']" placeholder="请输入第二节课"
							  v-if="user_group === '管理员' || (form['schedule_management_id'] && $check_field('set','the_second_class')) || (!form['schedule_management_id'] && $check_field('add','the_second_class'))" :disabled="disabledObj['the_second_class_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','the_second_class')">{{form['the_second_class']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','the_third_class') || $check_field('add','the_third_class') || $check_field('set','the_third_class')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="第三节课" prop="the_third_class">
												<el-input id="the_third_class" v-model="form['the_third_class']" placeholder="请输入第三节课"
							  v-if="user_group === '管理员' || (form['schedule_management_id'] && $check_field('set','the_third_class')) || (!form['schedule_management_id'] && $check_field('add','the_third_class'))" :disabled="disabledObj['the_third_class_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','the_third_class')">{{form['the_third_class']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','the_fourth_class') || $check_field('add','the_fourth_class') || $check_field('set','the_fourth_class')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="第四节课" prop="the_fourth_class">
												<el-input id="the_fourth_class" v-model="form['the_fourth_class']" placeholder="请输入第四节课"
							  v-if="user_group === '管理员' || (form['schedule_management_id'] && $check_field('set','the_fourth_class')) || (!form['schedule_management_id'] && $check_field('add','the_fourth_class'))" :disabled="disabledObj['the_fourth_class_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','the_fourth_class')">{{form['the_fourth_class']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','section_5') || $check_field('add','section_5') || $check_field('set','section_5')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="第五节课" prop="section_5">
												<el-input id="section_5" v-model="form['section_5']" placeholder="请输入第五节课"
							  v-if="user_group === '管理员' || (form['schedule_management_id'] && $check_field('set','section_5')) || (!form['schedule_management_id'] && $check_field('add','section_5'))" :disabled="disabledObj['section_5_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','section_5')">{{form['section_5']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','section_6') || $check_field('add','section_6') || $check_field('set','section_6')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="第六节课" prop="section_6">
												<el-input id="section_6" v-model="form['section_6']" placeholder="请输入第六节课"
							  v-if="user_group === '管理员' || (form['schedule_management_id'] && $check_field('set','section_6')) || (!form['schedule_management_id'] && $check_field('add','section_6'))" :disabled="disabledObj['section_6_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','section_6')">{{form['section_6']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','section_7') || $check_field('add','section_7') || $check_field('set','section_7')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="第七节课" prop="section_7">
												<el-input id="section_7" v-model="form['section_7']" placeholder="请输入第七节课"
							  v-if="user_group === '管理员' || (form['schedule_management_id'] && $check_field('set','section_7')) || (!form['schedule_management_id'] && $check_field('add','section_7'))" :disabled="disabledObj['section_7_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','section_7')">{{form['section_7']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','section_8') || $check_field('add','section_8') || $check_field('set','section_8')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="第八节课" prop="section_8">
												<el-input id="section_8" v-model="form['section_8']" placeholder="请输入第八节课"
							  v-if="user_group === '管理员' || (form['schedule_management_id'] && $check_field('set','section_8')) || (!form['schedule_management_id'] && $check_field('add','section_8'))" :disabled="disabledObj['section_8_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','section_8')">{{form['section_8']}}</div>
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
				field: "schedule_management_id",
				url_add: "~/api/schedule_management/add?",
				url_set: "~/api/schedule_management/set?",
				url_get_obj: "~/api/schedule_management/get_obj?",
				url_upload: "~/api/schedule_management/upload?",

				query: {
					"schedule_management_id": 0,
				},

				form: {
								"title":  '', // 标题
										"date":  '', // 日期
										"the_first_class":  '', // 第一节课
										"the_second_class":  '', // 第二节课
										"the_third_class":  '', // 第三节课
										"the_fourth_class":  '', // 第四节课
										"section_5":  '', // 第五节课
										"section_6":  '', // 第六节课
										"section_7":  '', // 第七节课
										"section_8":  '', // 第八节课
											"schedule_management_id": 0, // ID
						
				},
				disabledObj:{
								"title_isDisabled": false,
										"date_isDisabled": false,
										"the_first_class_isDisabled": false,
										"the_second_class_isDisabled": false,
										"the_third_class_isDisabled": false,
										"the_fourth_class_isDisabled": false,
										"section_5_isDisabled": false,
										"section_6_isDisabled": false,
										"section_7_isDisabled": false,
										"section_8_isDisabled": false,
										},

	
		
		
		
		
		
		
		
		
		
	
			}
		},
		methods: {


	
	
			
	
			
	
			
	
			
	
			
	
			
	
			
	
			
	
			
	
		
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
				        if (this.form["date"].indexOf("-")===-1){
          this.form["date"] = this.$toTime(parseInt(this.form["date"]),"yyyy-MM-dd")
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


					        if(this.form["date"]=="0000-00-00"){
          this.form["date"] = null;
        }
				if(parseInt(this.form["date"]) > 9999){
					this.form["date"] = this.$toTime(parseInt(this.form["date"]),"yyyy-MM-dd")
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
					bl = this.$check_action('/schedule_management/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/schedule_management/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/schedule_management/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/schedule_management/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/schedule_management/view','get');
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
