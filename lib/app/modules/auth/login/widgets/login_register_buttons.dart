part of '../login_page.dart';

class _LoginRegisterButtons extends StatelessWidget {
  const _LoginRegisterButtons();

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<LoginController>();

    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      spacing: 10.w,
      runSpacing: 10.h,
      children: [
        RoundedButtonWithIcon(
          onTap: () {
            controller.socialLogin(SocialLoginType.facebook);
          },
          width: .42.sw,
          color: const Color(0XFF4267B3),
          icon: CuidapetIcons.facebook,
          label: 'Facebook',
        ),
        RoundedButtonWithIcon(
          onTap: () {
            controller.socialLogin(SocialLoginType.google);
          },
          width: .42.sw,
          color: const Color(0XFFE15031),
          icon: CuidapetIcons.google,
          label: 'Google',
        ),
        RoundedButtonWithIcon(
          onTap: () {
            Navigator.pushNamed(context, '/auth/register/');
          },
          width: .42.sw,
          color: context.primaryColorDark,
          icon: Icons.mail,
          label: 'Cadastrar-se',
        ),
      ],
    );
  }
}
