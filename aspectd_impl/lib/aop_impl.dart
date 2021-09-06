import 'package:aspectd/aspectd.dart';

@Aspect()
@pragma("vm:entry-point")
class ExecuteDemo {
  @pragma("vm:entry-point")
  ExecuteDemo();

  @Execute("package:example/main.dart", "_MyHomePageState", "-_incrementCounter")
  @pragma("vm:entry-point")
  void _incrementCounter(PointCut pointcut) {
    pointcut.proceed();
    print('KWLM called!');
  }


  @Inject("package:example/main.dart","","+injectDemo", lineNum:30)
  @pragma("vm:entry-point")
  static void onInjectDemoHook1() {
    print('Aspectd:KWLM51');
  }

  @Inject("package:example/main.dart","C","+C", lineNum:198)
  @pragma("vm:entry-point")
  static void onInjectDemoHook3() {
    print('Aspectd:KWLM52');
  }
}