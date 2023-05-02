class EventModel {
  final String eventId;
  final String ownerId;
  final String eventTitle; // max 30 char and can't be empty
  final String eventDescription; // max 255 char can be empty
  final int maximumPeople; // max 20
  final List<String> tags; // max 10 // need to change in doc
  final AgeRestrictionModel ageRestriction;
  final DateTime dateCreated;
  final DateOfEventModel dateOfEvent;
  final LocationModel location;
  final List<String> images; // Array of Base64 String
  final List<String> joinedUsers; // list of userId String

  EventModel({
    required this.eventId,
    required this.ownerId,
    required this.eventTitle,
    required this.eventDescription,
    required this.maximumPeople,
    required this.tags,
    required this.ageRestriction,
    required this.dateCreated,
    required this.dateOfEvent,
    required this.location,
    required this.images,
    required this.joinedUsers,
  });

  Map<String, dynamic> toJSON() {
    return {
      'eventId': eventId,
      'ownerId': ownerId,
      'eventTitle': eventTitle,
      'eventDescription': eventDescription,
      'maximumPeople': maximumPeople,
      'tags': tags,
      'ageRestriction': ageRestriction.toJSON(),
      'dateCreated': dateCreated.toIso8601String(),
      'dateOfEvent': dateOfEvent.toJSON(),
      'location': location.toJSON(),
      'images': images,
      'joinedUsers': joinedUsers,
    };
  }

  factory EventModel.fromJSON(Map<String, dynamic> json) {
    final String eventId = json['eventId'];
    final String ownerId = json['ownerId'];
    final String eventTitle = json['eventTitle'];
    final String eventDescription = json['eventDescription'];
    final int maximumPeople = json['maximumPeople'];
    final List<String> tags = List<String>.from(json['tags']);
    final AgeRestrictionModel ageRestriction =
        AgeRestrictionModel.fromJSON(json['ageRestriction']);
    final DateTime dateCreated = DateTime.parse(json['dateCreated']);
    final DateOfEventModel dateOfEvent =
        DateOfEventModel.fromJSON(json['dateOfEvent']);
    final LocationModel location = LocationModel.fromJSON(json['location']);
    final List<String> images = List<String>.from(json['images']);
    final List<String> joinedUsers = List<String>.from(json['joinedUsers']);

    return EventModel(
      eventId: eventId,
      ownerId: ownerId,
      eventTitle: eventTitle,
      eventDescription: eventDescription,
      maximumPeople: maximumPeople,
      tags: tags,
      ageRestriction: ageRestriction,
      dateCreated: dateCreated,
      dateOfEvent: dateOfEvent,
      location: location,
      images: images,
      joinedUsers: joinedUsers,
    );
  }

  @override
  String toString() {
    return 'EventModel{eventId: $eventId, ownerId: $ownerId, eventTitle: $eventTitle, eventDescription: $eventDescription, maximumPeople: $maximumPeople, tags: $tags, ageRestriction: $ageRestriction, dateCreated: $dateCreated, dateOfEvent: $dateOfEvent, location: $location, images: $images, joinedUsers: $joinedUsers}';
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

class LocationModel {
  final double latitude;
  final double longitude;

  LocationModel({
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJSON() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory LocationModel.fromJSON(Map<String, dynamic> json) {
    return LocationModel(
      latitude: json['latitude'] ?? 0.0,
      longitude: json['longitude'] ?? 0.0,
    );
  }
  @override
  String toString() {
    return 'LocationModel{latitude: $latitude, longitude: $longitude}';
  }
}