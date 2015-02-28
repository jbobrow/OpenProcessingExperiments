
//Chronometer by Luis Silva
PImage photo1; //Moon
PImage photo2; //ClockTown
PImage photo3; //Clock_outside_Minutes
PImage photo4; //Clock_inside
PImage photo5; //Time_HUD
PImage photo6; //Day_Indicator
PImage photo7; //1st_Day
PImage photo8; //Second_Indicator
PImage photo9; //Hour_Indicator_Day
PImage photo10; //Hour_Indicator_Night
PImage photo11; //M.Mask Cursor
float seconds, minutes, hours, days, months, years;

void setup() {
  size(800, 800);
  smooth();
  println("You've met with a terrible fate, haven't you?");
}

void draw() {
  background(188, 84, 84);

  //  //Grid 
  //  strokeWeight(1);
  //  stroke(255);
  //  //x
  //  line(0, 100, 1000, 100);
  //  line(0, 200, 1000, 200);
  //  line(0, 300, 1000, 300);
  //  line(0, 400, 1000, 400);
  //  line(0, 500, 1000, 500);
  //  line(0, 600, 1000, 600);
  //  line(0, 700, 1000, 700);
  //  line(0, 800, 1000, 800);
  //  line(0, 900, 1000, 900);
  //  //y
  //  line(100, 0, 100, 1000);
  //  line(200, 0, 200, 1000);
  //  line(300, 0, 300, 1000);
  //  line(400, 0, 400, 1000);
  //  line(500, 0, 500, 1000);
  //  line(600, 0, 600, 1000);
  //  line(700, 0, 700, 1000);
  //  line(800, 0, 800, 1000);
  //  line(900, 0, 900, 1000);


  seconds = second();
  minutes = minute();
  hours = hour();

  //Moon
  pushMatrix();
  //float a = map(second(), 0, 59, 100, 600); //to see if it works
  float a = map(hour(), 0, 23, 100, 600);
  //ellipse(width/2, height/2-200, a, a); //test
  photo1 = loadImage("Moon.png");
  imageMode(CENTER);
  image(photo1, width/2, height/2-200, a, a);
  popMatrix();

  //Clocktown
  photo2 = loadImage("Clocktown.png");
  imageMode(CENTER);
  image(photo2, width/2+20, height/2-150);
  //Clock_Inside
  pushMatrix();
  photo4 = loadImage("Clock.png");
  imageMode(CENTER);
  image(photo4, width/2-5, height/2+153);
  popMatrix();
  //Clock_Outside
  pushMatrix();
  float minuteRot = map(minutes, 0, 59, 0, 360);
  translate(width/2-5, height/2+153);
  rotate(radians(minuteRot));
  imageMode(CENTER);
  photo3 = loadImage("Clock_outside.png");
  image(photo3, 0, 0);
  popMatrix();

  //Time_HUD
  imageMode(CENTER);
  photo5 = loadImage("Clockbase.png");
  image(photo5, width/2, height/2+320);
  //Day_Indicator
  imageMode(CENTER);
  photo6 = loadImage("Dayindicatorblue1.png");
  image(photo6, width/2, height/2+350);
  //Day
  pushMatrix();
  imageMode(CENTER);
  photo7 = loadImage("1stday.png");
  image(photo7, width/2, height/2+350);
  popMatrix();
  //Second_Indicator
  pushMatrix();
  float secondRot2 = map(seconds, 0, 59, -95, 85);
  translate(width/2, height/2+380);
  rotate(radians(secondRot2)); 
  imageMode(CENTER);
  photo8 = loadImage("Secondindicator.png");
  image(photo8, 0, 0);
  popMatrix();
  //Hour_Indicator_Night
  pushMatrix();
  float hourRot = map(hours, 0, 23, -110, 290);
  translate(width/2, height/2+360); //360
  rotate(radians(hourRot));
  imageMode(CENTER);
  photo10 = loadImage("Hourindicatordaytime2.png");
  image(photo10, 0, 0);
  popMatrix();
  //Hour_Indicator_Day
  pushMatrix();
  float hourRot2 = map(hours, 0, 23, -285, 70);
  translate(width/2, height/2+360);
  rotate(radians(hourRot2));
  imageMode(CENTER);
  photo9 = loadImage("Hourindicatornighttime2.png");
  image(photo9, 0, 0);
  popMatrix();

  //  int d = day();    // Values from 1 - 31
  //  int m = month();  // Values from 1 - 12
  //  int y = year();   // 2003, 2004, 2005, etc.
  //  String s = String.valueOf(d);
  //  text(s, 10, 28);
  //  s = String.valueOf(m);
  //  text(s, 10, 56); 
  //  s = String.valueOf(y);
  //  text(s, 10, 84);

  if (mousePressed) {
    textSize(50);
    fill(0);
    text(month()+":"+day()+":"+year(), 0, 100);
  }
}



