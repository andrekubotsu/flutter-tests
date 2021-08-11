import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpflutter/home/home_controller.dart';
import 'package:fpflutter/home/home_repository.dart';
import 'package:fpflutter/home/home_state.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'home_controller_test.mocks.dart';

void main() {
  late HomeController controller;
  late HomeRepository repository;

  setUp(() {
    repository = MockHomeRepository();
    controller = HomeController(repository: repository);
  });

  group("HomeController tests", () {
    test("Get Names - Success", () async {
      final names = ["A"];
      when(repository.getNames())
          .thenAnswer((realInvocation) => Future.value(right(names)));
      final matcher = [HomeState.loading(), HomeState.success(names)];
      final actual = <HomeState>[];
      controller.stateNotifier.addListener(() {
        actual.add(controller.state);
      });
      await controller.getNames();
      expect(actual, matcher);
    });

    test("Get Names - Erro", () async {
      when(repository.getNames())
          .thenAnswer((realInvocation) => Future.value(left("Erro")));
      final matcher = [HomeState.loading(), HomeState.error("Erro")];
      final actual = <HomeState>[];
      controller.stateNotifier.addListener(() {
        actual.add(controller.state);
      });
      await controller.getNames();
      expect(actual, matcher);
    });
  });

  // late HomeRepository repository;
  // late HomeController controller;
  // setUp(() {
  //   ;
  // });

  // test('it should show HomeStateError on error', () async {
  //   when(controller.getNames())
  //       .thenAnswer((realInvocation) => Future.value(left("Deu não")));
  //   final response = controller.state;
  //   expect(response, "Deu ruim");
  // });

  // test('it should show HomeStateSuccess on success', () async {
  //   when(controller.getNames()).thenAnswer(
  //       (realInvocation) => Future.value(right(["Olha acho que deu hein"])));
  //   final response = controller.state;
  //   expect(response, "Deu bom");
  // });
}
