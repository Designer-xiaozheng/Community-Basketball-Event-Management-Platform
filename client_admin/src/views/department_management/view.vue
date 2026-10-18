<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','name_of_department') || $check_field('add','name_of_department') || $check_field('set','name_of_department')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="院系名称" prop="name_of_department">
												<el-input id="name_of_department" v-model="form['name_of_department']" placeholder="请输入院系名称"
							  v-if="user_group === '管理员' || (form['department_management_id'] && $check_field('set','name_of_department')) || (!form['department_management_id'] && $check_field('add','name_of_department'))" :disabled="disabledObj['name_of_department_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','name_of_department')">{{form['name_of_department']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','person_in_charge') || $check_field('add','person_in_charge') || $check_field('set','person_in_charge')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="负责人" prop="person_in_charge">
												<el-input id="person_in_charge" v-model="form['person_in_charge']" placeholder="请输入负责人"
							  v-if="user_group === '管理员' || (form['department_management_id'] && $check_field('set','person_in_charge')) || (!form['department_management_id'] && $check_field('add','person_in_charge'))" :disabled="disabledObj['person_in_charge_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','person_in_charge')">{{form['person_in_charge']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','details') || $check_field('add','details') || $check_field('set','details')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="详情介绍" prop="details">
								<el-input type="textarea" id="details" v-model="form['details']" placeholder="请输入详情介绍"
						v-if="user_group === '管理员' || (form['department_management_id'] && $check_field('set','details')) || (!form['department_management_id'] && $check_field('add','details'))" :disabled="disabledObj['details_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','details')">{{form['details']}}</div>
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
				field: "department_management_id",
				url_add: "~/api/department_management/add?",
				url_set: "~/api/department_management/set?",
				url_get_obj: "~/api/department_management/get_obj?",
				url_upload: "~/api/department_management/upload?",

				query: {
					"department_management_id": 0,
				},

				form: {
								"name_of_department":  '', // 院系名称
										"person_in_charge":  '', // 负责人
										"details":  '', // 详情介绍
											"department_management_id": 0, // ID
						
				},
				disabledObj:{
								"name_of_department_isDisabled": false,
										"person_in_charge_isDisabled": false,
										"details_isDisabled": false,
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
					bl = this.$check_action('/department_management/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/department_management/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/department_management/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/department_management/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/department_management/view','get');
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
