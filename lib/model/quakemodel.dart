import '../util/types_helper.dart';

class Quake {
  late String type;
  late Metadata metadata;
  late List<Features> features;
  late List<double> bbox;

  Quake(
      {required this.type,
      required this.metadata,
      required this.features,
      required this.bbox});

  Quake.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    metadata = (json['metadata'] != null
        ? Metadata.fromJson(json['metadata'])
        : null)!;
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features.add(Features.fromJson(v));
      });
    }
    bbox = json['bbox'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['metadata'] = metadata.toJson();
    data['features'] = features.map((v) => v.toJson()).toList();
    data['bbox'] = bbox;
    return data;
  }
}

class Metadata {
  late int generated;
  late String url;
  late String title;
  late int status;
  late String api;
  late int count;

  Metadata(
      {required this.generated,
      required this.url,
      required this.title,
      required this.status,
      required this.api,
      required this.count});

  Metadata.fromJson(Map<String, dynamic> json) {
    generated = json['generated'];
    url = json['url'];
    title = json['title'];
    status = json['status'];
    api = json['api'];
    count = json[['count']];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['generated'] = generated;
    data['url'] = url;
    data['title'] = title;
    data['status'] = status;
    data['api'] = api;
    data['count'] = count;
    return data;
  }
}

class Features {
  late String type;
  late Properties properties;
  late Geometry geometry;
  late String id;

  Features(
      {required this.type,
      required this.properties,
      required this.geometry,
      required this.id});

  Features.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    properties = (json['properties'] != null
        ? Properties.fromJson(json['properties'])
        : null)!;
    geometry = json['geometry'] != null
        ? Geometry.fromJson(json['geometry'])
        // ignore: null_check_always_fails
        : null!;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['properties'] = properties.toJson();
    data['geometry'] = geometry.toJson();
    data['id'] = id;
    return data;
  }
}

class Properties {
  late double mag;
  late String place;
  late int time;
  late int updated;

  late int? tz;
  late String url;
  late String detail;
  late int felt;
  late double cdi;
  late double mmi;
  late String alert;
  late String status;
  late int tsunami;
  late int sig;
  late String net;
  late String code;
  late String ids;
  late String sources;
  late String types;
  late int nst;
  late double dmin;
  late double rms;
  late int gap;
  late String magType;
  late String type;
  late String title;

  Properties(
      {required this.mag,
      required this.place,
      required this.time,
      required this.updated,
      required this.tz,
      required this.url,
      required this.detail,
      required this.felt,
      required this.cdi,
      required this.mmi,
      required this.alert,
      required this.status,
      required this.tsunami,
      required this.sig,
      required this.net,
      required this.code,
      required this.ids,
      required this.sources,
      required this.types,
      required this.nst,
      required this.dmin,
      required this.rms,
      required this.gap,
      required this.magType,
      required this.type,
      required this.title});

  Properties.fromJson(Map<String, dynamic> json) {
    mag = json['mag'];
    place = json['place'];
    time = json['time'];
    updated = json['updated'];
    tz = json['tz'] == null ? null : TypesHelper.toInt(json['tz']);
    url = json['url'];
    detail = json['detail'];
    felt = json['felt'];
    cdi = json['cdi'];
    mmi = json['mmi'];
    alert = json['alert'];
    status = json['status'];
    tsunami = json['tsunami'];
    sig = json['sig'];
    net = json['net'];
    code = json['code'];
    ids = json['ids'];
    sources = json['sources'];
    types = json['types'];
    nst = json['nst'];
    dmin = json['dmin'];
    rms = json['rms'];
    gap = json['gap'];
    magType = json['magType'];
    type = json['type'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mag'] = mag;
    data['place'] = place;
    data['time'] = time;
    data['updated'] = updated;
    data['tz'] = tz;
    data['url'] = url;
    data['detail'] = detail;
    data['felt'] = felt;
    data['cdi'] = cdi;
    data['mmi'] = mmi;
    data['alert'] = alert;
    data['status'] = status;
    data['tsunami'] = tsunami;
    data['sig'] = sig;
    data['net'] = net;
    data['code'] = code;
    data['ids'] = ids;
    data['sources'] = sources;
    data['types'] = types;
    data['nst'] = nst;
    data['dmin'] = dmin;
    data['rms'] = rms;
    data['gap'] = gap;
    data['magType'] = magType;
    data['type'] = type;
    data['title'] = title;
    return data;
  }
}

class Geometry {
  late String type;
  late List<double> coordinates;

  Geometry({required this.type, required this.coordinates});

  Geometry.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['coordinates'] = coordinates;
    return data;
  }
}
