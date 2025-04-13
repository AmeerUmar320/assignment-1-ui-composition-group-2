import 'package:flutter/material.dart';

//post widget, represents individual tweets
class PostCard extends StatelessWidget {
  final String profilePicture;
  final String name;
  final String handle;
  final String caption;
  final String time;
  final String? linkCaption;
  final String? linkSite;
  final String? sharedPicture;
  final bool isVerified;

  Widget _addSharedPicture() {
    if(sharedPicture != null && linkCaption == null) {
      return SharedPicture(image: sharedPicture!);
    }
    if(sharedPicture != null && linkCaption != null) {
      return SharedPicture(image: sharedPicture!, title: linkCaption, website: linkSite,);
    }
    return SizedBox.shrink();
  }

  Widget _addVerifiedIcon() {
    if(isVerified == true) {
      return Icon(Icons.verified, color: Colors.blue, size: 16);
    }
    return SizedBox.shrink();
  }

  const PostCard({super.key, required this.profilePicture, required this.name, required this.handle, required this.caption, required this.time,this.linkCaption, this.linkSite, this.sharedPicture, this.isVerified = false}); // type can be 'text-only', 'picture-with-text', 'link-with-picture'. by default it is 'text-only'

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom : BorderSide(
            color: const Color.fromARGB(255, 204, 204, 204), width: .5, style: BorderStyle.solid,
          )
        )
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            //outermost row
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //profile picture
                ClipOval( child: Image.asset(profilePicture, height: 50)),
      
                //horizontal separation
                SizedBox(width: 10,),
                Expanded(
                  //column for name, caption, picture and action buttons. one on top of the other
                  child: Column(
                    children: [
                      //name, handle, time and drop-down in a row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                          _addVerifiedIcon(),
                          SizedBox(width: 5),
                          Text("@$handle", style: TextStyle(color: Color.fromARGB(255, 114, 114, 114))),
                          //the time is inside a flexible widget so if the name and handle gets too long the time is clipped.
                          Flexible(
                            child: Text(
                              " · $time", 
                              style: TextStyle(color: Color.fromARGB(255, 114, 114, 114)),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Spacer(),//to push the next icon to far right
                          Icon(Icons.keyboard_arrow_down, color: Colors.grey,),
                        ],
                      ),
                      
                      //actual caption (main text)
                      Text(caption),
      
                      //shared picture if there is any
                      SizedBox(height: 5),
                      _addSharedPicture(),
      
                      //action button icons at the bottom of the post
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(Icons.mode_comment_outlined, size: 18, color: Colors.grey),
                          Icon(Icons.repeat, size: 18, color: Colors.grey),
                          Row(
                            children: [
                              Icon(Icons.favorite_border, size: 18, color: Colors.grey),
                              SizedBox(width: 4),
                              Text("1", style: TextStyle(fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                          Icon(Icons.share_outlined, size: 18, color: Colors.grey),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ),
          //divider to create a horizontal grey line to create separation between posts
          // Divider(
          //   color: const Color.fromARGB(255, 221, 221, 221),
          //   thickness: 1,
          // ),
        ]
      ),
    );
  }
}

//picture card for tweets with images, can be a simple image OR shared link with image and caption and site
class SharedPicture extends StatelessWidget {
  final String? title;
  final String? website;
  final String image;
  const SharedPicture({super.key, required this.image, this.title, this.website});

  Widget addTitle() {
    if(!(title == null)){
      return Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title ?? '', style: TextStyle(fontSize: 16),),
            Text(website ?? 'default.com', style: TextStyle(color: const Color.fromARGB(255, 110, 110, 110), fontSize: 15),)
          ],
        ),
      );
    }
    return SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
        Container(
          clipBehavior:Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color.fromARGB(255, 192, 192, 192), width: 0.5, style: BorderStyle.solid)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image, fit: BoxFit.cover,),
              addTitle(),
            ],
          ),
        )
      ],
    );
  }
}