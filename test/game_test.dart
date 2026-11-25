import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_bes_saniye/oyun_bes_saniye.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(besSaniyeConfig.title.length, 33);
    expect(besSaniyeConfig.tagline.length, 33);
    for (final s in besSaniyeConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(besSaniyeConfig.gameId, besSaniyeId);
    expect(besSaniyeRules.gameId, besSaniyeId);
  });

  test('desteler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(besSaniyeRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: besSaniyeId, optionalMechanics: besSaniyeRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(besSaniyeRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
