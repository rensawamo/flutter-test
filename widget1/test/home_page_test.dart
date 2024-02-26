import 'package:counter_app/counter.dart';
import 'package:counter_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

//widget(UI)テスト

// 0が画面上に存在する時に ➕ボタンをクリックすると 1 に変わるか
void main() {
  testWidgets(
    'given counter is 0 when increment button is clicked then counter should be 1',
    (tester) async {
      await tester.pumpWidget( // UI ロード
        const MaterialApp(
          home: MyHomePage(
            title: 'Counter App',
          ),
        ),
      );

      final ctr = find.text('0'); //textが0の widgetを探す
      expect(ctr, findsOneWidget); // それが画面に１つしかないことの確認

      final ctr2 = find.text('1');
      expect(ctr2, findsNothing); // ここでまだ1 をもつwidgetがないことを確認

      // floatingActionButton: FloatingActionButton(
      //     key: const Key('increment_counter'),　
      final incrementBtn = find.byKey(const Key('increment_counter')); // 上記のように increament_counterのキーをもつボタンを見つける
      await tester.tap(incrementBtn); // tap

      await tester.pump(); // 画面の更新を行う

      final ctr3 = find.text('1');
      expect(ctr3, findsOneWidget); // 画面の更新後に、 1をもつwidgetが発見

      final ctr4 = find.text('0');
      expect(ctr4, findsNothing); // また　0が消えて１になっていることの確認

      expect(find.byType(AppBar), findsOneWidget);// appverの存在の確認
    },
  );
}
