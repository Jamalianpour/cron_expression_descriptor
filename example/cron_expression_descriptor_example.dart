import 'package:cron_expression_descriptor/cron_expression_descriptor.dart';

void main() {
  final CronExpressionDescriptor cronExpressionDescriptor =
      CronExpressionDescriptor();

  print(
    '* * * * * : ${cronExpressionDescriptor.convertCronToHumanReadable(cronExpression: '* * * * *')}',
  );

  print('\n-----------------------------------------------\n');

  print(
    '15 14 1 * * : ${cronExpressionDescriptor.convertCronToHumanReadable(cronExpression: '15 14 1 * *')}',
  );

  print('\n-----------------------------------------------\n');

  print(
    '* * */10 */9 */4 : ${cronExpressionDescriptor.convertCronToHumanReadable(cronExpression: '* * */10 */9 */4')}',
  );

  print('\n-----------------------------------------------\n');

  print(
    '0 22 * * 1-5 : ${cronExpressionDescriptor.convertCronToHumanReadable(cronExpression: '0 22 * * 1-5')}',
  );

  print('\n-----------------------------------------------\n');

  print(
    '0 1,12 1 */2 * : ${cronExpressionDescriptor.convertCronToHumanReadable(cronExpression: '0 1,12 1 */2 *')}',
  );

  print('\n-----------------------------------------------\n');
}
