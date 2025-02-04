import 'package:todo_app_learning/src/features/features.dart';
import '../../../../cores/helper/helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _horizontalAnimation;
  late Animation<double> _verticalAnimation;
  late Animation<double> _textAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _sizeAnimation;
  bool onboardingWatchedStatus = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500), // Adjust duration as needed
    );

    _horizontalAnimation = Tween<double>(
      begin: 0.0, // Start from left (off-screen)
      end: 0.0, // End at the center (on-screen)
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceInOut,
    ));

    _verticalAnimation = Tween<double>(
      begin: 1.0, // Start from bottom (off-screen)
      end: 0.0, // End at the center (on-screen)
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack,
    ));

    _textAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.6, // Delay the start of text animation after 60% of the total animation
        1.0, // Ends at the end of the total animation
        curve: Curves.easeInOut,
      ),
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _sizeAnimation = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 500), () {
          _animationController.forward();
        });
      }
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      backgroundColor: ThemeColors.whiteColor,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imgSplashBg), fit: BoxFit.fill)),
          ),
          Center(
            child: Stack(
              children: [
                Positioned.fill(
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.translate(
                            offset: Offset(
                                _horizontalAnimation.value * MySize.size0,
                                _verticalAnimation.value * MySize.safeHeight),
                            child: Opacity(
                              opacity: _opacityAnimation.value,
                              child: Container(
                                width: MySize.size200,
                                height: MySize.size200,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(imgLogo),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MySize.size30 * _sizeAnimation.value,
                          ),
                          Opacity(
                            opacity: _textAnimation.value,
                            child: Text(
                              "TODO APP",
                              style: TextStyle(
                                fontSize: MySize.size20,
                                color: const Color.fromRGBO(2, 77, 28, 1),
                                fontWeight: FontWeight.w900,
                                letterSpacing: MySize.size2,
                                fontFamily: GoogleFonts.nunitoSans().fontFamily,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: MySize.size5),
                          Opacity(
                            opacity: _textAnimation.value,
                            child: Text(
                              "Manage Everyday Tasks",
                              style: TextStyle(
                                fontSize: MySize.size17,
                                color: ThemeColors.lightButtonBg,
                                fontWeight: FontWeight.w600,
                                letterSpacing: MySize.size2,
                                fontFamily:
                                    GoogleFonts.calligraffitti().fontFamily,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
