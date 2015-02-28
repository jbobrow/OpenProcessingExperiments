
//August 31st 2013
//Highly-Accurate Horizontal Clock

//Beginning Properties
void setup()
{
  size(500, 180);
  background(143, 2, 2);
}

//Function that checks for conditions based on the month, and returns the daySize value
float daysizeCheck()
{
  //Defines time variables
  int y = year();
  int d = day();
  int mon = month();
  //Checks whether the year is a leap year or not
  int leapChecker = y % 4;
  //Defines daySize
  float daySize = 500*d/31;
  //Checks if the month has 31 days
  if (mon != 2 || mon != 4 || mon != 6 || mon != 9 || mon != 11)
  { 
    daySize = 500*d/31;
  }
  //Checks if the month is Febuary
  if (mon == 2)
  {
    daySize = 500*d/28;
  }
  //Checks if it's a leap year
  if (leapChecker == 0)
  {
    //Changes the number of days in Febuary to be 29
    if (mon == 2)
    {
      daySize = 500*d/29;
    }
  }
  //Checks if the month has 30 days
  if (mon == 1 || mon == 3 || mon == 5 || mon == 7 || mon ==  8 || mon == 10 || mon == 12)
  {
    daySize = 500*d/31;
  }
  //Returns the day size
  return daySize;
}
//Draws the clock
void draw() {
  
  //Text and Drawing Variables
  int textSize = 13;
  int widthValue = 20;
  
  //Clock Characteristics
  smooth();
  noStroke();
  
  //Time variables
  int y = year();
  int mon = month();
  int d = day();
  int h = hour();
  int m = minute();
  int s = second();
  

  //Rectangle Sizes
  int monthSize = 500*mon/12;
  float daySize = daysizeCheck();
  int secondSize = 500*s/60;
  int hourSize = 500*h/24;
  int minuteSize = 500*m/60;
  
  //Draws the month rectangle for the clock
  textSize(textSize);
  fill(2, 143, 2);
  rect(0, 30, monthSize, widthValue);

  //Resets the month bar value when it reaches its maximum value
  if ( monthSize == 0 )
  {
    fill(143, 2, 2);
    rect(0, 30, 500, widthValue);
  }
  else
  {
    fill(2, 143, 2);
    rect(0, 30, monthSize, widthValue);
  }

  //Makes the text white
  fill(255);  
  
  //Month Array
  String[] months = new String[12];
  months[0] = "January";
  months[1] = "Febuary";
  months[2] = "March";
  months[3] = "April";
  months[4] = "May";
  months[5] = "June";
  months[6] = "July";
  months[7] = "August";
  months[8] = "September";
  months[9] = "October";
  months[10] = "November";
  months[11] = "December";
  //Displays Month Text
  text(months[mon-1], 0, 40);
  fill(49, 79, 79);

  //Draws Day Rectangle for Clock
  rect(0, 60, daySize, widthValue);
  //Resets the day bar value when it reaches its maximum value
  if ( daySize == 0 )
  {
    fill(143, 2, 2);
    rect(0, 60, 500, widthValue);
  }
  else
  {
    fill(49, 79, 79);
    rect(0, 60, daySize, widthValue);
  }
  //Makes the text white
  fill(255);
  //Displays day text
  text(d, 0, 70);

  //Makes the rectangle blue
  fill(0, 0, 128);
  rect(0, 90, hourSize, widthValue);
  
  //Resets the hour bar value when it reaches its maximum value
  if (hourSize == 0)
  {
    fill(143, 2, 2);
    rect(0, 90, 500, widthValue);
  }
  else
  {
    fill(0, 0, 128);
    rect(0, 90, hourSize, widthValue);
  }
  //Makes the text white
  fill(255);
  //Displays the hour text
  text(h, 0, 100);

  //Makes the rectangle black
  fill(0);
  //Draws the minute rectangle
  rect(0, 120, minuteSize, widthValue);
  //Resets the minute bar value when it reaches its maximum value
  if (minuteSize == 0)
  {
    fill(143, 2, 2);
    rect(0, 120, 500, widthValue);
  }
  else
  {
    fill(0);
    rect(0, 120, minuteSize, widthValue);
  }
  //Makes the text white
  fill(255);
  //Displays the minute text
  text(m, 0, 130);
  
  //Draws the second rectangle
  rect(0, 150, secondSize, widthValue);
  //Resets the second bar when it reaches its maximum value
  if ( secondSize == 0 )
  {
    fill(143, 2, 2);
    rect(0, 150, 500, widthValue);
  }
  else
  {
    fill(218, 165, 32);
    rect(0, 150, secondSize, widthValue);
  }
  //Makes the text white
  fill(255);
  //Displays the second text
  text(s, 0, 160);
  
}



