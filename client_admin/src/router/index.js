import Vue from 'vue';
import VueRouter from 'vue-router';
import index from '../views/index.vue';
import login from '../views/login.vue';
import forgot from '../views/forgot.vue';
Vue.use(VueRouter)

const routes = [
	// 主页
	{
		path: '/',
		name: 'index',
		component: index,
		meta: {
			index: 0,
			title: '首页'
		}
	},

	// 登录
	{
		path: '/login',
		name: 'login',
		component: login,
		meta: {
			index: 0,
			title: '登录'
		}
	},


	// 忘记密码
	{
		path: '/forgot',
		name: "forgot",
		component: forgot,
		meta: {
			index: 0,
			title: '忘记密码'
		}
	},

	// 修改密码
	{
		path: '/user/password',
		name: "password",
		component: () => import("../views/user/password.vue"),
		meta: {
			index: 0,
			title: '修改密码'
		}
	},

	// 视频播放页
	{
		path: "/media/video",
		name: "video",
		component: () => import('../views/media/video.vue'),
		meta: {
			index: 0,
			title: "视频"
		}
	},

	// 音频播放页
	{
		path: "/media/audio",
		name: "audio",
		component: () => import('../views/media/audio.vue'),
		meta: {
			index: 0,
			title: "音频"
		}
	},



	// 友情链接路由
	// {
	// 	path: '/link/table',
	// 	name: 'link_table',
	// 	component: () => import('../views/link/table.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '链接列表'
	// 	}
	// },
	// {
	// 	path: '/link/view',
	// 	name: 'link_view',
	// 	component: () => import('../views/link/view.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '链接详情'
	// 	}
	// },

	// 轮播图路由
	{
		path: '/slides/table',
		name: 'slides_table',
		component: () => import('../views/slides/table.vue'),
		meta: {
			index: 0,
			title: '轮播图列表'
		}
	},
	{
		path: '/slides/view',
		name: 'slides_view',
		component: () => import('../views/slides/view.vue'),
		meta: {
			index: 0,
			title: '轮播图详情'
		}
	},
		// 文章路由
	{
		path: '/article/table',
		name: 'article_table',
		component: () => import('../views/article/table.vue'),
		meta: {
			index: 0,
			title: '文章列表'
		}
	},
	{
		path: '/article/view',
		name: 'article_view',
		component: () => import('../views/article/view.vue'),
		meta: {
			index: 0,
			title: '文章详情'
		}
	},

	// 文章分类路由
	{
		path: '/article_type/table',
		name: 'article_type_table',
		component: () => import('../views/article_type/table.vue'),
		meta: {
			index: 0,
			title: '文章分类列表'
		}
	},
	{
		path: '/article_type/view',
		name: 'article_type_view',
		component: () => import('../views/article_type/view.vue'),
		meta: {
			index: 0,
			title: '文章分类详情'
		}
	},
	
	// 广告路由
	// {
	// 	path: '/ad/table',
	// 	name: 'ad_table',
	// 	component: () => import('../views/ad/table.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '广告列表'
	// 	}
	// },
	// {
	// 	path: '/ad/view',
	// 	name: 'ad_view',
	// 	component: () => import('../views/ad/view.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '广告详情'
	// 	}
	// },



	// 公告路由
	{
		path: '/notice/table',
		name: 'notice_table',
		component: () => import('../views/notice/table.vue'),
		meta: {
			index: 0,
			title: '公告消息列表'
		}
	},
	{
		path: '/notice/view',
		name: 'notice_view',
		component: () => import('../views/notice/view.vue'),
		meta: {
			index: 0,
			title: '公告消息详情'
		}
	},


	// 评论路由
	{
		path: '/comment/table',
		name: 'comment_table',
		component: () => import('../views/comment/table.vue'),
		meta: {
			index: 0,
			title: '评论列表'
		}
	},
	{
		path: '/comment/view',
		name: 'comment_view',
		component: () => import('../views/comment/view.vue'),
		meta: {
			index: 0,
			title: '评论详情'
		}
	},

	// 学生路由
	{
		path: '/student/table',
		name: 'student_table',
		component: () => import('../views/student/table.vue'),
		meta: {
			index: 0,
			title: '学生列表'
		}
	},
	{
		path: '/student/view',
		name: 'student_view',
		component: () => import('../views/student/view.vue'),
		meta: {
			index: 0,
			title: '学生详情'
		}
	},
	// 教师路由
	{
		path: '/teacher/table',
		name: 'teacher_table',
		component: () => import('../views/teacher/table.vue'),
		meta: {
			index: 0,
			title: '教师列表'
		}
	},
	{
		path: '/teacher/view',
		name: 'teacher_view',
		component: () => import('../views/teacher/view.vue'),
		meta: {
			index: 0,
			title: '教师详情'
		}
	},
	// 学生信息路由
	{
		path: '/student_information/table',
		name: 'student_information_table',
		component: () => import('../views/student_information/table.vue'),
		meta: {
			index: 0,
			title: '学生信息列表'
		}
	},
	{
		path: '/student_information/view',
		name: 'student_information_view',
		component: () => import('../views/student_information/view.vue'),
		meta: {
			index: 0,
			title: '学生信息详情'
		}
	},
	// 院系管理路由
	{
		path: '/department_management/table',
		name: 'department_management_table',
		component: () => import('../views/department_management/table.vue'),
		meta: {
			index: 0,
			title: '院系管理列表'
		}
	},
	{
		path: '/department_management/view',
		name: 'department_management_view',
		component: () => import('../views/department_management/view.vue'),
		meta: {
			index: 0,
			title: '院系管理详情'
		}
	},
	// 专业管理路由
	{
		path: '/professional_management/table',
		name: 'professional_management_table',
		component: () => import('../views/professional_management/table.vue'),
		meta: {
			index: 0,
			title: '专业管理列表'
		}
	},
	{
		path: '/professional_management/view',
		name: 'professional_management_view',
		component: () => import('../views/professional_management/view.vue'),
		meta: {
			index: 0,
			title: '专业管理详情'
		}
	},
	// 班级管理路由
	{
		path: '/class_management/table',
		name: 'class_management_table',
		component: () => import('../views/class_management/table.vue'),
		meta: {
			index: 0,
			title: '班级管理列表'
		}
	},
	{
		path: '/class_management/view',
		name: 'class_management_view',
		component: () => import('../views/class_management/view.vue'),
		meta: {
			index: 0,
			title: '班级管理详情'
		}
	},
	// 课程信息路由
	{
		path: '/course_information/table',
		name: 'course_information_table',
		component: () => import('../views/course_information/table.vue'),
		meta: {
			index: 0,
			title: '课程信息列表'
		}
	},
	{
		path: '/course_information/view',
		name: 'course_information_view',
		component: () => import('../views/course_information/view.vue'),
		meta: {
			index: 0,
			title: '课程信息详情'
		}
	},
	// 教室管理路由
	{
		path: '/classroom_management/table',
		name: 'classroom_management_table',
		component: () => import('../views/classroom_management/table.vue'),
		meta: {
			index: 0,
			title: '教室管理列表'
		}
	},
	{
		path: '/classroom_management/view',
		name: 'classroom_management_view',
		component: () => import('../views/classroom_management/view.vue'),
		meta: {
			index: 0,
			title: '教室管理详情'
		}
	},
	// 选课信息路由
	{
		path: '/course_selection_information/table',
		name: 'course_selection_information_table',
		component: () => import('../views/course_selection_information/table.vue'),
		meta: {
			index: 0,
			title: '选课信息列表'
		}
	},
	{
		path: '/course_selection_information/view',
		name: 'course_selection_information_view',
		component: () => import('../views/course_selection_information/view.vue'),
		meta: {
			index: 0,
			title: '选课信息详情'
		}
	},
	// 课程测试路由
	{
		path: '/course_test/table',
		name: 'course_test_table',
		component: () => import('../views/course_test/table.vue'),
		meta: {
			index: 0,
			title: '课程测试列表'
		}
	},
	{
		path: '/course_test/view',
		name: 'course_test_view',
		component: () => import('../views/course_test/view.vue'),
		meta: {
			index: 0,
			title: '课程测试详情'
		}
	},
	// 提交测试路由
	{
		path: '/submit_test/table',
		name: 'submit_test_table',
		component: () => import('../views/submit_test/table.vue'),
		meta: {
			index: 0,
			title: '提交测试列表'
		}
	},
	{
		path: '/submit_test/view',
		name: 'submit_test_view',
		component: () => import('../views/submit_test/view.vue'),
		meta: {
			index: 0,
			title: '提交测试详情'
		}
	},
	// 成绩录入路由
	{
		path: '/score_entry/table',
		name: 'score_entry_table',
		component: () => import('../views/score_entry/table.vue'),
		meta: {
			index: 0,
			title: '成绩录入列表'
		}
	},
	{
		path: '/score_entry/view',
		name: 'score_entry_view',
		component: () => import('../views/score_entry/view.vue'),
		meta: {
			index: 0,
			title: '成绩录入详情'
		}
	},
	// 排课管理路由
	{
		path: '/course_scheduling_management/table',
		name: 'course_scheduling_management_table',
		component: () => import('../views/course_scheduling_management/table.vue'),
		meta: {
			index: 0,
			title: '排课管理列表'
		}
	},
	{
		path: '/course_scheduling_management/view',
		name: 'course_scheduling_management_view',
		component: () => import('../views/course_scheduling_management/view.vue'),
		meta: {
			index: 0,
			title: '排课管理详情'
		}
	},
	// 课表管理路由
	{
		path: '/schedule_management/table',
		name: 'schedule_management_table',
		component: () => import('../views/schedule_management/table.vue'),
		meta: {
			index: 0,
			title: '课表管理列表'
		}
	},
	{
		path: '/schedule_management/view',
		name: 'schedule_management_view',
		component: () => import('../views/schedule_management/view.vue'),
		meta: {
			index: 0,
			title: '课表管理详情'
		}
	},

	// 用户路由
	{
		path: '/user/table',
		name: 'user_table',
		component: () => import('../views/user/table.vue'),
		meta: {
			index: 0,
			title: '用户列表'
		}
	},
	{
		path: '/user/view',
		name: 'user_view',
		component: () => import('../views/user/view.vue'),
		meta: {
			index: 0,
			title: '用户详情'
		}
	},
	{
		path: '/user/info',
		name: 'user_info',
		component: () => import('../views/user/info.vue'),
		meta: {
			index: 0,
			title: '个人信息'
		}
	},
	// 用户组路由
	{
		path: '/user_group/table',
		name: 'user_group_table',
		component: () => import('../views/user_group/table.vue'),
		meta: {
			index: 0,
			title: '用户组列表'
		}
	},
	{
		path: '/user_group/view',
		name: 'user_group_view',
		component: () => import('../views/user_group/view.vue'),
		meta: {
			index: 0,
			title: '用户组详情'
		}
	}
]

const router = new VueRouter({
	mode: 'history',
	base: process.env.BASE_URL,
	routes
})

router.beforeEach((to, from, next) => {
	let token = to.query.token;
	if (token){
		$.db.set("token",token,120);
	}
	next();
})

router.afterEach((to, from, next) => {
	let title = "智能排课系统-admin";
	document.title = title;
})

export default router
