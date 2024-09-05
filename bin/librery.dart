class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;
  
  User({required this.id,required this.name,required this.username,required this.email,required this.address,required this.phone,required this.website,required this.company});
  
  factory User.datosJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: Address.datosJson(json['address']),
      phone: json['phone'],
      website: json['website'],
      company: Company.datosJson(json['company']),
    );
  }

  void imprimirUser(){
    print('id: $id');
    print('name: $name');
    print('username: $username');
    print('email: $email');
    print('address:');
    address.imprimirAddress();
    print('phone: $phone');
    print('website: $website');
    print('company:');
    company.imprimirCompany();
    }

}

class Geo {
  final String lat;
  final String lng;

  Geo({required this.lat,required this.lng});

  factory Geo.datosJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  void imprimirGeo(){
    print('lat: $lat');
    print('lng: $lng');
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({required this.street,required this.suite,required this.city,required this.zipcode,required this.geo});

  factory Address.datosJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: Geo.datosJson(json['geo']),
    );
  }

  void imprimirAddress(){
    print('street: $street');
    print('suite: $suite');
    print('city: $city');
    print('zipcode: $zipcode');
    print('geo:');
    geo.imprimirGeo();
  }
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({required this.name,required this.catchPhrase,required this.bs});

  factory Company.datosJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }
  void imprimirCompany(){
    print('name: $name');
    print('catchPhrase: $catchPhrase');
    print('bs: $bs');
  }
}

