import 'package:spod_app/model/field_facility.dart';
import 'package:spod_app/model/field_order.dart';
import 'package:spod_app/model/sport_category.dart';
import 'package:spod_app/model/sport_field.dart';
import 'package:spod_app/model/user.dart';

var sampleUser = User(
    id: "user01",
    name: "Sample User",
    email: "sample@mail.com",
    accountType: "Premium",
    imageProfile: "assets/images/user_profile_example.png");

var _basketball = SportCategory(
  name: "Basketball",
  image: "assets/icons/basketball.png",
);
var _futsal = SportCategory(
  name: "Futsal",
  image: "assets/icons/soccer.png",
);
var _volley = SportCategory(
  name: "Volley",
  image: "assets/icons/volley.png",
);
var _tableTennis = SportCategory(
  name: "Table Tennis",
  image: "assets/icons/table_tennis.png",
);
var _tennis = SportCategory(
  name: "Tennis",
  image: "assets/icons/tennis.png",
);

List<SportCategory> sportCategories = [
  _basketball,
  _tennis,
  _volley,
  _futsal,
  _tableTennis,
];

var _wifi = FieldFacility(name: "WiFi", imageAsset: "assets/icons/wifi.png");
var _toilet =
    FieldFacility(name: "Toilet", imageAsset: "assets/icons/toilet.png");
var _changingRoom = FieldFacility(
    name: "Changing Room", imageAsset: "assets/icons/changing_room.png");
var _canteen =
    FieldFacility(name: "Canteen", imageAsset: "assets/icons/canteen.png");
var _locker =
    FieldFacility(name: "Lockers", imageAsset: "assets/icons/lockers.png");
var _chargingArea = FieldFacility(
    name: "Charging Area", imageAsset: "assets/icons/charging.png");

SportField futsalRionov = SportField(
    id: "01",
    name: "Hangtuah 1 SC",
    address: "Jl. Tanjung Sadari No.144, Perak Bar., Kec. Krembangan, Kota SBY",
    category: _futsal,
    facilities: [_wifi, _toilet],
    phoneNumber: "0812 2345 6789",
    openDay: "Monday to Sunday",
    openTime: "08.00",
    closeTime: "22.00",
    imageAsset: "assets/images/pringsewu_futsal.jpg",
    price: 80000,
    author: "Daniel larionov",
    authorUrl: "https://unsplash.com/@foxysnaps",
    imageUrl: "https://unsplash.com/photos/oXCgQRsb2ug",
    lattitude: -7.224407143386789,
    longitude: 112.72267359250019,
    lokasi: '-7.224407143386789, 112.72267359250019');

SportField basketballVio = SportField(
    id: "02",
    name: "55th Graha SC",
    address:
        "Jln Mayjen Yono Suwoyo, Ruko Plaza Graha Family Lt3 (atas, Pradahkalikendal, Kec. Dukuhpakis, Kota SBY",
    category: _basketball,
    facilities: [_wifi, _toilet, _changingRoom, _canteen],
    author: "Fulvio ambrosanio",
    authorUrl: "https://unsplash.com/@fiercelupus",
    imageUrl: "https://unsplash.com/photos/zygvOSND4rI",
    phoneNumber: "0812 3333 4444",
    openDay: "All Day",
    openTime: "08.00",
    closeTime: "23.00",
    imageAsset: "assets/images/vio_basketball.jpg",
    price: 100000,
    lattitude: -7.286578922117721,
    longitude: 112.67576095647038,
    lokasi: '-7.286578922117721, 112.67576095647038');
SportField volleyTanjung = SportField(
    id: "03",
    name: "SC Untag Surabaya",
    address: "Menur Pumpungan, Kec. Sukolilo, Kota SBY",
    category: _volley,
    facilities: [_wifi, _toilet, _canteen, _chargingArea, _changingRoom],
    author: "Meritt Thomas",
    authorUrl: "https://unsplash.com/@merittthomas",
    imageUrl: "https://unsplash.com/photos/rgo4m8J0H2M",
    phoneNumber: "0866 7777 8888",
    openDay: "All Day",
    openTime: "07.00",
    closeTime: "17.00",
    imageAsset: "assets/images/voli_pantai.jpg",
    price: 115000,
    lattitude: -7.291809787957977,
    longitude: 112.76744512471446,
    lokasi: '-7.291809787957977, 112.76744512471446');
SportField tableTennisDCortez = SportField(
    id: "04",
    name: "Sport Center Al-Hikmah",
    address:
        "Jl. Kebonsari Elveka Ⅴ No.36, RT.000/RW.00, Kebonsari, Kec. Jambangan, Kota SBY",
    category: _tableTennis,
    facilities: [_wifi, _toilet, _canteen],
    author: "Ivan cortez",
    authorUrl: "https://unsplash.com/@ivancortez14",
    imageUrl: "https://unsplash.com/photos/c9aGBqkeoE4",
    phoneNumber: "0833 4444 5555",
    openDay: "All Day",
    openTime: "09.00",
    closeTime: "23.00",
    imageAsset: "assets/images/tenis_meja_cortez.jpg",
    price: 50000,
    lattitude: -7.319823741414524,
    longitude: 112.71986667036633,
    lokasi: '-7.319823741414524, 112.71986667036633');
