import 'package:flutter/material.dart';
import 'package:myth_games_case_study/generated/l10n.dart';
import 'package:myth_games_case_study/tools/assets.dart';
import 'package:myth_games_case_study/tools/color_helper.dart';
import 'package:myth_games_case_study/view/common/auth_button.dart';
import 'package:myth_games_case_study/view/common/auth_text_field.dart';
import 'package:myth_games_case_study/view/common/custom_back_button.dart';
import 'package:myth_games_case_study/view_model/register_view_model.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.scaffoldBackgroundColor,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        _buildBackgroundImage(),
        const Positioned(
          top: 0,
          left: 0,
          child: SafeArea(
            child: CustomBackButton(),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: _buildInputsCard(context),
        ),
      ],
    );
  }

  Widget _buildBackgroundImage() {
    return Image.asset(
      Assets.backgroundImage,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fitWidth,
      alignment: Alignment.topCenter,
    );
  }

  Widget _buildInputsCard(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.70,
      child: Card(
        color: ColorHelper.formBackgroundColor,
        margin: EdgeInsets.zero,
        elevation: 32,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: _buildButtonsColumn(context),
        ),
      ),
    );
  }

  Widget _buildButtonsColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        _buildTitleText(context),
        AuthTextField(
          label: S.of(context).labelName,
          inputType: TextInputType.name,
        ),
        AuthTextField(
          label: S.of(context).labelEmail,
          inputType: TextInputType.emailAddress,
        ),
        Row(
          children: [
            Expanded(
              child: Consumer<RegisterViewModel>(
                builder: (context, viewModel, child) => AuthTextField(
                  label: S.of(context).labelPassword,
                  inputType: TextInputType.text,
                  obscureText: !viewModel.showPassword,
                ),
              ),
            ),
            const SizedBox(width: 16),
            _buildShowPasswordButton(context),
          ],
        ),
        _buildCreateAccountButton(context),
      ],
    );
  }

  Widget _buildTitleText(BuildContext context) {
    return Text(
      textAlign: TextAlign.left,
      S.of(context).registerTitle,
      style: const TextStyle(
          color: ColorHelper.headTitleColor,
          fontSize: 30,
          fontWeight: FontWeight.bold),
    );
  }

  Widget _buildShowPasswordButton(BuildContext context) {
    RegisterViewModel viewModel = Provider.of<RegisterViewModel>(
      context,
      listen: false,
    );
    return GestureDetector(
      child: Image.asset(
        Assets.eyeImage,
        width: 32,
        fit: BoxFit.fitWidth,
      ),
      onTap: () {
        viewModel.changePasswordVisibility();
      },
    );
  }

  Widget _buildCreateAccountButton(BuildContext context) {
    RegisterViewModel viewModel = Provider.of<RegisterViewModel>(
      context,
      listen: false,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: AuthButton(
        title: S.of(context).authButtonTitle1,
        onPressed: () {
          viewModel.openEmailCheckPage(context);
        },
      ),
    );
  }
}
