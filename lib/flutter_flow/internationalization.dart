import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'mr', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? mrText = '',
    String? hiText = '',
  }) =>
      [enText, mrText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // loginscreen
  {
    '579qyqz2': {
      'en': 'WELCOME BACK !',
      'hi': 'वापसी पर स्वागत है !',
      'mr': 'परत आपले स्वागत आहे!',
    },
    'hl4v3cj8': {
      'en': 'Login',
      'hi': 'लॉग इन करें',
      'mr': 'लॉगिन करा',
    },
    '3y6whc4w': {
      'en': 'Email',
      'hi': 'ईमेल',
      'mr': 'ईमेल',
    },
    '49vg70ik': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'mr': 'पासवर्ड',
    },
    '7u2tow56': {
      'en': 'Forget Password ?',
      'hi': 'पासवर्ड भूल गए ?',
      'mr': 'पासवर्ड विसरलात?',
    },
    'aafib51x': {
      'en': 'login',
      'hi': 'लॉग इन करें',
      'mr': 'लॉगिन',
    },
    'wtcn28q7': {
      'en': 'Field is required',
      'hi': '',
      'mr': '',
    },
    'd3rd7cok': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '70zzmlye': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'mr': '',
    },
    'c5vpxo8n': {
      'en': 'Field is required',
      'hi': '',
      'mr': '',
    },
    'erfizki1': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'mr': '',
    },
    'i5qlfwec': {
      'en': 'Or Login with',
      'hi': 'या लॉगिन करें',
      'mr': 'किंवा यासह लॉगिन करा',
    },
    'gynhrghl': {
      'en': 'New Here ?',
      'hi': 'अब यहां ?',
      'mr': 'येथे नवीन?',
    },
    'gs664sff': {
      'en': 'Sign Up Now',
      'hi': 'अभी साइनअप करें',
      'mr': 'आत्ताच नोंदणी करा',
    },
    '4o1v294h': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // signinscreen
  {
    'natb6svf': {
      'en': 'New Here ?',
      'hi': 'अब यहां ?',
      'mr': 'येथे नवीन?',
    },
    'bi4v4y0r': {
      'en': 'Sign In',
      'hi': 'दाखिल करना',
      'mr': 'साइन इन करा',
    },
    'ayfbzzud': {
      'en': 'Email',
      'hi': 'ईमेल',
      'mr': 'ईमेल',
    },
    'k3xo1sjj': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'mr': 'पासवर्ड',
    },
    'jzyvgkee': {
      'en': 'sign in',
      'hi': 'दाखिल करना',
      'mr': 'साइन इन करा',
    },
    'x75o7g5t': {
      'en': 'Or ',
      'hi': 'या',
      'mr': 'किंवा',
    },
    'dgifce0r': {
      'en': 'Sign in with Apple',
      'hi': 'Apple के साथ साइन इन करें',
      'mr': 'Apple सह साइन इन करा',
    },
    '0mh6stce': {
      'en': 'Sign in with Google',
      'hi': 'Google के साथ साइन इन करें',
      'mr': 'Google सह साइन इन करा',
    },
    'b3k8pusv': {
      'en': 'Already have account ?',
      'hi': 'पहले से खाता है?',
      'mr': 'आधीच खाते आहे?',
    },
    '794xiseo': {
      'en': 'Log in',
      'hi': 'लॉग इन करें',
      'mr': 'लॉग इन करा',
    },
    'mlg3bnj0': {
      'en': 'By proceeding you agree to our',
      'hi': 'आगे बढ़ने से आप हमारी शर्तों से सहमत हैं',
      'mr': 'पुढे जाऊन तुम्ही आमच्याशी सहमत आहात',
    },
    'r95lv50p': {
      'en': 'Terms & Conditions',
      'hi': 'नियम एवं शर्तें',
      'mr': 'अटी व शर्ती',
    },
    'w7kcqkvz': {
      'en': 'Field is required',
      'hi': '',
      'mr': '',
    },
    'q09gwac2': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'mr': '',
    },
    'r6e7144l': {
      'en': 'Field is required',
      'hi': '',
      'mr': '',
    },
    '4jwh6w6o': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'mr': '',
    },
    'c45tqa29': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // home
  {
    'tcgfeqwk': {
      'en': 'Nari Suraksha setu',
      'hi': '',
      'mr': '',
    },
    'h5btfy97': {
      'en': 'Awareness',
      'hi': 'जागरूकता',
      'mr': 'जाणीव',
    },
    'rq065p2o': {
      'en': 'AI Chatbot',
      'hi': 'समुदाय',
      'mr': 'समुदाय',
    },
    'eud2pesu': {
      'en': 'Emergency\n',
      'hi': 'आपातकाल',
      'mr': 'आणीबाणी',
    },
    'ohzvz9v8': {
      'en': 'Safety Tips',
      'hi': 'सुरक्षा टिप्स',
      'mr': 'सुरक्षितता टिपा',
    },
    'niq40vo1': {
      'en': 'Go to profile',
      'hi': 'प्रोफ़ाइल करने के लिए जाना',
      'mr': 'प्रोफाइल वर जा',
    },
    'hjgaqvpo': {
      'en': 'Home\n',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
    '6qpp2yqs': {
      'en': 'About Us',
      'hi': 'हमारे बारे में',
      'mr': 'आमच्याबद्दल',
    },
    '2igfbdzt': {
      'en': 'Privacy Policy',
      'hi': 'गोपनीयता नीति',
      'mr': 'गोपनीयता धोरण',
    },
    'lfq9myg6': {
      'en': 'Support And Contact',
      'hi': 'संपर्क करें',
      'mr': 'आमच्याशी संपर्क साधा',
    },
    'fyu1adpg': {
      'en': 'Feedback',
      'hi': 'प्रतिक्रिया',
      'mr': 'अभिप्राय',
    },
    'wdf2zkfz': {
      'en': 'Terms and Conditions',
      'hi': 'प्रतिक्रिया',
      'mr': 'अभिप्राय',
    },
    'p63ieyfz': {
      'en': 'Log Out',
      'hi': 'लॉग आउट',
      'mr': 'बाहेर पडणे',
    },
    '803fw6cr': {
      'en': 'home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // safetytips
  {
    'lx8490h2': {
      'en': 'Domestic violence Act',
      'hi': 'घरेलू हिंसा अधिनियम',
      'mr': 'घरगुती हिंसाचार कायदा',
    },
    '030d3kw2': {
      'en': 'Dowry Prohibition Act',
      'hi': 'दहेज निषेध अधिनियम',
      'mr': 'हुंडा बंदी कायदा',
    },
    '0ky2sf0n': {
      'en': 'Sexual Harassment ',
      'hi': 'यौन उत्पीड़न',
      'mr': 'लैगिक अत्याचार',
    },
    'zy50fd7c': {
      'en': 'National Commision Act',
      'hi': 'राष्ट्रीय आयोग अधिनियम',
      'mr': 'राष्ट्रीय आयोग कायदा',
    },
    'l2fzilnx': {
      'en': 'Safety Tips',
      'hi': 'सुरक्षा टिप्स',
      'mr': 'सुरक्षितता टिपा',
    },
    'uhlh3a2z': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // emergency
  {
    'vauhtgt2': {
      'en': '  Police Helpline\n 112\n',
      'hi': 'पुलिस हेल्पलाइन\n112',
      'mr': 'पोलिस हेल्पलाइन\n 112',
    },
    'n17hri17': {
      'en': '       call',
      'hi': 'पुकारना',
      'mr': 'कॉल',
    },
    'g3p9ifpw': {
      'en': 'National women Helpline\n181',
      'hi': 'राष्ट्रीय महिला हेल्पलाइन\n181',
      'mr': 'राष्ट्रीय महिला हेल्पलाइन\n181',
    },
    'wlrjqdnz': {
      'en': 'call',
      'hi': 'पुकारना',
      'mr': 'कॉल',
    },
    'e4ren25x': {
      'en': 'Cybercrime Helpline\n1930',
      'hi': 'साइबर अपराध हेल्पलाइन\n1930',
      'mr': 'सायबर क्राईम हेल्पलाइन\n1930',
    },
    'vbt7el6r': {
      'en': 'call',
      'hi': 'पुकारना',
      'mr': 'कॉल',
    },
    'rxqti632': {
      'en': 'Medical Helpline\n 104\n ',
      'hi': 'मेडिकल हेल्पलाइन\n104',
      'mr': 'वैद्यकीय हेल्पलाइन\n 104',
    },
    'sqyw66gp': {
      'en': 'call',
      'hi': 'पुकारना',
      'mr': 'कॉल',
    },
    'vmc5hrty': {
      'en': 'Domestic volience Helpline \n1091',
      'hi': 'घरेलू स्वैच्छिक सहायता हेल्पलाइन\n1091',
      'mr': 'घरगुती हिंसा हेल्पलाइन\n१०९१',
    },
    'foxl1ytr': {
      'en': 'call',
      'hi': 'पुकारना',
      'mr': 'कॉल',
    },
    '4dpohf4e': {
      'en': 'Emergency contacts',
      'hi': 'आपातकालीन संपर्क',
      'mr': 'आपत्कालीन संपर्क',
    },
    'qy25qe6h': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // personalinfo
  {
    'g44gzlqw': {
      'en': 'Upload Image',
      'hi': 'तस्विर अपलोड करना',
      'mr': 'प्रतिमा अपलोड करा',
    },
    '7d2focjs': {
      'en': 'Enter your user name',
      'hi': 'अपना उपयोगकर्ता नाम दर्ज करें',
      'mr': 'तुमचे वापरकर्ता नाव प्रविष्ट करा',
    },
    's88n3s9s': {
      'en': 'Mobile Number',
      'hi': 'मोबाइल नंबर',
      'mr': 'मोबाईल नंबर',
    },
    'nre1o4uj': {
      'en': '+91  ',
      'hi': '+91',
      'mr': '+९१',
    },
    'xeilvnz2': {
      'en': 'Enter your age',
      'hi': 'अपनी आयु दर्ज करें',
      'mr': 'तुमचे वय प्रविष्ट करा',
    },
    '72gtkpsy': {
      'en': 'Enter your address',
      'hi': 'अपना पता दर्ज करें',
      'mr': 'तुमचा पत्ता प्रविष्ट करा',
    },
    '2mw0aqh0': {
      'en': 'Save Profile',
      'hi': 'प्रोफ़ाइल बचा',
      'mr': 'प्रोफाइल जतन करा',
    },
    '1s5lme36': {
      'en': 'Field is required',
      'hi': '',
      'mr': '',
    },
    'td8dpaqj': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'mr': '',
    },
    'vkfv18lp': {
      'en': 'Field is required',
      'hi': '',
      'mr': '',
    },
    'pdtb1t6i': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'mr': '',
    },
    '1mgk2bve': {
      'en': 'Field is required',
      'hi': '',
      'mr': '',
    },
    'p6eqns4h': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'mr': '',
    },
    '7w890o5e': {
      'en': 'Field is required',
      'hi': '',
      'mr': '',
    },
    '6j9cn41g': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'mr': '',
    },
    't93pi0lu': {
      'en': 'Create Profile',
      'hi': 'प्रोफ़ाइल बनाने',
      'mr': 'प्रोफाइल तयार करा',
    },
    'xl5i5e5f': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // privacyypolicy
  {
    '93rm26sr': {
      'en': 'PRIVACY POLICY',
      'hi': 'गोपनीयता नीति',
      'mr': 'गोपनीयता धोरण',
    },
    'hr5i3vaa': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // feedback
  {
    'r4tg0ju7': {
      'en': 'Feedback',
      'hi': 'प्रतिक्रिया',
      'mr': 'अभिप्राय',
    },
    'n65brvkj': {
      'en':
          'Your feedback helps us to improve the app and the ecosystem. This feedback will not be visible to other app users.',
      'hi':
          'आपकी प्रतिक्रिया हमें ऐप और पारिस्थितिकी तंत्र को बेहतर बनाने में मदद करती है। यह प्रतिक्रिया अन्य ऐप उपयोगकर्ताओं को दिखाई नहीं देगी।',
      'mr':
          'तुमचा फीडबॅक आम्हाला ॲप आणि इकोसिस्टम सुधारण्यात मदत करतो. हा फीडबॅक इतर ॲप वापरकर्त्यांना दिसणार नाही.',
    },
    '7twmq0bh': {
      'en': 'Your valuable feedback here.........',
      'hi': 'आपकी बहुमूल्य प्रतिक्रिया यहाँ.........',
      'mr': 'तुमचा बहुमोल अभिप्राय इथे.........',
    },
    'w09hpi2e': {
      'en': 'Submit',
      'hi': 'जमा करना',
      'mr': 'प्रस्तुत करणे',
    },
    '5wkuw5x8': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // aboutus
  {
    'dd63iwgm': {
      'en': 'About us',
      'hi': 'हमारे बारे में',
      'mr': 'आमच्याबद्दल',
    },
    'dbf8606r': {
      'en':
          'Nari Suraksha Setu is dedicated to empowering women with safety solutions through technology and community partnerships. We provide real-time emergency assistance, community support networks, and educational resources on self-defense and awareness. Collaborating with law enforcement, organizations, and advocacy groups, we strive to create a comprehensive safety ecosystem.Our mission is to build a world where every woman feels safe, respected, and empowered. \n\nJoin us in bridging the gap to a safer tomorrow with Nari Suraksha Setu !!!',
      'hi':
          'नारी सुरक्षा सेतु प्रौद्योगिकी और सामुदायिक भागीदारी के माध्यम से सुरक्षा समाधानों के साथ महिलाओं को सशक्त बनाने के लिए समर्पित है। हम वास्तविक समय की आपातकालीन सहायता, सामुदायिक सहायता नेटवर्क और आत्मरक्षा और जागरूकता पर शैक्षिक संसाधन प्रदान करते हैं। कानून प्रवर्तन, संगठनों और वकालत समूहों के साथ सहयोग करते हुए, हम एक व्यापक सुरक्षा पारिस्थितिकी तंत्र बनाने का प्रयास करते हैं। हमारा मिशन एक ऐसी दुनिया का निर्माण करना है जहाँ हर महिला सुरक्षित, सम्मानित और सशक्त महसूस करे।\n\nनारी सुरक्षा सेतु के साथ एक सुरक्षित कल के लिए अंतर को पाटने में हमारे साथ जुड़ें !!!',
      'mr':
          'नारी सुरक्षा सेतू हे तंत्रज्ञान आणि सामुदायिक भागीदारीद्वारे महिलांना सुरक्षा उपायांसह सक्षम करण्यासाठी समर्पित आहे. आम्ही रीअल-टाइम आणीबाणी सहाय्य, समुदाय समर्थन नेटवर्क आणि स्व-संरक्षण आणि जागरूकता यावर शैक्षणिक संसाधने प्रदान करतो. कायद्याची अंमलबजावणी, संस्था आणि वकिलांच्या गटांसोबत सहकार्य करून, आम्ही सर्वसमावेशक सुरक्षा इकोसिस्टम तयार करण्याचा प्रयत्न करतो. आमचे ध्येय असे जग निर्माण करणे आहे जिथे प्रत्येक स्त्रीला सुरक्षित, सन्माननीय आणि सशक्त वाटेल.\n\nनारी सुरक्षा सेतू सह उद्याची दरी अधिक सुरक्षित करण्यासाठी आमच्यात सामील व्हा !!!',
    },
    '75hp7rge': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // contactus
  {
    '412yqg86': {
      'en':
          '   If you have any support related queries, \n   or need any help\n   you  can drop an email at \n   narisurakhshasetu@gmail.com\n\n',
      'hi':
          'यदि आपके पास सहायता से संबंधित कोई प्रश्न हैं, तो कृपया हमसे 8208657950 पर संपर्क करें या आप narisurakhshasetu@gmail.com पर ईमेल कर सकते हैं।',
      'mr':
          'तुमच्याकडे काही समर्थन संबंधित शंका असल्यास, कृपया आमच्याशी 8208657950 वर संपर्क साधा किंवा तुम्ही narisurakhshasetu@gmail.com वर ईमेल पाठवू शकता.',
    },
    'i3v1nl0b': {
      'en': 'Support',
      'hi': 'सहायता',
      'mr': 'सपोर्ट',
    },
    'yo0lgy8t': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // emergencycontacts
  {
    'vysijdkk': {
      'en': 'Add up to 3 emergency contacts for calling and messaging.',
      'hi': 'कॉल करने और संदेश भेजने के लिए अधिकतम 3 आपातकालीन संपर्क जोड़ें।',
      'mr': 'कॉलिंग आणि मेसेजिंगसाठी 3 पर्यंत आपत्कालीन संपर्क जोडा.',
    },
    'bh80rwjj': {
      'en': 'Emergency Contact 1',
      'hi': 'आपातकालीन संपर्क 1',
      'mr': 'आपत्कालीन संपर्क 1',
    },
    '48c7bx93': {
      'en': 'Name',
      'hi': 'नाम',
      'mr': 'नाव',
    },
    'kv8c8jmv': {
      'en': 'Mobile Number',
      'hi': 'मोबाइल नंबर',
      'mr': 'मोबाईल नंबर',
    },
    'w1now3fn': {
      'en': 'Add contact',
      'hi': 'संपर्क जोड़ें',
      'mr': 'संपर्क जोडा',
    },
    'nqbwgleg': {
      'en': 'Emergency Contact 2',
      'hi': 'आपातकालीन संपर्क 2',
      'mr': 'आपत्कालीन संपर्क २',
    },
    '5ea9yw2x': {
      'en': 'Name',
      'hi': 'नाम',
      'mr': 'नाव',
    },
    'wps0d40z': {
      'en': 'Mobile Number',
      'hi': 'मोबाइल नंबर',
      'mr': 'मोबाईल नंबर',
    },
    'fexwr9er': {
      'en': 'Add contact',
      'hi': 'संपर्क जोड़ें',
      'mr': 'संपर्क जोडा',
    },
    '869emfyl': {
      'en': 'Emergency Contact 3',
      'hi': 'आपातकालीन संपर्क 3',
      'mr': 'आपत्कालीन संपर्क 3',
    },
    'li40805m': {
      'en': 'Name',
      'hi': 'नाम',
      'mr': 'नाव',
    },
    '4licv6pz': {
      'en': 'Mobile Number',
      'hi': 'मोबाइल नंबर',
      'mr': 'मोबाईल नंबर',
    },
    '7nah6tjb': {
      'en': 'Add contact',
      'hi': 'संपर्क जोड़ें',
      'mr': 'संपर्क जोडा',
    },
    'sp99kf14': {
      'en': 'Emergency Contacts',
      'hi': 'आपातकालीन संपर्क',
      'mr': 'आणीबाणी संपर्क',
    },
    'ilx34lkc': {
      'en': 'Emergencycontacts',
      'hi': '',
      'mr': '',
    },
  },
  // forgetpass
  {
    'h0ykgd4i': {
      'en': 'Back',
      'hi': 'पीछे',
      'mr': 'मागे',
    },
    '0jlfraih': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'hi':
          'हम आपको अपना पासवर्ड रीसेट करने के लिए एक लिंक के साथ एक ईमेल भेजेंगे, कृपया नीचे अपने खाते से संबद्ध ईमेल दर्ज करें।',
      'mr':
          'तुमचा पासवर्ड रीसेट करण्यासाठी आम्ही तुम्हाला लिंकसह ईमेल पाठवू, कृपया खाली तुमच्या खात्याशी संबंधित ईमेल एंटर करा.',
    },
    '8k11ew2d': {
      'en': 'Email',
      'hi': 'ईमेल',
      'mr': 'ईमेल',
    },
    'uvj8njp6': {
      'en': 'Send Link',
      'hi': 'लिंक भेजें',
      'mr': 'लिंक पाठवा',
    },
    'm6qddr5f': {
      'en': 'Forgot Password',
      'hi': 'पासवर्ड भूल गए',
      'mr': 'पासवर्ड विसरलात',
    },
    'u4hllvqw': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // mapnavigation
  {
    'olbcbbb4': {
      'en': 'Send Your Current Location',
      'hi': 'अपना वर्तमान स्थान भेजें',
      'mr': 'तुमचे वर्तमान स्थान पाठवा',
    },
    'vu27jzb6': {
      'en': 'Map',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // Awarness
  {
    'zk3fzs1d': {
      'en': 'Awareness Document',
      'hi': 'जागरूकता दस्तावेज़',
      'mr': 'जागरूकता दस्तऐवज',
    },
    '72itnkun': {
      'en': 'Women Helpline Scheme',
      'hi': 'महिला हेल्पलाइन योजना',
      'mr': 'महिला हेल्पलाइन योजना',
    },
    'xw7dpnyh': {
      'en': 'Mahila shakti kendra',
      'hi': 'महिला शक्ति केंद्र',
      'mr': 'महिला शक्ती केंद्र',
    },
    'yn3hvapw': {
      'en': 'Nirbhaya Scheme',
      'hi': 'निर्भया योजना',
      'mr': 'निर्भया योजना',
    },
    'yf6ptq14': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // emergencycontactlist
  {
    'aq1u3u5n': {
      'en': 'Message',
      'hi': 'संदेश',
      'mr': 'संदेश',
    },
    '55bm74f8': {
      'en': 'call',
      'hi': 'पुकारना',
      'mr': 'कॉल',
    },
    '4gajcnkn': {
      'en': 'Emergency Contact List',
      'hi': 'आपातकालीन संपर्क सूची',
      'mr': 'आपत्कालीन संपर्क यादी',
    },
    '0ijckjcd': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // profile
  {
    '84ahczjh': {
      'en': 'Name',
      'hi': 'नाम',
      'mr': 'नाव',
    },
    '8odao5b3': {
      'en': 'Mobile ',
      'hi': 'गतिमान',
      'mr': 'मोबाईल',
    },
    'j4z9kxcd': {
      'en': 'Age',
      'hi': 'आयु',
      'mr': 'वय',
    },
    '5wpykq2u': {
      'en': 'Address',
      'hi': 'पता',
      'mr': 'पत्ता',
    },
    'ikm8yfia': {
      'en': 'Edit Profile',
      'hi': '',
      'mr': '',
    },
    'ig2qhmm1': {
      'en': 'Language',
      'hi': '',
      'mr': '',
    },
    'd4svi56p': {
      'en': 'Support',
      'hi': '',
      'mr': '',
    },
    '8v6ff1x0': {
      'en': 'Terms of Privacy',
      'hi': '',
      'mr': '',
    },
    'abyx577h': {
      'en': 'Profile',
      'hi': 'प्रोफ़ाइल',
      'mr': 'प्रोफाइल',
    },
    'c5ou0g2z': {
      'en': 'Profile',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // geminichatbot
  {
    'e09a82s8': {
      'en': 'Ask me anything.....',
      'hi': '',
      'mr': '',
    },
    'yac44dk6': {
      'en': 'Ask',
      'hi': '',
      'mr': '',
    },
    '3vmuxj4s': {
      'en': 'Gemini Chatbot',
      'hi': '',
      'mr': '',
    },
    'lipotftk': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // signin1
  {
    'j8l40649': {
      'en': 'Welcome to Nari Suraksha Setu App',
      'hi': '',
      'mr': '',
    },
    'l8lrrqvp': {
      'en':
          'Ready to take control of your safety?\n    Let’s get started! Simply follow\n    the prompts to set up your\n     account and customize your \n              safety  preferences.',
      'hi': '',
      'mr': '',
    },
    'l8peqkw4': {
      'en': 'continue',
      'hi': '',
      'mr': '',
    },
    '0ijckjcd': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // signin2
  {
    '4dbhe7iz': {
      'en': 'Travel anywhere without fear',
      'hi': '',
      'mr': '',
    },
    'fcenlgob': {
      'en':
          'Track location of your loved ones to\n            know where they are !!',
      'hi': '',
      'mr': '',
    },
    '1qq9iqfa': {
      'en': 'Continue',
      'hi': '',
      'mr': '',
    },
    'o1n0lwi7': {
      'en': 'Home',
      'hi': '',
      'mr': '',
    },
  },
  // signin3
  {
    '8fc092mu': {
      'en': 'Harness the power of AI chatbot',
      'hi': '',
      'mr': '',
    },
    'x49frnxt': {
      'en':
          'Let’s get started! Simply initiate a conversation with your AI chatbot and get quick access to information!!',
      'hi': '',
      'mr': '',
    },
    'qkvu9i65': {
      'en': 'Continue',
      'hi': '',
      'mr': '',
    },
    '9a4domvx': {
      'en': 'Home',
      'hi': '',
      'mr': '',
    },
  },
  // termsandconditions
  {
    'tm1ka98g': {
      'en': 'Home',
      'hi': '',
      'mr': '',
    },
  },
  // Miscellaneous
  {
    'tqr8z1l1': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'ssn3xlhf': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '0xtik7n3': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '43g8odj8': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '7kphsxt2': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '4o25j11u': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'qb6njlxq': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '19woo6ef': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'eg83ow3k': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'htradm48': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'jyntvu1l': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'iv3zjeto': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'ad0a8a7j': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'tr4pczgu': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'vh0v7tak': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'e3a8tyv0': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'jn54veka': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'npncf1eb': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'glry0xrk': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'fqwirqec': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '8zhest40': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'louj5yzf': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'byhwtfob': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'i88pytzl': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'b9zemuhz': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'iy0eoy45': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'eszmp1sy': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'a2jho40h': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'nit2bnq2': {
      'en': '',
      'hi': '',
      'mr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
