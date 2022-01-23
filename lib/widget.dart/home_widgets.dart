import 'package:devlance_internship/models/profile_data.dart';
import 'package:devlance_internship/widget.dart/heading_and_body.dart';
import 'package:flutter/material.dart';
import 'package:devlance_internship/widget.dart/show_profile_picture.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
          SizedBox(
            height: 15,
          ),
          Text(
            'Data is being loaded',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class FailedWidget extends StatelessWidget {
  final VoidCallback onTapFunction;
  const FailedWidget({Key? key, required this.onTapFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            color: Colors.redAccent,
            size: 35,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Data could not be loaded',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: onTapFunction,
              child: const Text(
                'Retry',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final ProfileData profileData;
  const ProfileWidget({Key? key, required this.profileData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              ShowProfilePicture(url: profileData.pictureLink, dimension: 120),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(profileData.firstName + ' ' + profileData.lastName,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    Text(profileData.email,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.grey)),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 1.5,
            color: Colors.black12,
            width: double.infinity,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingAndBody(heading: 'Gender', body: profileData.gender),
              HeadingAndBody(heading: 'Email Address', body: profileData.email),
              HeadingAndBody(
                  heading: 'Mobile Number', body: profileData.cellNumber),
              HeadingAndBody(
                  heading: 'Date Of Birth  (YY/MM/DD)', body: profileData.dob),
              HeadingAndBody(
                  heading: 'Residence Address', body: profileData.address),
            ],
          ),
        ],
      ),
    );
  }
}
