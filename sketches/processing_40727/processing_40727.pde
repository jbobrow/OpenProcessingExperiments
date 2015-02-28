
int numCircles;

void setup() 
{
  size (800, 400);
  smooth();
  noStroke();
  background(180);

  numCircles = 0;
}

void draw()
{
  
  //seconds
  for (int x = 0; x < 60; x++) {
    fill(255, 110);
    ellipse(x * 13 + 15, 75, 10, 10);
    //white circles
  }
  numCircles = second();
  fill(random(255), random(255), 0, 200);
  ellipse(numCircles * 13 + 15, 75, 10, 10);
  //draws a circle every second with a random fill at the second value * 13 + 15


  //minutes
  for (int x = 0; x < 30; x++) {
    for (int y = 0; y < 2; y++) {
      //30 across and two down
      fill(110, 110);
      ellipse(x * 26 + 21, 165 + y * 25, 12, 12);
      //gray circles
    }
  }
  //first row
  numCircles = minute();
  if (numCircles <= 29) {
    fill(random(255), 0, random(255), 100);
    ellipse(numCircles * 26 + 21, 165, 12, 12);
    //when the second is less than or equal to 29 in the minute value, draw a circle at minute value
    //* 26 + 21
  }
  //second row
  if (numCircles >=30) {
    fill(random(255), 0, random(255), 100);
    ellipse((numCircles - 30) * 26 + 21, 190, 12, 12);
    //when the second is greater than or equal to 30 in the minute value, draw a circle at the minute
    //value * 26 - 29 * 26 - 5
  }

  //hours
  for (int x = 0; x < 8; x++) {
    for (int y = 0; y < 3; y++) {
      //eight across and three down
      fill(40);
      ellipse(x * 50 + 225, 280 + y * 40, 30, 30);
      //dark gray circles
    }
  }
  //first row
  numCircles = hour();
  if (numCircles <= 7) {
    fill(0, random(255), random(255), 100);
    ellipse(numCircles * 50 + 225, 280, 30, 30);
    //if the value is less than or equal to 7 a circle will be draw
    //at the value of the hour * 50 + 225
  }
  //second row
  if (numCircles <= 15) {
    fill(0, random(255), random(255), 100);
    ellipse((numCircles - 8) * 50 + 225, 320, 30, 30);
    //if the value is less than or equal to 15 a circle will be draw
    //40 pixels lower than the first line at the same x values
  }
  //third row
  if (numCircles <= 23) {
    fill(0, random(255), random(255), 100);
    ellipse((numCircles - 16) * 50 + 225, 360, 30, 30);
    //if the value is less than or equal to 23 a circle will be draw 80
    //pixels lower than the first line at the same x values
  }
}


