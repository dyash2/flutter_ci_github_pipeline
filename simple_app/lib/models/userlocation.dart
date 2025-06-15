class LocationModel {
  final StreetModel street;
  final String city;
  final String state;
  final String country;
  final CoOrdinateModel coordinate;
  final TimeZoneModel timezone;

  LocationModel( { required this.street, required this.city, required this.state,
      required this.country, required this.coordinate,required this.timezone });
}

class StreetModel {
  final int number;
  final String name;

  StreetModel({required this.number, required this.name});
}

class CoOrdinateModel {
  final double latitude;
  final double longitude;

  CoOrdinateModel({required this.latitude, required this.longitude});
}

class TimeZoneModel{
  final String offset;
  final String description;

  TimeZoneModel({required  this.offset, required  this.description});
}