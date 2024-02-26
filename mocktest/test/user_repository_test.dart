import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:users_http_example/user_model.dart';
import 'package:users_http_example/user_repository.dart';

//  実際の httpリクエストを使わずにテスト可能
class MockHTTPClient extends Mock implements Client {}

void main() {
  late UserRepository userRepository;
  late MockHTTPClient mockHTTPClient;

  setUp(() {
    mockHTTPClient = MockHTTPClient();
    // mockをつかってダミーデータでテストを行うステップ
    // 1.  clientを継承
    // 2.  ripositoryにmockを代入
    // 3. setしてdammyを入れる
    userRepository = UserRepository(mockHTTPClient);
  });

  // 同時にテストができる
  group('UserRepository ', () {
    group('getUser function', () {
      // response200がかえる　and usermodelがかえる
      test(
        'given UserRepository class when getUser function is called and status code is 200 then a usermodel should be returned',
        () async {
          // Arrange
          when(
            () => mockHTTPClient.get(
              Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
            ),
          ).thenAnswer((invocation) async {
            return Response('''
            {
              "id": 1,
              "name": "ren",
              "username": "re",
              "email": "ren@mail.adress",
              "website": "re"
            }
            ''', 200);
          });
          // given
          final user = await userRepository.getUser();
          // tipe match テスト
          expect(user, isA<User>());
        },
      );

      // エラーコードが帰った時にthrowを投げられるか
      test(
        'given UserRepository class when getUser function is called and status code is not 200 then an exception should be thrown',
        () async {
          // arrange
          when(
            () => mockHTTPClient.get(
              Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
            ),
          ).thenAnswer((invocation) async => Response('{}', 500));
          // act
          final user = userRepository.getUser();
          // assert
          expect(user, throwsException);
        },
      );
    });
  });
}
