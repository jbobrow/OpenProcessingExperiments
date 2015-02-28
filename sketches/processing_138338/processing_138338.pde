
int seconds, minutes, hours, days, months, years;
int cx, cy;
float secondSize;
float secondsRadius;
float minutesRadius;
float hoursRadius;
int dayHeight;
int dayY;
int monthsY;
int monthHeight;
String yearN;
PFont font;




void setup() {
  size(720, 490);//static variables
  int radius = min(width, height) / 2;
  minutesRadius = radius * 0.75;
  secondsRadius = radius * 1.20;
  hoursRadius = radius * 0.45;
  cx = 0;
  cy = 0;
  dayHeight = height/31;//divides height of screen into 31 to represent day
  monthHeight = height/12;
  font = createFont("Serif", 48);
  textFont(font);
  
  
  smooth();
}

void draw() {

  background(223, 114, 166);
  // noStroke();
  //ellipse(width/2, height/2, circSize,circSize);
  seconds = second();
  minutes = minute();
  hours = hour();
  days = day();
  months = month();
  years = year();
 
 yearN = ""+years;
  


for(int b = 0; b < years; b++)
{
  noStroke();
  fill(222, 254, 1,50);
 ellipse(random(0,width),random(0,height),5,5); 
}



  for (int q = 0; q <31; q++) {//generates squares on left side of screen represening number of days
    stroke(222, 254, 1);
    if (q == days-1)
    {
      fill(217, 5, 245);
    }
    else
    {
      fill(65, 8, 160);
    }
    rectMode(CORNER);
    rect(dayHeight, q*dayHeight, dayHeight, dayHeight);
  }
  //  old way of getting day tile
  //  dayY= (days * dayHeight)-dayHeight; //calculates placement of tile meant to represent current day
  //  fill(217, 5, 245);
  //  rect(dayHeight, dayY, dayHeight, dayHeight);//places rect based on day


  for (int w = 0; w <12 ; w++) {//generates months squares

    stroke(222, 254, 1);
        if (w == months-1)
    {
      fill(217, 5, 245);
    }
    else
    {
      fill(65, 8, 160);
    }
    rectMode(CORNER);
    rect(monthHeight, w*monthHeight, monthHeight, monthHeight);
  }



  // float secondRot = map(seconds, 0, 59, 0 ,360);//maps seconds to radians 
  float secondSize = map(seconds, 0, 59, 0, secondsRadius);
  float hourRot = map (hours, 0, 23, 0, 720);
  float minuteRot = map(minutes, 0, 59, 0, 360);

  for (float i = seconds; i <60; i++) {//keeps track of seconds, generates circle growing in size per second
    noStroke();//circle 
    fill(65, 8, 160);
    ellipse(width/2, height/2, secondsRadius, secondsRadius);//main circle for seconds

      if (seconds == 0 ||seconds == 10 ||seconds == 20 || seconds == 30 || seconds == 40 || seconds == 50 || seconds == 59) {//blinks every 10 secoonds
      noFill();
      stroke(0);
      ellipse(width/2, height/2, secondSize, secondSize);
      i++;
    }
    else {
      stroke(217, 5, 245);
      ellipse(width/2, height/2, secondSize, secondSize);
      i++;
    }
  }



  pushMatrix(); //hour functions
  translate(width/2, height/2);
  rotate(radians(hourRot-12));
  for (int b = 0; b < 360; b+=30) {//creates 12 circles representing hours
    float angle = radians(b);
    float x = cx + cos(angle) * hoursRadius;
    float y = cy + sin(angle) * hoursRadius;

    if (b == 270) {
      fill(65, 8, 160);//fills circles blue and
      stroke(222, 254, 1);
    }
    else
    {
      fill(217, 5, 245);
      stroke(222, 254, 1);
    }

    ellipse(x, y, 20, 20);
  }
  popMatrix();

  pushMatrix(); // minute based on ring of circles rotating 
  translate(width/2, height/2);
  rotate(radians(minuteRot));
  for (int a = 0; a < 360; a+=6) {//creates 60 circles representing mintues 
    float angle = radians(a);
    float x = cx + cos(angle) * minutesRadius;
    float y = cy + sin(angle) * minutesRadius;

    if (a == 270 ||seconds== 0 ||seconds == 10 ||seconds == 20 || seconds == 30 || seconds== 40 || seconds == 50 ) {
      fill(217, 5, 245);
      stroke(0);
      ellipse(x, y, 10, 10);
    }
    else {
      fill(65, 8, 160);//fills circles blue and
      stroke(222, 254, 1);
      ellipse(x, y, 10, 10);
    }
  }
  popMatrix();

if(hours < 12)
{
   fill(222, 254, 1,20);
}
else{
  fill(222, 254, 1,80);
}
  rectMode(CENTER);
  text(yearN, width/2-(width/16), height/2+(height/32));//displays the year in string form

  println("the time is: " + hours + ":" + minutes + ":" + seconds);

}



