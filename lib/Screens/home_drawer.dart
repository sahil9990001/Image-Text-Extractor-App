import 'package:flutter/material.dart';

class HomeDrawer extends StatefulWidget {
  final Function pickImageFromGallery;
  final Function captureImageWithCamera;
  const HomeDrawer(this.pickImageFromGallery, this.captureImageWithCamera);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Developed By: SAHIL BANSAL',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
            ),
            accountEmail: Text('sahilbansal4569@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/download.png'),
            ),
          ),
          ListTile(
            onTap: () => Navigator.of(context).pop(),
            title: Text('Home'),
            trailing: Icon(
              Icons.arrow_forward_ios,
            ),
            leading: Icon(Icons.home_sharp),
          ),
          ListTile(
              onTap: () {
                widget.pickImageFromGallery();
                Navigator.pop(context);
              },
              title: Text('Camera'),
              trailing: Icon(
                Icons.arrow_forward_ios,
              ),
              leading: Icon(Icons.add_a_photo)),
          ListTile(
              onTap: () {
                widget.captureImageWithCamera();
                Navigator.pop(context);
              },
              title: Text('Gallery'),
              trailing: Icon(
                Icons.arrow_forward_ios,
              ),
              leading: Icon(Icons.image_sharp)),
          ListTile(
              onTap: () {},
              title: Text('Share'),
              trailing: Icon(
                Icons.arrow_forward_ios,
              ),
              leading: Icon(Icons.share_sharp)),
          ListTile(
              onTap: () {},
              title: Text('Rate App'),
              trailing: Icon(
                Icons.arrow_forward_ios,
              ),
              leading: Icon(Icons.star_border_sharp)),
          // Spacer(),
          Divider(
            height: 1,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
