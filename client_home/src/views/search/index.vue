<template>
  <div class="page_search">
	<div class="warp">
	  <div class="container">
		<div class="row">
		  <div class="col-12">
			<div class="card_result_search">
			  <div class="title">搜索结果</div>

				<!-- 文章搜索结果 -->
			  <list_result_search
				:list="result_article"
				title="校园资讯"
				source_table="article"
			  ></list_result_search>


									  <list_result_search
				v-if="$check_action('/student/list', 'get')"
				:list="result_student_student_name"
				title="学生学生姓名"
				source_table="student"
			  ></list_result_search>
															  <list_result_search
				v-if="$check_action('/teacher/list', 'get')"
				:list="result_teacher_full_name"
				title="教师姓名"
				source_table="teacher"
			  ></list_result_search>
																					  <list_result_search
				v-if="$check_action('/student_information/list', 'get')"
				:list="result_student_information_student_name"
				title="学生信息学生姓名"
				source_table="student_information"
			  ></list_result_search>
																					  <list_result_search
				v-if="$check_action('/department_management/list', 'get')"
				:list="result_department_management_name_of_department"
				title="院系管理院系名称"
				source_table="department_management"
			  ></list_result_search>
															  <list_result_search
				v-if="$check_action('/professional_management/list', 'get')"
				:list="result_professional_management_major_name"
				title="专业管理专业名称"
				source_table="professional_management"
			  ></list_result_search>
									  <list_result_search
				v-if="$check_action('/class_management/list', 'get')"
				:list="result_class_management_class_name"
				title="班级管理班级名称"
				source_table="class_management"
			  ></list_result_search>
									  <list_result_search
				v-if="$check_action('/course_information/list', 'get')"
				:list="result_course_information_course_no"
				title="课程信息课程编号"
				source_table="course_information"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/course_information/list', 'get')"
				:list="result_course_information_course_name"
				title="课程信息课程名称"
				source_table="course_information"
			  ></list_result_search>
																														  <list_result_search
				v-if="$check_action('/classroom_management/list', 'get')"
				:list="result_classroom_management_classroom_name"
				title="教室管理教室名称"
				source_table="classroom_management"
			  ></list_result_search>
												  <list_result_search
				v-if="$check_action('/course_selection_information/list', 'get')"
				:list="result_course_selection_information_course_name"
				title="选课信息课程名称"
				source_table="course_selection_information"
			  ></list_result_search>
																							  <list_result_search
				v-if="$check_action('/course_selection_information/list', 'get')"
				:list="result_course_selection_information_student_name"
				title="选课信息学生姓名"
				source_table="course_selection_information"
			  ></list_result_search>
															  <list_result_search
				v-if="$check_action('/course_test/list', 'get')"
				:list="result_course_test_course_name"
				title="课程测试课程名称"
				source_table="course_test"
			  ></list_result_search>
														  <list_result_search
				v-if="$check_action('/course_test/list', 'get')"
				:list="result_course_test_student_name"
				title="课程测试学生姓名"
				source_table="course_test"
			  ></list_result_search>
																					  <list_result_search
				v-if="$check_action('/submit_test/list', 'get')"
				:list="result_submit_test_course_name"
				title="提交测试课程名称"
				source_table="submit_test"
			  ></list_result_search>
														  <list_result_search
				v-if="$check_action('/submit_test/list', 'get')"
				:list="result_submit_test_student_name"
				title="提交测试学生姓名"
				source_table="submit_test"
			  ></list_result_search>
																								  <list_result_search
				v-if="$check_action('/score_entry/list', 'get')"
				:list="result_score_entry_course_name"
				title="成绩录入课程名称"
				source_table="score_entry"
			  ></list_result_search>
														  <list_result_search
				v-if="$check_action('/score_entry/list', 'get')"
				:list="result_score_entry_student_name"
				title="成绩录入学生姓名"
				source_table="score_entry"
			  ></list_result_search>
																					  <list_result_search
				v-if="$check_action('/course_scheduling_management/list', 'get')"
				:list="result_course_scheduling_management_title"
				title="排课管理标题"
				source_table="course_scheduling_management"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/course_scheduling_management/list', 'get')"
				:list="result_course_scheduling_management_course_name"
				title="排课管理课程名称"
				source_table="course_scheduling_management"
			  ></list_result_search>
																								  <list_result_search
				v-if="$check_action('/schedule_management/list', 'get')"
				:list="result_schedule_management_title"
				title="课表管理标题"
				source_table="schedule_management"
			  ></list_result_search>
																																	</div>
		  </div>
		</div>
	  </div>
	</div>
  </div>