SportField basketballKali = SportField(
    id: "05",
    name: "SC & Multipurpose",
    address: "Jl. Ahmad Yani, Wonokromo, Kec. Wonokromo, Kota SBY",
    category: _basketball,
    facilities: [_toilet],
    author: "Ilnur kalimullin",
    authorUrl: "https://unsplash.com/@kalimullin",
    imageUrl: "https://unsplash.com/photos/kP1AxmCyEXM",
    phoneNumber: "0888 9999 1111",
    openDay: "All Day",
    openTime: "06.00",
    closeTime: "18.00",
    imageAsset: "assets/images/kali_basketball.jpg",
    price: 75000,
    lattitude: -7.323336303183538,
    longitude: 112.73306273358267,
    lokasi: '-7.323336303183538, 112.73306273358267');

SportField basketballLM = SportField(
    id: "06",
    name: "SC UIN Sunan Ampel",
    address:
        "Jl. Under Construction Frontage Road Ahmad Yani No.119, Jemur Wonosari, Kec. Wonocolo, Kota SBY",
    category: _basketball,
    facilities: [_toilet],
    author: "Lucas Marcomini",
    authorUrl: "https://unsplash.com/@lucasmarcomini",
    imageUrl: "https://unsplash.com/photos/77pAlgB8v_E",
    phoneNumber: "0855 6666 7777",
    openDay: "All Day",
    openTime: "07.00",
    closeTime: "22.00",
    imageAsset: "assets/images/lm_basketball.jpg",
    price: 85000,
    lattitude: -7.323325185799069,
    longitude: 112.73309235631969,
    lokasi: '-7.323325185799069, 112.73309235631969');

SportField tennisDC = SportField(
    id: "07",
    name: "SC Puncak Permai",
    address:
        "Jl. Raya Darmo Permai III No.80, Pradahkalikendal, Kec. Dukuhpakis, Kota SBY",
    category: _tennis,
    facilities: [_wifi, _toilet, _locker],
    author: "Denise chan",
    authorUrl: "https://unsplash.com/photos/hAr9Nlo2Fz4",
    imageUrl: "https://unsplash.com/@noripurrs",
    phoneNumber: "0811 2222 3333",
    openDay: "All Day",
    openTime: "08.00",
    closeTime: "17.00",
    imageAsset: "assets/images/dc_tennis_court.jpg",
    price: 65000,
    lattitude: -7.272810179187626,
    longitude: 112.69065500506981,
    lokasi: '-7.272810179187626, 112.69065500506981');

SportField tennisCoates = SportField(
    id: "08",
    name: "Atlas Sports Club",
    address:
        "Jl. Dharmahusada Indah Barat III No.64-66, Mojo, Kec. Gubeng, Kota SBY",
    category: _tennis,
    facilities: [_toilet, _changingRoom, _chargingArea],
    author: "Rob coates",
    authorUrl: "https://unsplash.com/@itsrobcoates",
    imageUrl: "https://unsplash.com/photos/BDCTRVu7DwY",
    phoneNumber: "0877 8888 9999",
    openDay: "All Day",
    openTime: "08.00",
    closeTime: "15.00",
    imageAsset: "assets/images/tennis_coates.jpg",
    price: 60000,
    lattitude: -7.271445464100987,
    longitude: 112.77089295619422,
    lokasi: '-7.271445464100987, 112.77089295619422');

SportField futsalJaya = SportField(
    id: "09",
    name: "Veenu Sports",
    address:
        "Darmo Park II, Jl. Mayjen Sungkono No.5, Dukuh Pakis, Kec. Dukuhpakis, Kota SBY",
    category: _futsal,
    facilities: [_toilet, _canteen],
    author: "Izuddin Helmi Adnan",
    authorUrl: "https://unsplash.com/@izuddinhelmi",
    imageUrl: "https://unsplash.com/photos/siurZcdJGEw",
    phoneNumber: "0844 5555 6666",
    openDay: "All Day",
    openTime: "08.00",
    closeTime: "18.00",
    imageAsset: "assets/images/jaya_futsal.jpg",
    price: 70000,
    lattitude: -7.286444524574534,
    longitude: 112.71670261018657,
    lokasi: '-7.286444524574534, 112.71670261018657');

SportField tennisWing = SportField(
    id: "010",
    name: "Khairunnas Sport Center",
    address: "Jl. Gn. Anyar Indah, Gn. Anyar, Kec. Gn. Anyar, Kota SBY",
    category: _tennis,
    facilities: [_toilet, _changingRoom, _locker, _canteen],
    author: "Sergei Wing",
    authorUrl: "https://unsplash.com/@sergeiwing",
    imageUrl: "https://unsplash.com/photos/Bt-oCv_YI3E",
    phoneNumber: "0899 1010 2222",
    openDay: "All Day",
    openTime: "09.00",
    closeTime: "17.00",
    imageAsset: "assets/images/wing_tennis.jpg",
    price: 80000,
    lattitude: -7.332201349923127,
    longitude: 112.78526815970389,
    lokasi: '-7.332201349923127, 112.78526815970389');

List<SportField> sportFieldList = [
  futsalRionov,
  basketballVio,
  volleyTanjung,
  tableTennisDCortez,
  basketballKali,
  basketballLM,
  tennisDC,
  tennisCoates,
  futsalJaya,
  tennisWing,
];

List<SportField> recommendedSportField = [
  basketballVio,
  tennisWing,
  volleyTanjung,
  tableTennisDCortez,
  futsalRionov
];

List<FieldOrder> dummyUserOrderList = [];

List<String> timeToBook = [
  "06.00",
  "07.00",
  "08.00",
  "09.00",
  "10.00",
  "11.00",
  "12.00",
  "13.00",
  "14.00",
  "15.00",
  "16.00",
  "17.00",
  "18.00",
  "19.00",
  "20.00",
  "21.00",
  "22.00",
  "23.00"
];
