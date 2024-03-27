import 'package:cron_expression_descriptor/src/parser_utils.dart';

class CronExpressionDescriptor {
  final ParserUtils _parserUtils = ParserUtils();

  /// Generates a human-readable description from a cron expression.
  ///
  /// The cron expression should be in the format of a simple cron expression,
  /// which consists of 5 parts separated by spaces. Each part represents a
  /// different aspect of the schedule, such as the minute, hour, day of month,
  /// month, and day of week.
  ///
  /// Throws an [Exception] if the cron expression does not have 5 parts.
  ///
  /// Returns a string that describes the cron expression in a human-readable
  /// format.
  String convertCronToHumanReadable({required String cronExpression}) {
    // Initialize an empty string to store the generated description.
    String description = '';

    // Split the cron expression into its parts.
    final List<String> cronParts = cronExpression.split(' ');

    // Check if the cron expression has 5 parts.
    if (cronParts.length != 5) {
      // If not, throw an exception.
      throw Exception('Simple cron expression must have 5 parts');
    }

    // Generate the description by calling helper methods for each part.
    description +=
        _parserUtils.getTimeOfDayDescription(cronParts[0], cronParts[1]);
    description += _parserUtils.getDayOfMonthDescription(cronParts[2]);
    description += _parserUtils.getDayOfWeekDescription(cronParts[4]);
    description += _parserUtils.getMonthDescription(cronParts[3]);

    // Return the generated description.
    return description;
  }
}
