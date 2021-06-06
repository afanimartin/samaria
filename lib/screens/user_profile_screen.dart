import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/authentication/authentication_bloc.dart';
import '../blocs/donation/donation_bloc.dart';
import '../blocs/donation/donation_state.dart';

///
class UserProfileScreen extends StatelessWidget {
  ///
  const UserProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);

    return Scaffold(
        body: BlocBuilder<DonationBloc, DonationState>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(),
            CircleAvatar(
                radius: 40,
                backgroundImage: CachedNetworkImageProvider(user.photoUrl)),
            Text(
              user.displayName,
              style: const TextStyle(fontSize: 28),
            ),
            Text(
              user.email,
              style: const TextStyle(fontSize: 22, color: Colors.black45),
            ),
            if (state is DonationsUpdated)
              Text(
                'Donations (${state.currentUserDonations.length})',
                style: const TextStyle(fontSize: 22),
              )
          ],
        ),
      ),
    ));
  }
}