</template>

<script>
import mixin from "../../mixins/page.js";
import list_result_search from "../../components/diy/list_result_search.vue";

export default {
  mixins: [mixin],
  data() {
	return {
	  "query": {
		word: "",
	  },
	  "result_article": [],
									"result_student_student_name":[],
															"result_teacher_full_name":[],
																					"result_student_information_student_name":[],
																					"result_department_management_name_of_department":[],
															"result_professional_management_major_name":[],
									"result_class_management_class_name":[],
									"result_course_information_course_no":[],
								"result_course_information_course_name":[],
																														"result_classroom_management_classroom_name":[],
												"result_course_selection_information_course_name":[],
																							"result_course_selection_information_student_name":[],
															"result_course_test_course_name":[],
														"result_course_test_student_name":[],
																					"result_submit_test_course_name":[],
														"result_submit_test_student_name":[],
																								"result_score_entry_course_name":[],
														"result_score_entry_student_name":[],
																					"result_course_scheduling_management_title":[],
								"result_course_scheduling_management_course_name":[],
																								"result_schedule_management_title":[],
																															};
  },
  methods: {
	/**
	 * 获取文章
	 */
	get_article() {
	  this.$get("~/api/article/get_list?like=0", { page: 1, size: 10, title: this.query.word }, (json) => {
		if (json.result) {
		  this.result_article = json.result.list;
		}
	  });
	},

							/**
	 * 获取student_name
	 */
	get_student_student_name(){
		this.$get("~/api/student/get_list?like=0", { page: 1, size: 10, "student_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_student_student_name = json.result.list;
			result_student_student_name.map(o => o.title = o['student_name'])
	  			this.result_student_student_name = result_student_student_name
		 	}
		});
	},
													/**
	 * 获取full_name
	 */
	get_teacher_full_name(){
		this.$get("~/api/teacher/get_list?like=0", { page: 1, size: 10, "full_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_teacher_full_name = json.result.list;
			result_teacher_full_name.map(o => o.title = o['full_name'])
	  			this.result_teacher_full_name = result_teacher_full_name
		 	}
		});
	},
																			/**
	 * 获取student_name
	 */
	get_student_information_student_name(){
		this.$get("~/api/student_information/get_list?like=0", { page: 1, size: 10, "student_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_student_information_student_name = json.result.list;
			result_student_information_student_name.map(o => o.title = o['student_name'])
	  			this.result_student_information_student_name = result_student_information_student_name
		 	}
		});
	},
																			/**
	 * 获取name_of_department
	 */
	get_department_management_name_of_department(){
		this.$get("~/api/department_management/get_list?like=0", { page: 1, size: 10, "name_of_department": this.query.word }, (json) => {
		  if (json.result) {
			var result_department_management_name_of_department = json.result.list;
			result_department_management_name_of_department.map(o => o.title = o['name_of_department'])
	  			this.result_department_management_name_of_department = result_department_management_name_of_department
		 	}
		});
	},
													/**
	 * 获取major_name
	 */
	get_professional_management_major_name(){
		this.$get("~/api/professional_management/get_list?like=0", { page: 1, size: 10, "major_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_professional_management_major_name = json.result.list;
			result_professional_management_major_name.map(o => o.title = o['major_name'])
	  			this.result_professional_management_major_name = result_professional_management_major_name
		 	}
		});
	},
							/**
	 * 获取class_name
	 */
	get_class_management_class_name(){
		this.$get("~/api/class_management/get_list?like=0", { page: 1, size: 10, "class_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_class_management_class_name = json.result.list;
			result_class_management_class_name.map(o => o.title = o['class_name'])
	  			this.result_class_management_class_name = result_class_management_class_name
		 	}
		});
	},
							/**
	 * 获取course_no
	 */
	get_course_information_course_no(){
		this.$get("~/api/course_information/get_list?like=0", { page: 1, size: 10, "course_no": this.query.word }, (json) => {
		  if (json.result) {
			var result_course_information_course_no = json.result.list;
			result_course_information_course_no.map(o => o.title = o['course_no'])
	  			this.result_course_information_course_no = result_course_information_course_no
		 	}
		});
	},
						/**
	 * 获取course_name
	 */
	get_course_information_course_name(){
		this.$get("~/api/course_information/get_list?like=0", { page: 1, size: 10, "course_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_course_information_course_name = json.result.list;
			result_course_information_course_name.map(o => o.title = o['course_name'])
	  			this.result_course_information_course_name = result_course_information_course_name
		 	}
		});
	},
																												/**
	 * 获取classroom_name
	 */
	get_classroom_management_classroom_name(){
		this.$get("~/api/classroom_management/get_list?like=0", { page: 1, size: 10, "classroom_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_classroom_management_classroom_name = json.result.list;
			result_classroom_management_classroom_name.map(o => o.title = o['classroom_name'])
	  			this.result_classroom_management_classroom_name = result_classroom_management_classroom_name
		 	}
		});
	},
										/**
	 * 获取course_name
	 */
	get_course_selection_information_course_name(){
		this.$get("~/api/course_selection_information/get_list?like=0", { page: 1, size: 10, "course_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_course_selection_information_course_name = json.result.list;
			result_course_selection_information_course_name.map(o => o.title = o['course_name'])
	  			this.result_course_selection_information_course_name = result_course_selection_information_course_name
		 	}
		});
	},
																					/**
	 * 获取student_name
	 */
	get_course_selection_information_student_name(){
		this.$get("~/api/course_selection_information/get_list?like=0", { page: 1, size: 10, "student_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_course_selection_information_student_name = json.result.list;
			result_course_selection_information_student_name.map(o => o.title = o['student_name'])
	  			this.result_course_selection_information_student_name = result_course_selection_information_student_name
		 	}
		});
	},
													/**
	 * 获取course_name
	 */
	get_course_test_course_name(){
		this.$get("~/api/course_test/get_list?like=0", { page: 1, size: 10, "course_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_course_test_course_name = json.result.list;
			result_course_test_course_name.map(o => o.title = o['course_name'])
	  			this.result_course_test_course_name = result_course_test_course_name
		 	}
		});
	},
												/**
	 * 获取student_name
	 */
	get_course_test_student_name(){
		this.$get("~/api/course_test/get_list?like=0", { page: 1, size: 10, "student_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_course_test_student_name = json.result.list;
			result_course_test_student_name.map(o => o.title = o['student_name'])
	  			this.result_course_test_student_name = result_course_test_student_name
		 	}
		});
	},
																			/**
	 * 获取course_name
	 */
	get_submit_test_course_name(){
		this.$get("~/api/submit_test/get_list?like=0", { page: 1, size: 10, "course_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_submit_test_course_name = json.result.list;
			result_submit_test_course_name.map(o => o.title = o['course_name'])
	  			this.result_submit_test_course_name = result_submit_test_course_name
		 	}
		});
	},
												/**
	 * 获取student_name
	 */
	get_submit_test_student_name(){
		this.$get("~/api/submit_test/get_list?like=0", { page: 1, size: 10, "student_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_submit_test_student_name = json.result.list;
			result_submit_test_student_name.map(o => o.title = o['student_name'])
	  			this.result_submit_test_student_name = result_submit_test_student_name
		 	}
		});
	},
																						/**
	 * 获取course_name
	 */
	get_score_entry_course_name(){
		this.$get("~/api/score_entry/get_list?like=0", { page: 1, size: 10, "course_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_score_entry_course_name = json.result.list;
			result_score_entry_course_name.map(o => o.title = o['course_name'])
	  			this.result_score_entry_course_name = result_score_entry_course_name
		 	}
		});
	},
												/**
	 * 获取student_name
	 */
	get_score_entry_student_name(){
		this.$get("~/api/score_entry/get_list?like=0", { page: 1, size: 10, "student_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_score_entry_student_name = json.result.list;
			result_score_entry_student_name.map(o => o.title = o['student_name'])
	  			this.result_score_entry_student_name = result_score_entry_student_name
		 	}
		});
	},
																			/**
	 * 获取title
	 */
	get_course_scheduling_management_title(){
		this.$get("~/api/course_scheduling_management/get_list?like=0", { page: 1, size: 10, "title": this.query.word }, (json) => {
		  if (json.result) {
			var result_course_scheduling_management_title = json.result.list;
			result_course_scheduling_management_title.map(o => o.title = o['title'])
	  			this.result_course_scheduling_management_title = result_course_scheduling_management_title
		 	}
		});
	},
						/**
	 * 获取course_name
	 */
	get_course_scheduling_management_course_name(){
		this.$get("~/api/course_scheduling_management/get_list?like=0", { page: 1, size: 10, "course_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_course_scheduling_management_course_name = json.result.list;
			result_course_scheduling_management_course_name.map(o => o.title = o['course_name'])
	  			this.result_course_scheduling_management_course_name = result_course_scheduling_management_course_name
		 	}
		});
	},
																						/**
	 * 获取title
	 */
	get_schedule_management_title(){
		this.$get("~/api/schedule_management/get_list?like=0", { page: 1, size: 10, "title": this.query.word }, (json) => {
		  if (json.result) {
			var result_schedule_management_title = json.result.list;
			result_schedule_management_title.map(o => o.title = o['title'])
	  			this.result_schedule_management_title = result_schedule_management_title
		 	}
		});
	},
																														
  },
  components: { list_result_search },
	created(){
    this.query.word = this.$route.query.word || "";
  },
  mounted() {
	this.get_article();
								this.get_student_student_name();
														this.get_teacher_full_name();
																				this.get_student_information_student_name();
																				this.get_department_management_name_of_department();
														this.get_professional_management_major_name();
								this.get_class_management_class_name();
								this.get_course_information_course_no();
							this.get_course_information_course_name();
																													this.get_classroom_management_classroom_name();
											this.get_course_selection_information_course_name();
																						this.get_course_selection_information_student_name();
														this.get_course_test_course_name();
													this.get_course_test_student_name();
																				this.get_submit_test_course_name();
													this.get_submit_test_student_name();
																							this.get_score_entry_course_name();
													this.get_score_entry_student_name();
																				this.get_course_scheduling_management_title();
							this.get_course_scheduling_management_course_name();
																							this.get_schedule_management_title();
																														  },
  watch: {
	$route() {
	  $.push(this.query, this.$route.query);
	  this.get_article();
							  this.get_student_student_name();
													  this.get_teacher_full_name();
																			  this.get_student_information_student_name();
																			  this.get_department_management_name_of_department();
													  this.get_professional_management_major_name();
							  this.get_class_management_class_name();
							  this.get_course_information_course_no();
						  this.get_course_information_course_name();
																												  this.get_classroom_management_classroom_name();
										  this.get_course_selection_information_course_name();
																					  this.get_course_selection_information_student_name();
													  this.get_course_test_course_name();
												  this.get_course_test_student_name();
																			  this.get_submit_test_course_name();
												  this.get_submit_test_student_name();
																						  this.get_score_entry_course_name();
												  this.get_score_entry_student_name();
																			  this.get_course_scheduling_management_title();
						  this.get_course_scheduling_management_course_name();
																						  this.get_schedule_management_title();
																															},
  },
};
</script>

<style scoped>
.card_search {
  text-align: center;
}
.card_result_search>.title {
  text-align: center;
  padding: 10px 0;
}
</style>
