class EventModel {
  final String
      eventId; // CHANGE: use document's id as id which generated by uuid package
  final String ownerId;
  final String eventTitle; // max 30 char and can't be empty
  final String eventDescription; // max 255 char can be empty
  final int maximumPeople; // max 20
  final int minimumPeople; // ADD min 2
  final String tag; // CHANGE only one tag for 1 event
  final AgeRestrictionModel ageRestriction;
  final DateTime dateCreated;
  final DateOfEventModel dateOfEvent;
  final String location; // CHANGE let user types the location directly
  final String image; // CHANGE Array of bytes
  final List<String> joinedUsers; // list of userId String

  EventModel({
    required this.eventId,
    required this.ownerId,
    required this.eventTitle,
    required this.eventDescription,
    required this.maximumPeople,
    required this.minimumPeople,
    required this.tag,
    required this.ageRestriction,
    required this.dateCreated,
    required this.dateOfEvent,
    required this.location,
    required this.image,
    required this.joinedUsers,
  });

  Map<String, dynamic> toJSON() {
    return {
      'eventId': eventId,
      'ownerId': ownerId,
      'eventTitle': eventTitle,
      'eventDescription': eventDescription,
      'maximumPeople': maximumPeople,
      'minimumPeople': minimumPeople,
      'tag': tag,
      'ageRestriction': ageRestriction.toJSON(),
      'dateCreated': dateCreated.toIso8601String(),
      'dateOfEvent': dateOfEvent.toJSON(),
      'location': location,
      'image': image,
      'joinedUsers': joinedUsers,
    };
  }

  factory EventModel.fromJSON(Map<String, dynamic> json) {
    final String eventId = json['eventId'];
    final String ownerId = json['ownerId'];
    final String eventTitle = json['eventTitle'];
    final String eventDescription = json['eventDescription'];
    final int maximumPeople = json['maximumPeople'];
    final int minimumPeople = json['minimumPeople'];
    final String tag = json['tag'];
    final AgeRestrictionModel ageRestriction =
        AgeRestrictionModel.fromJSON(json['ageRestriction']);
    final DateTime dateCreated = DateTime.parse(json['dateCreated']);
    final DateOfEventModel dateOfEvent =
        DateOfEventModel.fromJSON(json['dateOfEvent']);
    final String location = json['location'];
    final String image = json['image'];
    final List<String> joinedUsers = List<String>.from(json['joinedUsers']);

    return EventModel(
      eventId: eventId,
      ownerId: ownerId,
      eventTitle: eventTitle,
      eventDescription: eventDescription,
      maximumPeople: maximumPeople,
      minimumPeople: minimumPeople,
      tag: tag,
      ageRestriction: ageRestriction,
      dateCreated: dateCreated,
      dateOfEvent: dateOfEvent,
      location: location,
      image: image,
      joinedUsers: joinedUsers,
    );
  }

  @override
  String toString() {
    return 'EventModel{eventId: $eventId, ownerId: $ownerId, eventTitle: $eventTitle, eventDescription: $eventDescription, maximumPeople: $maximumPeople, minimumPeople: $minimumPeople, tag: $tag, ageRestriction: $ageRestriction, dateCreated: $dateCreated, dateOfEvent: $dateOfEvent, location: $location, image: $image, joinedUsers: $joinedUsers}';
    // return 'EventModel{ownerId: $ownerId, eventTitle: $eventTitle, eventDescription: $eventDescription, maximumPeople: $maximumPeople, tags: $tags, ageRestriction: $ageRestriction, dateCreated: $dateCreated, dateOfEvent: $dateOfEvent, location: $location, images: $images, joinedUsers: $joinedUsers}';
  }
}

class AgeRestrictionModel {
  final int minimumAge;
  final int maximumAge;

  AgeRestrictionModel({
    required this.minimumAge,
    required this.maximumAge,
  });

  Map<String, dynamic> toJSON() {
    return {
      'minimumAge': minimumAge,
      'maximumAge': maximumAge,
    };
  }

  factory AgeRestrictionModel.fromJSON(Map<String, dynamic> json) {
    return AgeRestrictionModel(
      minimumAge: json['minimumAge'] ?? 0,
      maximumAge: json['maximumAge'] ?? 0,
    );
  }
  @override
  String toString() {
    return 'AgeRestrictionModel{minimumAge: $minimumAge, maximumAge: $maximumAge}';
  }
}

class DateOfEventModel {
  final DateTime start;
  final DateTime end;

  DateOfEventModel({
    required this.start,
    required this.end,
  });

  Map<String, dynamic> toJSON() {
    return {
      'start': start.toIso8601String(),
      'end': end.toIso8601String(),
    };
  }

  factory DateOfEventModel.fromJSON(Map<String, dynamic> json) {
    return DateOfEventModel(
      start: DateTime.parse(json['start'] ?? ""),
      end: DateTime.parse(json['end'] ?? ""),
    );
  }
  @override
  String toString() {
    return 'DateOfEventModel{start: $start, end: $end}';
  }
}
