class Session {
  Session({
    required this.sessionKey,
    required this.sessionType,
    required this.sessionName,
    required this.dateStart,
    required this.dateEnd,
    required this.meetingKey,
    required this.circuitKey,
    required this.circuitShortName,
    required this.countryKey,
    required this.countryCode,
    required this.countryName,
    required this.location,
    required this.gmtOffset,
    required this.year,
  });

  final int sessionKey;
  final String sessionType;
  final String sessionName;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final int meetingKey;
  final int circuitKey;
  final String circuitShortName;
  final int countryKey;
  final String countryCode;
  final String countryName;
  final String location;
  final String gmtOffset;
  final int year;

  Session copyWith({
    int? sessionKey,
    String? sessionType,
    String? sessionName,
    DateTime? dateStart,
    DateTime? dateEnd,
    int? meetingKey,
    int? circuitKey,
    String? circuitShortName,
    int? countryKey,
    String? countryCode,
    String? countryName,
    String? location,
    String? gmtOffset,
    int? year,
  }) {
    return Session(
      sessionKey: sessionKey ?? this.sessionKey,
      sessionType: sessionType ?? this.sessionType,
      sessionName: sessionName ?? this.sessionName,
      dateStart: dateStart ?? this.dateStart,
      dateEnd: dateEnd ?? this.dateEnd,
      meetingKey: meetingKey ?? this.meetingKey,
      circuitKey: circuitKey ?? this.circuitKey,
      circuitShortName: circuitShortName ?? this.circuitShortName,
      countryKey: countryKey ?? this.countryKey,
      countryCode: countryCode ?? this.countryCode,
      countryName: countryName ?? this.countryName,
      location: location ?? this.location,
      gmtOffset: gmtOffset ?? this.gmtOffset,
      year: year ?? this.year,
    );
  }

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      sessionKey: json["session_key"] ?? 0,
      sessionType: json["session_type"] ?? "",
      sessionName: json["session_name"] ?? "",
      dateStart: DateTime.tryParse(json["date_start"] ?? ""),
      dateEnd: DateTime.tryParse(json["date_end"] ?? ""),
      meetingKey: json["meeting_key"] ?? 0,
      circuitKey: json["circuit_key"] ?? 0,
      circuitShortName: json["circuit_short_name"] ?? "",
      countryKey: json["country_key"] ?? 0,
      countryCode: json["country_code"] ?? "",
      countryName: json["country_name"] ?? "",
      location: json["location"] ?? "",
      gmtOffset: json["gmt_offset"] ?? "",
      year: json["year"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "session_key": sessionKey,
    "session_type": sessionType,
    "session_name": sessionName,
    "date_start": dateStart?.toIso8601String(),
    "date_end": dateEnd?.toIso8601String(),
    "meeting_key": meetingKey,
    "circuit_key": circuitKey,
    "circuit_short_name": circuitShortName,
    "country_key": countryKey,
    "country_code": countryCode,
    "country_name": countryName,
    "location": location,
    "gmt_offset": gmtOffset,
    "year": year,
  };

  @override
  String toString() {
    return "Session($sessionKey, $sessionType, $sessionName, $dateStart, $dateEnd, $meetingKey, $circuitKey, $circuitShortName, $countryKey, $countryCode, $countryName, $location, $gmtOffset, $year)";
  }
}
