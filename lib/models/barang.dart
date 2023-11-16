// To parse this JSON data, do
//
//     final barang = barangFromJson(jsonString);

import 'dart:convert';

List<Barang> barangFromJson(String str) => List<Barang>.from(json.decode(str).map((x) => Barang.fromJson(x)));

String barangToJson(List<Barang> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Barang {
    String model;
    int pk;
    Fields fields;

    Barang({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Barang.fromJson(Map<String, dynamic> json) => Barang(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int amount;
    int price;
    String description;

    Fields({
        required this.user,
        required this.name,
        required this.amount,
        required this.price,
        required this.description,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        amount: json["amount"],
        price: json["price"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "amount": amount,
        "price": price,
        "description": description,
    };
}
