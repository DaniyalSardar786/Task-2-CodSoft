/// _id : "boO8cxCyUZ"
/// author : "Sam Walton"
/// content : "There is only one boss. The customer. And he can fire everybody in the company from the chairman on down, simply by spending his money somewhere else."
/// tags : ["Business"]
/// authorSlug : "sam-walton"
/// length : 150
/// dateAdded : "2022-07-06"
/// dateModified : "2023-04-14"

class QuotesModel {
  QuotesModel({
      String? id, 
      String? author, 
      String? content, 
      List<String>? tags, 
      String? authorSlug, 
      num? length, 
      String? dateAdded, 
      String? dateModified,}){
    _id = id;
    _author = author;
    _content = content;
    _tags = tags;
    _authorSlug = authorSlug;
    _length = length;
    _dateAdded = dateAdded;
    _dateModified = dateModified;
}

  QuotesModel.fromJson(dynamic json) {
    _id = json['_id'];
    _author = json['author'];
    _content = json['content'];
    _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    _authorSlug = json['authorSlug'];
    _length = json['length'];
    _dateAdded = json['dateAdded'];
    _dateModified = json['dateModified'];
  }
  String? _id;
  String? _author;
  String? _content;
  List<String>? _tags;
  String? _authorSlug;
  num? _length;
  String? _dateAdded;
  String? _dateModified;
QuotesModel copyWith({  String? id,
  String? author,
  String? content,
  List<String>? tags,
  String? authorSlug,
  num? length,
  String? dateAdded,
  String? dateModified,
}) => QuotesModel(  id: id ?? _id,
  author: author ?? _author,
  content: content ?? _content,
  tags: tags ?? _tags,
  authorSlug: authorSlug ?? _authorSlug,
  length: length ?? _length,
  dateAdded: dateAdded ?? _dateAdded,
  dateModified: dateModified ?? _dateModified,
);
  String? get id => _id;
  String? get author => _author;
  String? get content => _content;
  List<String>? get tags => _tags;
  String? get authorSlug => _authorSlug;
  num? get length => _length;
  String? get dateAdded => _dateAdded;
  String? get dateModified => _dateModified;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['author'] = _author;
    map['content'] = _content;
    map['tags'] = _tags;
    map['authorSlug'] = _authorSlug;
    map['length'] = _length;
    map['dateAdded'] = _dateAdded;
    map['dateModified'] = _dateModified;
    return map;
  }

}