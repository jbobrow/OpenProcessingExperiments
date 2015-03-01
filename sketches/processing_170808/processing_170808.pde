

void setup() {
  size(300, 300);
  rectMode(CORNERS);
}

void draw() {
  background(0);
  time(10, 30); //call in x & y coords
  date(10, 50); //call in x & y coords
  timeBars();
  
}

import java.util.Calendar;

void date(int dateX, int dateY) {

  //set the variables for the date
  int d = day();
  String mo=str(month());
  int mo2=month();
  String y=str(year()); 

  // Array for finding the day of the week
  String[] weekDay = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
  String[] month = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
  
  // create calander to find day of week
  Calendar c;
  int dayOfWeek;
  c = Calendar.getInstance();
  dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
  
  String day = str(d);
  if (d == 1) {
    day = day + "st";
  }
  
  if (d == 2) {
    day = day + "nd";
  }
  
  if (d == 3) {
    day = day + "rd";
  } 
  
  if (d > 3) {
    day = day + "th";
  } 

  // creates string combining date
  String dateValue = weekDay[dayOfWeek-1] + " " + day + " " + month[mo2-1] + " " + y;

  //display the date
  text(dateValue, dateX, dateY);
}

void time(int timeX, int timeY) {
  //set the variables up for the time
  float h=hour();
  float m=minute();
  float s=second();

  //adds a 0 to the beginning of single value digits
  String h2 = str(int(h));
  if (h2.length() == 1) {
    h2 = "0" + h2;
  }

  String m2 = str(int(m));
  if (m2.length() == 1) {
    m2 = "0" + m2;
  }

  String s2 = str(int(s));
  if (s2.length() == 1) {
    s2 = "0" + s2;
  }

  //create a string combining time values
  String timeValue = h2 + ":" + m2 + ":" + s2;

  //display the time
  text(timeValue, timeX, timeY);
}

void timeBars() {
  //Get time values
  int h=hour();
  int m=minute();
  int s=second(); 
  
  //convert time values for use as coordinates, amplified by 2 to make bigger
  int hourY = (4*h) %96;
  int minuteY = (4*m) %240;
  int secondY = (4*s) %240;
  
  //rect first 2 is one corner, second 2 is opposite corner
  //draws rectangles for each time value
  text("hours", 10,height-hourY);
  rect(10,height-hourY,110,height);
  
  text("minutes", 120,height-minuteY);
  rect(120,height-minuteY,195,height);
  
  text("seconds", 205,height-secondY);
  rect(205,height-secondY,255,height);
  
}


