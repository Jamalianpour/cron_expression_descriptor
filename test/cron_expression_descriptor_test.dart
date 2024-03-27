import 'package:test/test.dart';
import 'package:cron_expression_descriptor/cron_expression_descriptor.dart';

void main() {
  final CronExpressionDescriptor cronExpressionDescriptor =
      CronExpressionDescriptor();

  test(
      'convertCronToHumanReadable should return correct description for cron expression * * * * *',
      () {
    final cronExpression = '* * * * *';
    final description = cronExpressionDescriptor.convertCronToHumanReadable(
        cronExpression: cronExpression);
    expect(description, equals('Every minute'));
  });

  test(
      'convertCronToHumanReadable should return correct description for cron expression 15 14 1 * *',
      () {
    final cronExpression = '15 14 1 * *';
    final description = cronExpressionDescriptor.convertCronToHumanReadable(
        cronExpression: cronExpression);
    expect(description, equals('At 14:15, on day 1 of the month'));
  });

  test(
      'convertCronToHumanReadable should return correct description for cron expression * * */10 */9 */4',
      () {
    final cronExpression = '* * */10 */9 */4';
    final description = cronExpressionDescriptor.convertCronToHumanReadable(
        cronExpression: cronExpression);
    expect(
        description,
        equals(
            'Every minute, every 10 days, every 4 days of the week, every 9 months'));
  });

  test(
      'convertCronToHumanReadable should return correct description for cron expression 0 22 * * 1-5',
      () {
    final cronExpression = '0 22 * * 1-5';
    final description = cronExpressionDescriptor.convertCronToHumanReadable(
        cronExpression: cronExpression);
    expect(description, equals('At 22:00, Monday through Friday'));
  });

  test(
      'convertCronToHumanReadable should return correct description for cron expression 0 1,12 1 */2 *',
      () {
    final cronExpression = '0 1,12 1 */2 *';
    final description = cronExpressionDescriptor.convertCronToHumanReadable(
        cronExpression: cronExpression);
    expect(
        description,
        equals(
            'At minute 0 of 1 and 12, on day 1 of the month, every 2 months'));
  });
  test(
      'convertCronToHumanReadable should throw exception for cron expression with incorrect number of parts',
      () {
    final cronExpression = '0 12 * *';
    expect(
        () => cronExpressionDescriptor.convertCronToHumanReadable(
            cronExpression: cronExpression),
        throwsException);
  });
}
