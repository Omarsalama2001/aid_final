import 'package:aid_humanity/Features/profile/presentation/widgets/profile_page_widgets/profile_widget.dart';
import 'package:aid_humanity/core/extensions/translation_extension.dart';
import 'package:aid_humanity/core/widgets/defualt_app_bar_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) => getDefaultAppBarWidget(
        context: context,
        title: context.translate("profile"),
        color: Color(0xFFF8B145),
        backgroundColor:Colors.white
      );

  Widget _buildBody() =>  ProfileWidget();
}
