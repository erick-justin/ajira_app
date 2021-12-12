


class TimeFunction{

      String getTimeElapsed(String registered){
            int registeredTime = 0;
            int currentTime =DateTime.now().millisecondsSinceEpoch;
            int SECOND_MILLIS = 1000;
            int MINUTE_MILLIS = 60 * SECOND_MILLIS;
            int HOUR_MILLIS = 60 * MINUTE_MILLIS;
            final int DAY_MILLIS = 24 * HOUR_MILLIS;

            var parsedDate = DateTime.parse(registered);
            registeredTime = parsedDate.millisecondsSinceEpoch;

            int timeDifference = currentTime-registeredTime;

            if (timeDifference < MINUTE_MILLIS) {
              return "just now";
            } else if (timeDifference < 2 * MINUTE_MILLIS) {
              return "a min";
            } else if (timeDifference < 50 * MINUTE_MILLIS) {
              return "${(timeDifference / MINUTE_MILLIS).toStringAsFixed(0)} mins";
            } else if (timeDifference < 90 * MINUTE_MILLIS) {
              return "an hour";
            } else if (timeDifference < 24 * HOUR_MILLIS) {
              return "${(timeDifference / HOUR_MILLIS).toStringAsFixed(0)} hours";
            } else if (timeDifference < 48 * HOUR_MILLIS) {
              return "yesterday";
            } else {
              return "${(timeDifference / DAY_MILLIS).toStringAsFixed(0) } days";
            }





      }


      String getTimeLastSeen(String registered){
        int registeredTime = 0;
        int currentTime =DateTime.now().millisecondsSinceEpoch;
        int SECOND_MILLIS = 1000;
        int MINUTE_MILLIS = 60 * SECOND_MILLIS;
        int HOUR_MILLIS = 60 * MINUTE_MILLIS;
        final int DAY_MILLIS = 24 * HOUR_MILLIS;
        if(registered == "" || registered.isEmpty){
           return "";
        }
        var parsedDate = DateTime.parse(registered);
        registeredTime = parsedDate.millisecondsSinceEpoch;

        int timeDifference = currentTime-registeredTime;

        if (timeDifference < MINUTE_MILLIS) {
          return "online";
        } else if (timeDifference < 2 * MINUTE_MILLIS) {
          return "1 min";
        } else if (timeDifference < 50 * MINUTE_MILLIS) {
          return "${(timeDifference / MINUTE_MILLIS).toStringAsFixed(0)} mins";
        } else if (timeDifference < 90 * MINUTE_MILLIS) {
          return "an hour";
        } else if (timeDifference < 24 * HOUR_MILLIS) {
          return "${(timeDifference / HOUR_MILLIS).toStringAsFixed(0)} hours";
        } else if (timeDifference < 48 * HOUR_MILLIS) {
          return "yesterday";
        } else {
          return "${(timeDifference / DAY_MILLIS).toStringAsFixed(0) } days";
        }





      }


}