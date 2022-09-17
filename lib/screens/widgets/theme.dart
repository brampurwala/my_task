/*fonts*/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const fontRegular = 'Regular';
const fontMedium = 'Medium';
const fontSemibold = 'Semibold';
const fontBold = 'Bold';

/* font sizes*/
const textSizeSmall = 12.0;
const textSizeSMedium = 14.0;
const textSizeMedium = 16.0;
const textSizeLargeMedium = 18.0;
const textSizeNormal = 20.0;
const textSizeLarge = 24.0;
const textSizeXLarge = 30.0;

/* margin */
const spacing_control_half = 2.0;
const spacing_control = 4.0;
const spacing_standard = 8.0;
const spacing_middle = 10.0;
const spacing_standard_new = 16.0;
const spacing_large = 24.0;
const spacing_xlarge = 32.0;
const spacing_xxLarge = 40.0;

const profileImage = 'assets/images/profile.png';
const logo = "assets/images/illustration.png";
const noImage = "assets/images/no_image.png";
const rocket = "assets/images/rocket.gif";
const menu = "assets/images/icons/menu.svg";
const user = 'assets/images/icons/user.svg';
const home = 'assets/images/icons/home.svg';
const pin = 'assets/images/icons/pin.svg';
const wallet = 'assets/images/icons/wallet.png';
const login_bg = 'assets/images/login_bg.svg';

const app_background = Color(0XFFE9E9E9);
const white = Color(0XFFffffff);

const colorPrimary = Color(0XFF373435);
const colorAccent = Color(0XFFf76c44);
const textColorPrimary = Color(0XFF333333);
const textColorSecondary = Color(0XFF747474);
const colorPrimary_light = Color(0XFFFFEEEE);
const colorPrimaryDark = Color(0XFF212121);

const view_color = Color(0XFFDADADA);

const icon_color = Color(0XFF747474);
const selected_tab = Color(0XFFFCE9E9);
const primary = Color(0Xff0047ba);
const red = Color(0XFFF10202);
const blue = Color(0XFF1D36C0);
const green = Color(0XFF4CAF50);
const edit_text_background = Color(0XFFE8E8E8);
const shadow = Color(0X70E2E2E5);
const shadow_color = Color(0X95E9EBF0);
const color_primary_light = Color(0XFFFCE8E8);
const bg_bottom_sheet = Color(0XFFFFF1F1);

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: colorPrimary,
    elevation: 0,
    textTheme: TextTheme(
      headline6: TextStyle(
        color: white,
        fontFamily: fontBold,
        fontSize: 18,
      ),
    ),
    actionsIconTheme: IconThemeData(color: white),
    iconTheme: IconThemeData(color: white),
  );
}

Widget text(
    String text, {
      var fontSize = textSizeMedium,
      textColor = textColorSecondary,
      var fontFamily = fontRegular,
      var isCentered = false,
      var maxLine = 1,
      var latterSpacing,
      var textAllCaps = false,
      var isLongText = false,
      var decoration,
    }) {
  return Text(
    textAllCaps ? text.toUpperCase() : text,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: isLongText ? null : maxLine,
    style: TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      color: textColor,
      height: 1.5,
      decoration: decoration,
      letterSpacing: latterSpacing,
    ),
  );
}

Widget rowHeading(var label, var subLabel) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: text(
            label,
            textColor: textColorPrimary,
            fontFamily: fontSemibold,
            isLongText: true,
          ),
        ),
        Expanded(
          flex: 3,
          child: text(
            subLabel,
            textColor: textColorPrimary,
            fontFamily: fontSemibold,
            isLongText: true,
          ),
        )
      ],
    ),
  );
}

Divider view() {
  return const Divider(
    color: textColorSecondary,
    height: 0.5,
  );
}

BoxDecoration boxDecoration({
  double radius = 2,
  Color color = Colors.transparent,
  Color bgColor = white,
  var showShadow = false,
  Gradient? gradient,
}) {
  return BoxDecoration(
    color: bgColor,
    boxShadow: showShadow ? [const BoxShadow(color: Color(0XFFF2F2F2), blurRadius: 10, spreadRadius: 2)] : [const BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    gradient: gradient,
  );
}

TextStyle primaryTextStyle({
  double? fontSize,
  Color color = textColorPrimary,
  FontWeight weight = FontWeight.normal,
  String? fontFamily,
  double? letterSpacing,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: weight,
    fontFamily: fontFamily,
    letterSpacing: letterSpacing,
  );
}

Container inputBoxStyle(
    var hintText, {
      isPassword = false,
      bool readonly = false,
      bool? obscureText,
      TextEditingController? controller,
      FormFieldSetter<String>? onSaved,
      FormFieldValidator<String>? validator,
      int? maxLength,
      ValueChanged<String>? onChanged,
      TextInputType? keyboardType,
      List<TextInputFormatter>? inputFormatters,
      Widget? suffixIcon,
      bool textCapital = false,
      Widget? prefixIcon,
      GestureTapCallback? onTap,
      TextCapitalization? textCapitalization,
    }) {
  return Container(
    decoration: boxDecoration(radius: 6, showShadow: false, bgColor: white),
    child: TextFormField(
      style: const TextStyle(fontSize: textSizeMedium, fontFamily: fontRegular),
      readOnly: readonly,
      obscureText: isPassword,
      controller: controller,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      cursorColor: colorPrimary,
      onTap: onTap,
      textCapitalization:textCapital? TextCapitalization.characters :TextCapitalization.none,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        filled: true,
        fillColor: white,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        counterText: "",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: white, width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: white, width: 0.0),
        ),
      ),
    ),
  );
}

