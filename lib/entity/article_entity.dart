// article_entity.dart

class ArticleEntity {
	// 1. 添加空安全标注。根据 JSON 结构，这些字段通常不会为 null，所以使用 `final` 和非空类型。
	final ArticleData? data; // data 字段在 JSON 中可能为 null，所以标记为 ArticleData?
	final int errorCode;
	final String errorMsg;

	// 2. 简化构造函数，使用 required 关键字确保非空字段在创建时必须被提供。
	const ArticleEntity({
		this.data,
		required this.errorCode,
		required this.errorMsg,
	});

	// 3. fromJson 工厂构造函数：使用现代的 null 检查和类型转换。
	//    移除了不必要的 `new` 关键字。
	factory ArticleEntity.fromJson(Map<String, dynamic> json) {
		return ArticleEntity(
			data: json['data'] != null ? ArticleData.fromJson(json['data'] as Map<String, dynamic>) : null,
			errorCode: json['errorCode'] as int,
			errorMsg: json['errorMsg'] as String,
		);
	}

	// 4. toJson 方法：同样移除 `new`，并使用 null 条件运算符 `?.` 简化代码。
	Map<String, dynamic> toJson() {
		return {
			'data': data?.toJson(), // 如果 data 不为 null，则调用 toJson()，否则值为 null
			'errorCode': errorCode,
			'errorMsg': errorMsg,
		};
	}
}

class ArticleData {
	// 1. 添加空安全标注。这些字段通常也不会为 null。
	final bool over;
	final int pageCount;
	final int total;
	final int curPage;
	final int offset;
	final int size;
	final List<ArticleDataData> datas;

	// 2. 简化构造函数。
	const ArticleData({
		required this.over,
		required this.pageCount,
		required this.total,
		required this.curPage,
		required this.offset,
		required this.size,
		required this.datas,
	});

	// 3. fromJson 工厂构造函数：使用更简洁的列表转换方式。
	factory ArticleData.fromJson(Map<String, dynamic> json) {
		return ArticleData(
			over: json['over'] as bool,
			pageCount: json['pageCount'] as int,
			total: json['total'] as int,
			curPage: json['curPage'] as int,
			offset: json['offset'] as int,
			size: json['size'] as int,
			// 使用 map().toList() 代替 forEach，更具函数式风格且更简洁。
			datas: (json['datas'] as List<dynamic>)
					.map((item) => ArticleDataData.fromJson(item as Map<String, dynamic>))
					.toList(),
		);
	}

	// 4. toJson 方法：使用集合的 map 方法转换列表。
	Map<String, dynamic> toJson() {
		return {
			'over': over,
			'pageCount': pageCount,
			'total': total,
			'curPage': curPage,
			'offset': offset,
			'size': size,
			'datas': datas.map((data) => data.toJson()).toList(),
		};
	}
}

class ArticleDataData {
	// 1. 添加空安全标注。根据经验，这些字段中有些可能为 null (例如 author, desc 等)。
	//    我会根据常见的 API 响应模式来标注。如果某个字段确实永远不为 null，你可以移除 `?`。
	final String? superChapterName;
	final int publishTime;
	final int visible;
	final String? niceDate;
	final String? projectLink;
	final String? author;
	final String? prefix;
	final int zan;
	final String? origin;
	final String? chapterName;
	final String? link;
	final String? title;
	final int type;
	final int userId;
	// 2. 【重要】修正 tags 字段。JSON 中它是一个数组，但内容为空或为对象。
	//    我们将其定义为一个可以为空的列表，列表中的元素类型为 dynamic (因为我们不确定具体类型，也可能为空)。
	//    更好的做法是为 Tag 创建一个实体类，例如 List<Tag?>? tags;
	final List<dynamic>? tags;
	final String? apkLink;
	final String? envelopePic;
	final int chapterId;
	final int superChapterId;
	final int id;
	final int? originId; // originId 有时可能为 -1 或 null
	final bool fresh;
	final bool collect;
	final int courseId;
	final String? desc;

	// 3. 简化构造函数。
	const ArticleDataData({
		this.superChapterName,
		required this.publishTime,
		required this.visible,
		this.niceDate,
		this.projectLink,
		this.author,
		this.prefix,
		required this.zan,
		this.origin,
		this.chapterName,
		this.link,
		this.title,
		required this.type,
		required this.userId,
		this.tags,
		this.apkLink,
		this.envelopePic,
		required this.chapterId,
		required this.superChapterId,
		required this.id,
		this.originId,
		required this.fresh,
		required this.collect,
		required this.courseId,
		this.desc,
	});

	// 4. fromJson 工厂构造函数：移除 `new`，并正确处理 tags。
	factory ArticleDataData.fromJson(Map<String, dynamic> json) {
		return ArticleDataData(
			superChapterName: json['superChapterName'] as String?,
			publishTime: json['publishTime'] as int,
			visible: json['visible'] as int,
			niceDate: json['niceDate'] as String?,
			projectLink: json['projectLink'] as String?,
			author: json['author'] as String?,
			prefix: json['prefix'] as String?,
			zan: json['zan'] as int,
			origin: json['origin'] as String?,
			chapterName: json['chapterName'] as String?,
			link: json['link'] as String?,
			title: json['title'] as String?,
			type: json['type'] as int,
			userId: json['userId'] as int,
			tags: json['tags'] as List<dynamic>?, // 直接转换为 List<dynamic>?
			apkLink: json['apkLink'] as String?,
			envelopePic: json['envelopePic'] as String?,
			chapterId: json['chapterId'] as int,
			superChapterId: json['superChapterId'] as int,
			id: json['id'] as int,
			originId: json['originId'] as int?,
			fresh: json['fresh'] as bool,
			collect: json['collect'] as bool,
			courseId: json['courseId'] as int,
			desc: json['desc'] as String?,
		);
	}

	// 5. toJson 方法：移除 `new`，并使用 null 条件运算符。
	Map<String, dynamic> toJson() {
		return {
			'superChapterName': superChapterName,
			'publishTime': publishTime,
			'visible': visible,
			'niceDate': niceDate,
			'projectLink': projectLink,
			'author': author,
			'prefix': prefix,
			'zan': zan,
			'origin': origin,
			'chapterName': chapterName,
			'link': link,
			'title': title,
			'type': type,
			'userId': userId,
			'tags': tags, // 直接返回，因为它已经是 List<dynamic>?
			'apkLink': apkLink,
			'envelopePic': envelopePic,
			'chapterId': chapterId,
			'superChapterId': superChapterId,
			'id': id,
			'originId': originId,
			'fresh': fresh,
			'collect': collect,
			'courseId': courseId,
			'desc': desc,
		};
	}
}