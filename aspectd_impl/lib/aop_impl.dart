import 'package:aspectd/aspectd.dart';
// @Aspect()
// @pragma("vm:entry-point")
// class RegularCallDemo {
//   @pragma("vm:entry-point")
//   RegularCallDemo();
//
//   @Call("package:example/main.dart", "", "+appInit")
//   @pragma("vm:entry-point")
//   static dynamic appInit(PointCut pointcut) {
//     print('[KWLM1]: Before appInit!');
//     dynamic object = pointcut.proceed();
//     print('[KWLM1]: After appInit!');
//     return object;
//   }
//
//   @Call("package:example/main.dart", "MyApp", "+MyApp")
//   @pragma("vm:entry-point")
//   static dynamic myAppDefine(PointCut pointcut) {
//     print('[KWLM2]: MyApp default constructor!');
//     return pointcut.proceed();
//   }
//
//   @Call("package:example/main.dart", "MyHomePage", "+MyHomePage")
//   @pragma("vm:entry-point")
//   static dynamic myHomePage(PointCut pointcut) {
//     dynamic obj = pointcut.proceed();
//     print('[KWLM3]: MyHomePage named constructor!');
//     return obj;
//   }
// }

// @Aspect()
// @pragma("vm:entry-point")
// class RegexCallDemo {
//   @pragma("vm:entry-point")
//   RegexCallDemo();
//
//  @Call("package:example\\/.+\\.dart", ".*", "-.+", isRegex: true)
//  @pragma("vm:entry-point")
//  dynamic instanceUniversalHook(PointCut pointcut) {
//    print('[KWLM11]Before:${pointcut.target}-${pointcut.function}-${pointcut.namedParams}-${pointcut.positionalParams}');
//    dynamic obj = pointcut.proceed();
//    return obj;
//  }
//
//  @Call('package:example\\/.+\\.dart', '.*A', '-fa', isRegex: true)
//  @pragma("vm:entry-point")
//  dynamic instanceUniversalHookCustomMixin(PointCut pointcut) {
//    print('[KWLM12]Before:${pointcut.target}-${pointcut.function}-${pointcut.namedParams}-${pointcut.positionalParams}');
//    dynamic obj = pointcut.proceed();
//    return obj;
//  }
// }
//
// @Aspect()
// @pragma("vm:entry-point")
// class RegularExecuteDemo {
//   @pragma("vm:entry-point")
//   RegularExecuteDemo();
//
//   @Execute("package:example/main.dart", "_MyHomePageState", "-_incrementCounter")
//   @pragma("vm:entry-point")
//   dynamic _incrementCounter(PointCut pointcut) {
//     dynamic obj = pointcut.proceed();
//     print('[KWLM21]:${pointcut.sourceInfos}:${pointcut.target}:${pointcut.function}!');
//     return obj;
//   }
//
//   @Execute("dart:math", "Random", "-next.*", isRegex: true)
//   @pragma("vm:entry-point")
//   static dynamic randomNext(PointCut pointcut) {
//     print('[KWLM22]:randomNext!');
//     return 10;
//   }
// }
//
// @Aspect()
// @pragma('vm:entry-point')
// class RegexExecuteDemo {
//   @pragma('vm:entry-point')
//   RegexExecuteDemo();
//
//  @Execute('package:example\\/.+\\.dart', '.*A', '-fa', isRegex: true)
//  @pragma('vm:entry-point')
//  dynamic instanceUniversalHookCustomMixin(PointCut pointcut) {
//    print(
//        '[KWLM31]Before:${pointcut.target}-${pointcut.function}-${pointcut.namedParams}-${pointcut.positionalParams}');
//    final dynamic obj = pointcut.proceed();
//    return obj;
//  }
// }
//
// @Aspect()
// @pragma('vm:entry-point')
// class RegexExecuteDemo {
//   @pragma('vm:entry-point')
//   RegexExecuteDemo();
//
//   @Execute("package:flutter/src/gestures/recognizer.dart","GestureRecognizer","-invokeCallback")
//   @pragma("vm:entry-point")
//   dynamic hookInvokeCallback(PointCut pointCut){
//     print('Aspectd41');
//   }
// }
@Aspect() // Aspect注解可以使得像asepctd源码example中aop_impl.dart这样的AOP实现类被方便的识别和提取，也可以起到方便开关的作用，如果想禁用掉这段AOP逻辑，移除@Aspect注解即可
@pragma("vm:entry-point") // 在AOT变一下，如果不能被应用主入口(main)最终可能调用到，那么将被视为无用代码而被丢弃掉。AOP代码因为其注入逻辑的无侵入性，所以不会被main调用，因为使用此注解告诉编译器不要丢弃这段逻辑。
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

 @Execute("package:example\\/.+\\.dart", ".*", "-.+", isRegex: true)
 @pragma("vm:entry-point")
 dynamic instanceUniversalHook(PointCut pointcut) {
   print('[KWLM11]Before:${pointcut.target}-${pointcut.function}-${pointcut.namedParams}-${pointcut.positionalParams}');
   dynamic obj = pointcut.proceed();
   return obj;
 }

  @Call("package:flutter_codex_demo/test.dart", "A", "+A")
  @pragma("vm:entry-point")
  void _incrementA(PointCut pointcut) {
    pointcut.proceed();
// todo report class A initialize
  }
}