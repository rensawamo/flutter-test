import 'package:animation_example/animation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Animation screen test', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AnimationScreen(),
      ),
    );

    var containerFinder = find.byType(Container); // container widgetを探す
    expect(containerFinder, findsOneWidget); //　一つしかないことを確認
    var container = tester.widget<Container>(containerFinder);

    // 最初の幅と色が以下であるか確認
    expect(container.constraints!.minWidth, 50);
    expect(container.constraints!.minHeight, 50);
    expect((container.decoration as BoxDecoration).color, Colors.blue);
    expect(
      (container.decoration as BoxDecoration).borderRadius,
      BorderRadius.zero,
    );

    // 呼び出して、アニメーションが完了するまで待
    await tester.pumpAndSettle();

    // 変化後の widgetの条件
    containerFinder = find.byType(Container);
    container = tester.widget<Container>(containerFinder);
    expect(container.constraints!.minWidth, 200);
    expect(container.constraints!.minHeight, 200);
    expect((container.decoration as BoxDecoration).color, Colors.green);
    expect(
      (container.decoration as BoxDecoration).borderRadius,
      BorderRadius.circular(50),
    );
  });
}
