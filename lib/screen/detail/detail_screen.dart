import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spod_app/model/sport_field.dart';
import 'package:spod_app/screen/detail/checkout_screen.dart';
import 'package:spod_app/theme.dart';
import 'package:spod_app/widget/facility_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailScreen extends StatefulWidget {
  final SportField field;
  const DetailScreen({Key? key, required this.field}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // SportField field;
  // DetailScreen({required this.field});
  //late SportField field = widget.field;

  // SportField field;
  // _DetailScreenState({required this.field});

  // final _newField = widget.field;

  // static double lat = field.lattitude;
  // static double long = widget.field.longitude;

  GoogleMapController? mapController; //contrller for Google map
  Set<Marker> markers = Set(); //markers for google map
  //final LatLng showLocation = const LatLng(lat, long)
  //LatLng showLocation = LatLng(lat, long);
  //LatLng showLocation = LatLng(-7.306663599478544, 112.72819510206308); //kampus
  //location to show in map
  @override
  void initState() {
    final newField = widget.field;
    String judul = newField.name;
    String alamat = newField.address;
    double lat = newField.lattitude;
    double long = newField.longitude;
    String showLocation = newField.lokasi;
    markers.add(Marker(
      //add marker on google map
      markerId: MarkerId(showLocation),
      position: LatLng(lat, long), //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: judul,
        snippet: alamat,
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    //you can add more markers here
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          customSliverAppBar(context, widget.field),
          SliverPadding(
            padding:
                const EdgeInsets.only(right: 24, left: 24, bottom: 24, top: 8),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/pin.png",
                      width: 24,
                      height: 24,
                      color: primaryColor500,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Flexible(
                      child: Text(
                        widget.field.address,
                        overflow: TextOverflow.visible,
                        style: addressTextStyle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      CupertinoIcons.money_dollar_circle_fill,
                      color: primaryColor500,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Flexible(
                      child: Text(
                        "Rp. ${widget.field.price} / hour",
                        overflow: TextOverflow.visible,
                        style: addressTextStyle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  "Contact:",
                  style: subTitleTextStyle,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.phone,
                      color: primaryColor500,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Flexible(
                      child: Text(
                        widget.field.phoneNumber,
                        overflow: TextOverflow.visible,
                        style: addressTextStyle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.account_circle_rounded,
                      color: primaryColor500,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Flexible(
                      child: Text(
                        widget.field.author,
                        overflow: TextOverflow.visible,
                        style: addressTextStyle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  "Avaibility:",
                  style: subTitleTextStyle,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.date_range_rounded,
                      color: primaryColor500,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      widget.field.openDay,
                      style: descTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      color: primaryColor500,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      "${widget.field.openTime} - ${widget.field.closeTime}",
                      style: descTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                //maps yaaaaaaaaaaaaaa
                Text(
                  "Maps:",
                  style: subTitleTextStyle,
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: colorWhite,
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor500.withOpacity(0.1),
                          blurRadius: 20,
                        )
                      ]),
                  height: 200,
                  child: GoogleMap(
                    //Map widget from google_maps_flutter package
                    zoomGesturesEnabled: true, //enable Zoom in, out on map
                    initialCameraPosition: CameraPosition(
                      //innital position in map
                      target: LatLng(widget.field.lattitude,
                          widget.field.longitude), //initial position
                      zoom: 11.0, //initial zoom level
                    ),
                    markers: markers, //markers to show on map
                    mapType: MapType.normal, //map type
                    onMapCreated: (controller) {
                      //method called when map is created
                      setState(() {
                        mapController = controller;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  "Facilities:",
                  style: subTitleTextStyle,
                ),
                const SizedBox(
                  height: 16,
                ),
                FacilityCardList(facilities: widget.field.facilities),
              ]),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: lightBlue300,
            offset: Offset(0, 0),
            blurRadius: 10,
          ),
        ]),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadiusSize))),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CheckoutScreen(
                  field: widget.field,
                );
              }));
            },
            child: const Text("Book Now")),
      ),
    );
  }

  Widget customSliverAppBar(context, field) {
    return SliverAppBar(
      shadowColor: primaryColor500.withOpacity(.2),
      backgroundColor: colorWhite,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black.withOpacity(0.4),
        statusBarIconBrightness: Brightness.light,
      ),
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        expandedTitleScale: 1,
        titlePadding: EdgeInsets.zero,
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: kToolbarHeight,
          decoration: const BoxDecoration(
              color: colorWhite,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(borderRadiusSize))),
          child: Center(
            child: Text(
              field.name,
              style: titleTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        background: Image.asset(
          field.imageAsset,
          fit: BoxFit.cover,
        ),
        collapseMode: CollapseMode.parallax,
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
            color: colorWhite,
            shape: BoxShape.circle,
          ),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              iconSize: 26,
              icon: const Icon(
                Icons.arrow_back,
                color: darkBlue500,
              )),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              color: colorWhite,
              shape: BoxShape.circle,
            ),
            child: PopupMenuButton(
              tooltip: "Image's Author Url",
              padding: EdgeInsets.zero,
              icon: const Icon(CupertinoIcons.info, color: darkBlue500),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                    enabled: false,
                    child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: lightBlue100,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          "Image by:",
                          style: subTitleTextStyle,
                        ))),
                PopupMenuItem(
                    onTap: () => launch(field.authorUrl),
                    child: ListTile(
                      horizontalTitleGap: 0,
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.account_circle_outlined),
                      title: Text(
                        "${field.author} on Unsplash.com",
                        style: normalTextStyle,
                      ),
                    )),
                PopupMenuItem(
                    onTap: () => launch(field.imageUrl),
                    child: ListTile(
                      horizontalTitleGap: 0,
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.image_outlined),
                      title: Text(
                        "See original image",
                        style: normalTextStyle,
                      ),
                    )),
              ],
            ),
          ),
        )
      ],
      expandedHeight: 300,
    );
  }
}
// class DetailScreen extends StatelessWidget {

// }
