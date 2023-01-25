import 'package:isar/isar.dart';
import 'package:xxim_core_flutter/xxim_core_flutter.dart';
import 'package:xxim_sdk_flutter/src/tool/sdk_tool.dart';

part 'notice_model.g.dart';

@Collection()
class NoticeModel {
  Id id = Isar.autoIncrement;

  @Index()
  String convId;
  @Index()
  String noticeId;
  int createTime;
  String title;
  int contentType;
  String content;
  NoticeOptionsModel options;
  String ext;
  bool deleted;

  NoticeModel({
    required this.convId,
    required this.noticeId,
    required this.createTime,
    required this.title,
    required this.contentType,
    required this.content,
    required this.options,
    required this.ext,
    this.deleted = false,
  });

  static NoticeModel fromProto(NoticeData noticeData) {
    return NoticeModel(
      convId: noticeData.convId,
      noticeId: noticeData.noticeId,
      createTime: int.parse(noticeData.createTime),
      title: noticeData.title,
      contentType: noticeData.contentType,
      content: SDKTool.utf8Decode(noticeData.content),
      options: NoticeOptionsModel.fromProto(noticeData.options),
      ext: SDKTool.utf8Decode(noticeData.ext),
    );
  }
}

@Embedded()
class NoticeOptionsModel {
  bool? storageForClient;
  bool? updateConvMsg;

  NoticeOptionsModel({
    this.storageForClient,
    this.updateConvMsg,
  });

  static NoticeOptionsModel fromProto(NoticeData_Options options) {
    return NoticeOptionsModel(
      storageForClient: options.storageForClient,
      updateConvMsg: options.updateConvMsg,
    );
  }
}
