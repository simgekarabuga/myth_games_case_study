import 'package:flutter/material.dart';
import 'package:myth_games_case_study/generated/l10n.dart';
import 'package:myth_games_case_study/tools/assets.dart';
import 'package:myth_games_case_study/tools/color_helper.dart';
import 'package:myth_games_case_study/view/common/auth_button.dart';
import 'package:myth_games_case_study/view/common/custom_back_button.dart';
import 'package:myth_games_case_study/view_model/email_check_view_model.dart';
import 'package:provider/provider.dart';

class EmailCheckPage extends StatelessWidget {
  const EmailCheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        _buildBackgroundImage(),
        _buildBodyColumn(context),
      ],
    );
  }

  Widget _buildBodyColumn(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBackButton(context),
              _buildTitle(context),
              _buildDescription(context),
            ],
          ),
          Column(
            children: [
              _buildGetStartedButton(context),
              const SizedBox(height: 32),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    EmailCheckViewModel viewModel = Provider.of<EmailCheckViewModel>(
      context,
      listen: false,
    );
    return CustomBackButton(
      onPressed: () {
        viewModel.onBackPressed(context);
      },
    );
  }

  Widget _buildBackgroundImage() {
    return Image.asset(
      Assets.emailBackgroundImage,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 20),
      child: Text(
        S.of(context).oneLastStep,
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          color: ColorHelper.headTitleColor,
        ),
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15,
        top: 15,
        right: MediaQuery.of(context).size.width * 0.1,
      ),
      child: Text(
        S.of(context).clickToLink,
        style: const TextStyle(
          fontSize: 17,
          color: ColorHelper.headTitleColor,
        ),
      ),
    );
  }

  Widget _buildGetStartedButton(BuildContext context) {
    EmailCheckViewModel viewModel = Provider.of<EmailCheckViewModel>(
      context,
      listen: false,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: AuthButton(
        title: S.of(context).authButtonTitle1,
        onPressed: () {
          viewModel.onGetStartedPressed();
        },
      ),
    );
  }
}
