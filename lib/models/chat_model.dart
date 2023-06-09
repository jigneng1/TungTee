class ChatRoomModel {
  final String eventId;
  final int maximumPeople; // same data in the EventModel
  final List<String> joinedUsers;
  final List<ChatMessageModel> chatMessages;

  ChatRoomModel({
    required this.eventId,
    required this.maximumPeople,
    required this.joinedUsers,
    required this.chatMessages,
  });

  @override
  String toString() {
    return 'ChatRoomModel{eventId: $eventId, maximumPeople: $maximumPeople, joinedUsers: $joinedUsers, chatMessages: $chatMessages}';
  }

  Map<String, dynamic> toJSON() {
    return {
      'eventId': eventId,
      'maximumPeople': maximumPeople,
      'joinedUsers': joinedUsers,
      'chatMessages': chatMessages.map((message) => message.toJSON()).toList(),
    };
  }

  factory ChatRoomModel.fromJSON(Map<String, dynamic> json) {
    return ChatRoomModel(
      eventId: json['eventId'],
      chatMessages: (json['chatMessages'] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((message) => ChatMessageModel.fromJSON(message))
          .toList(),
      joinedUsers: (json['joinedUsers'] as List<dynamic>)
          .map((user) => user.toString())
          .toList(),
      maximumPeople: json['maximumPeople'],
    );
  }
}

class ChatMessageModel {
  final String userId;
  final String nickname;
  final DateTime dateSend;
  final String message;
  final List<dynamic>? images; // images are optional

  ChatMessageModel({
    required this.userId,
    required this.dateSend,
    required this.message,
    required this.nickname,
    this.images,
  });

  Map<String, dynamic> toJSON() {
    return {
      'userId': userId,
      'nickname': nickname,
      'dateSend': dateSend.toIso8601String(),
      'message': message,
      'images': images,
    };
  }

  factory ChatMessageModel.fromJSON(Map<String, dynamic> json) {
    return ChatMessageModel(
      userId: json['userId'] ?? "",
      nickname: json['nickname'] ?? "",
      dateSend:
          DateTime.parse(json['dateSend'] ?? DateTime.now().toIso8601String()),
      images: json['images'] as List<dynamic>?,
      message: json['message'] ?? "",
    );
  }

  @override
  String toString() {
    return 'ChatMessageModel{userId: $userId, nickname: $nickname, dateSend: $dateSend, message: $message, images: $images}';
  }
}
