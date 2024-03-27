# Cron Expression Descriptor
This is a simple Dart library for describe cron expressions. currently it's support simple 5 segment cron expression.

      ┌───────────── minute (0 - 59)
      │ ┌───────────── hour (0 - 23)
      │ │ ┌───────────── day of month (1 - 31)
      │ │ │ ┌───────────── month (1 - 12)
      │ │ │ │ ┌───────────── day of week (0 - 6)
      │ │ │ │ │
      │ │ │ │ │
      │ │ │ │ │
      * * * * *  cron expression

## Getting started

Add dependencies into you project pubspec.yaml file:

```yaml
dependencies:
  cron_expression_descriptor: ^0.9.0
```

## Usage

A simple usage example:

```dart
import 'package:cron_expression_descriptor/cron_expression_descriptor.dart';
main() {
  final CronExpressionDescriptor cronExpressionDescriptor = CronExpressionDescriptor();

  print(
    cronExpressionDescriptor.convertCronToHumanReadable(cronExpression: '15 14 1 * *'),
  );
  // output: At 14:15, on day 1 of the month
}
```

## Output examples
Some other examples of Descriptor is like:

```
* * * * *          -> "Every minute"

* * */10 */9 */4   -> "Every minute, every 10 days, every 4 days of the week, every 9 months"

0 22 * * 1-5       -> "At 22:00, Monday through Friday"

15 1,12 1 */2 *    -> "At minute 15 of 1 and 12, on day 1 of the month, every 2 months"
```