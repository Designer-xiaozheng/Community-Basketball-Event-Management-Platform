<template>
	<div class="diy_edit page_course_selection_information" id="course_selection_information_edit">
		<div class='warp'>
			<div class='container'>
				<div class='row diy_edit_content_box'>
						<div v-if="$check_field('set','course_name') || $check_field('add','course_name') || $check_field('get','course_name')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								课程名称:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_course_name" v-model="form['course_name']" placeholder="请输入课程名称" v-if="(form['course_name'] && $check_field('set','course_name')) || (!form['course_name'] && $check_field('add','course_name'))"  :disabled="disabledObj['course_name_isDisabled']"/>
							<span v-else-if="$check_field('get','course_name')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','class_location') || $check_field('add','class_location') || $check_field('get','class_location')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								上课地点:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_class_location" v-model="form['class_location']" placeholder="请输入上课地点" v-if="(form['class_location'] && $check_field('set','class_location')) || (!form['class_location'] && $check_field('add','class_location'))"  :disabled="disabledObj['class_location_isDisabled']"/>
							<span v-else-if="$check_field('get','class_location')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','start_time') || $check_field('add','start_time') || $check_field('get','start_time')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								开始时间:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_start_time" v-model="form['start_time']" placeholder="请输入开始时间" v-if="(form['start_time'] && $check_field('set','start_time')) || (!form['start_time'] && $check_field('add','start_time'))"  :disabled="disabledObj['start_time_isDisabled']"/>
							<span v-else-if="$check_field('get','start_time')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','end_time') || $check_field('add','end_time') || $check_field('get','end_time')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								结束时间:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_end_time" v-model="form['end_time']" placeholder="请输入结束时间" v-if="(form['end_time'] && $check_field('set','end_time')) || (!form['end_time'] && $check_field('add','end_time'))"  :disabled="disabledObj['end_time_isDisabled']"/>
							<span v-else-if="$check_field('get','end_time')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','teacher_no') || $check_field('add','teacher_no') || $check_field('get','teacher_no')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								教师编号:
							</span>
						</div>
						<div class="diy_field diy_down">
							<select id="form_teacher_no" :disabled="disabledObj['teacher_no_isDisabled']" v-model="form['teacher_no']" v-if="(form['teacher_no'] && $check_field('set','teacher_no')) || (!form['teacher_no'] && $check_field('add','teacher_no'))" >
								<option v-for="o in list_user_teacher_no" :value="o['user_id']">
									{{o['nickname'] + '-' + o['username']}}
								</option>
							</select>
							<span v-else-if="$check_field('get','teacher_no')">{{ form['teacher_no'] }}</span>
						</div>
					</div>
							<div v-if="$check_field('set','student_no') || $check_field('add','student_no') || $check_field('get','student_no')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								学生学号:
							</span>
						</div>
						<div class="diy_field diy_down">
							<select id="form_student_no" :disabled="disabledObj['student_no_isDisabled']" v-model="form['student_no']" v-if="(form['student_no'] && $check_field('set','student_no')) || (!form['student_no'] && $check_field('add','student_no'))" >
								<option v-for="o in list_user_student_no" :value="o['user_id']">
									{{o['nickname'] + '-' + o['username']}}
								</option>
							</select>
							<span v-else-if="$check_field('get','student_no')">{{ form['student_no'] }}</span>
						</div>
					</div>
							<div v-if="$check_field('set','student_name') || $check_field('add','student_name') || $check_field('get','student_name')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								学生姓名:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_student_name" v-model="form['student_name']" placeholder="请输入学生姓名" v-if="(form['student_name'] && $check_field('set','student_name')) || (!form['student_name'] && $check_field('add','student_name'))"  :disabled="disabledObj['student_name_isDisabled']"/>
							<span v-else-if="$check_field('get','student_name')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','course_selection_time') || $check_field('add','course_selection_time') || $check_field('get','course_selection_time')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								选课时间:
							</span>
						</div>
								<!-- 日期 -->
						<div class="diy_field diy_date">
							<input type="date" :disabled="disabledObj['course_selection_time_isDisabled']" id="form_course_selection_time" v-model="form['course_selection_time']" placeholder="请输入选课时间" v-if="(form['course_selection_time'] && $check_field('set','course_selection_time')) || (!form['course_selection_time'] && $check_field('add','course_selection_time'))" />
							<span v-else-if="$check_field('get','course_selection_time')">{{ form['${obj.name}'] }}</span>
						</div>
							</div>
							<div v-if="$check_field('set','annotation_notes') || $check_field('add','annotation_notes') || $check_field('get','annotation_notes')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								标注说明:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_annotation_notes" v-model="form['annotation_notes']" placeholder="请输入标注说明" v-if="(form['annotation_notes'] && $check_field('set','annotation_notes')) || (!form['annotation_notes'] && $check_field('add','annotation_notes'))"  :disabled="disabledObj['annotation_notes_isDisabled']"/>
							<span v-else-if="$check_field('get','annotation_notes')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
	




				</div>
				<div class="diy_edit_submit_box row">
					<div class="col-12">
						<div class="btn_box">
							<button class="btn_submit" @click="submit()">提交</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	import mixin from "@/mixins/page.js";
	export default {
		mixins: [mixin],
		components: {},
		data() {
			return {
				url_get_obj: "~/api/course_selection_information/get_obj?",
				url_add: "~/api/course_selection_information/add?",
				url_set: "~/api/course_selection_information/set?",

				// 登录权限
				oauth: {
					"signIn": true,
					"user_group": []
				},

				// 查询条件
				query: {
						"course_name": "",
							"class_location": "",
							"start_time": "",
							"end_time": "",
							"teacher_no": 0,
							"student_no": 0,
							"student_name": "",
							"course_selection_time": "",
							"annotation_notes": "",
						"course_selection_information_id": 0,
				},

				obj: {
						"course_name":  '', // 课程名称
							"class_location":  '', // 上课地点
							"start_time":  '', // 开始时间
							"end_time":  '', // 结束时间
							"teacher_no": 0, // 教师编号
							"student_no": 0, // 学生学号
							"student_name":  '', // 学生姓名
							"course_selection_time": new Date().getTime(),
							"annotation_notes":  '', // 标注说明
						"course_selection_information_id": 0,
				},

				// 表单字段
				form: {
						"course_name":  '', // 课程名称
							"class_location":  '', // 上课地点
							"start_time":  '', // 开始时间
							"end_time":  '', // 结束时间
							"teacher_no": 0, // 教师编号
							"student_no": 0, // 学生学号
							"student_name":  '', // 学生姓名
							"course_selection_time": new Date().getTime(),
							"annotation_notes":  '', // 标注说明
						"course_selection_information_id": 0,
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
							
				// ID字段
				field: "course_selection_information_id",

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
					async get_user_session_student_no(){
				var _this = this;
				var json = await this.$get("~/api/user_group/get_obj?name=学生");
				if(json.result && json.result.obj){
					var source_table = json.result.obj.source_table;
					var user_id = _this.$store.state.user.user_id;
					if (user_id){
						var url = "~/api/"+source_table+"/get_obj?"
						this.$get(url, {"user_id":_this.$store.state.user.user_id}, function(res) {
							if (res.result && res.result.obj) {
								var arr = []
								for (let key in res.result.obj) {
									arr.push(key)
								}
								var arrForm = []
								for (let key in _this.form) {
									arrForm.push(key)
								}
								_this.form["student_no"] = user_id
								_this.disabledObj['student_no' + '_isDisabled'] = true
								for (var i=0;i<arr.length;i++){
                  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
                    for (var j = 0; j < arrForm.length; j++) {
                      if (arr[i] === arrForm[j]) {
                        if (arr[i] !== "student_no") {
                          _this.form[arrForm[j]] = res.result.obj[arr[i]]
                          _this.disabledObj[arrForm[j] + '_isDisabled'] = true
                          break;
                        }
                      }
                    }
                  }
								}
							}
						});
					}
				}
				else if(json.error){
					console.error(json.error);
				}
			},
	
				
				
				
	
			/**
			 * 修改文件
			 * @param { Object } files 上传文件对象
			 * @param { String } str 表单的属性名
			 */
			change_file(files, str) {
				var form = new FormData();
				form.append("file", files[0]);
				this.$post("~/api/course_selection_information/upload?", form, (res) => {
					if (res.result) {
						this.form[str] = res.result.url;
					} else if (res.error) {
						this.$toast(res.error.message);
					}
				});
			},

			/**
			 * 获取对象后获取缓存表单
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_before(param){
				var form = $.db.get("form");
				// if (form) {
        //   delete(form.examine_state)
        //   delete(form.examine_reply)
        //   this.obj = $.push(this.obj ,form);
				// 	this.form = $.push(this.form ,form);
				// }
				// var arr = []
				// for (let key in form) {
				// 	arr.push(key)
				// }
				// for (var i=0;i<arr.length;i++){
				// 	this.disabledObj[arr[i] + '_isDisabled'] = true
				// }
        if (form) {
          var arr = []
          for (let key in form) {
            arr.push(key)
          }
          var arrForm = []
          for (let key in this.form) {
            arrForm.push(key)
          }
          for (var i=0;i<arr.length;i++){
            if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
              for (var j = 0; j < arrForm.length; j++) {
                if (arrForm[j] === arr[i]) {
                  this.form[arrForm[j]] = form[arr[i]]
                  this.obj[arrForm[j]] = form[arr[i]]
                  this.disabledObj[arrForm[j] + '_isDisabled'] = true
                  break;
                }
              }
            }
          }
        }
																        if (JSON.stringify(this.form["course_selection_time"]).indexOf("-")===-1) {
          this.form["course_selection_time"] = this.$toTime(parseInt(this.form["course_selection_time"]), "yyyy-MM-dd")
        }
			
        $.db.del("form");
				return param;
			},

			/**
			 * 获取对象后获取缓存表单
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json ,func){
				// var form = $.db.get("form");
				// var obj = Object.assign({} ,form ,this.obj);
				// if (obj) {
        //   delete(obj.examine_state)
        //   delete(obj.examine_reply)
				// 	this.obj = $.push(this.obj ,obj);
				// }
				// if (form) {
        //   delete(form.examine_state)
        //   delete(form.examine_reply)
				// 	this.form = $.push(this.form ,form);
				// }
				if(func){
					func(json);
				}
			},

		},
		created() {
																		this.get_list_user_teacher_no();
						this.get_user_session_student_no();
					this.get_list_user_student_no();
												},
	}
</script>

<style>




</style>