floatingInput(
    String hintText, {
      isPassword = false,
      bool readonly = false,
      bool? obscureText,
      TextEditingController? controller,
      FormFieldSetter<String>? onSaved,
      FormFieldValidator<String>? validator,
      int? maxLength,
      ValueChanged<String>? onChanged,
      TextInputType? keyboardType,
      List<TextInputFormatter>? inputFormatters,
      String? counterText,
      Widget? suffixIcon,
      Widget? prefixIcon,
      bool textCapital = false,
      int maxLines = 1,
      GestureTapCallback? onTap,
      TextCapitalization? textCapitalization,
    }) {
  return TextFormField(
    readOnly: readonly,
    obscureText: isPassword,
    controller: controller,
    validator: validator,
    onSaved: onSaved,
    onChanged: onChanged,
    maxLength: maxLength,
    inputFormatters: inputFormatters,
    keyboardType: keyboardType,
    cursorColor: colorPrimary,
    onTap: onTap,
    textCapitalization:textCapital? TextCapitalization.characters :TextCapitalization.none,
    decoration: InputDecoration(
      labelText: hintText,
      isDense: true,
      labelStyle: primaryTextStyle(
        fontSize: textSizeMedium,
        color: textColorPrimary.withOpacity(0.7),
        fontFamily: fontMedium,
      ),
      // prefixIcon: prefixIcon,
      counterText: '',
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.black12)),
      focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: colorPrimary)),
    ),
    maxLines: maxLines,
  );
}

Widget formField(
    context,
    hint, {
      isEnabled = true,
      isDummy = false,
      TextEditingController? controller,
      isPasswordVisible = false,
      isPassword = false,
      keyboardType = TextInputType.text,
      FormFieldValidator<String>? validator,
      onSaved,
      textInputAction = TextInputAction.next,
      ValueChanged<String>? onChanged,
      List<TextInputFormatter>? inputFormatters,
      FocusNode? focusNode,
      FocusNode? nextFocus,
      IconData? suffixIcon,
      IconData? prefixIcon,
      maxLine = 1,
      suffixIconSelector,
    }) {
  return TextFormField(
    controller: controller,
    obscureText: isPassword ? isPasswordVisible : false,
    cursorColor: colorPrimary,
    maxLines: maxLine,
    keyboardType: keyboardType,
    validator: validator,
    onSaved: onSaved,
    onChanged: onChanged,
    textInputAction: textInputAction,
    focusNode: focusNode,
    onFieldSubmitted: (arg) {
      if (nextFocus != null) {
        FocusScope.of(context).requestFocus(nextFocus);
      }
    },
    decoration: InputDecoration(
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(spacing_standard),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(spacing_standard),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 15),
      filled: true,
      fillColor: const Color(0xFFf7f7f7),
      hintText: hint,
      hintStyle: const TextStyle(fontSize: textSizeMedium, color: textColorSecondary),
      prefixIcon: Icon(
        prefixIcon,
        color: textColorSecondary,
        size: 20,
      ),
      suffixIcon: isPassword
          ? GestureDetector(
        onTap: suffixIconSelector,
        child: new Icon(
          suffixIcon,
          color: textColorSecondary,
          size: 20,
        ),
      )
          : Icon(
        suffixIcon,
        color: textColorSecondary,
        size: 20,
      ),
    ),
    style: TextStyle(
      fontSize: textSizeLargeMedium,
      color: isDummy ? Colors.transparent : colorPrimaryDark,
      fontFamily: fontRegular,
    ),
  );
}

class CustomButton extends StatefulWidget {
  var textContent;
  VoidCallback onPressed;
  var isStroked = false;

  CustomButton({
    @required this.textContent,
    required this.onPressed,
    this.isStroked = false,
  });

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
        alignment: Alignment.center,
        child: text(
          widget.textContent,
          textColor: widget.isStroked ? colorPrimary : white,
          isCentered: true,
          fontFamily: fontMedium,
          textAllCaps: true,
        ),
        decoration: widget.isStroked ? boxDecoration(bgColor: Colors.transparent, color: colorPrimary) : boxDecoration(bgColor: colorPrimary, radius: 5),
      ),
    );
  }
}

Widget emptyWidget(BuildContext context, String image, String title, String desc, {bool showRetry = false, Function? onRetry}) {
  return Container(
    color: white,
    constraints: const BoxConstraints(maxWidth: 500.0),
    height: MediaQuery.of(context).size.height,
    child: Stack(
      children: [
        Image.asset(
          image,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fitWidth,
        ),
        Positioned(
          bottom: 30,
          left: 20,
          right: 20,
          child: Container(
            decoration: boxDecoration(
              radius: 10,
              showShadow: true,
              bgColor: Colors.grey[200]!,
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                text(
                  title,
                  textColor: colorPrimaryDark,
                  fontFamily: fontBold,
                  fontSize: textSizeLargeMedium,
                  maxLine: 2,
                ),
                const SizedBox(height: 5),
                text(
                  desc,
                  isCentered: true,
                  isLongText: true,
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
