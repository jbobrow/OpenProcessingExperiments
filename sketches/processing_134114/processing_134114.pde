
// crashCourse processing by Corneel Cannaerts 2014
// animation & time

// time is measured in frames, each frame the draw loop get executed once
// second(), minute(), hour(), day(), month(), year() read values from the computers clock


float a = 0;
float r = 120;

void setup() {
  size(400, 400);
  background(255);
  
  //the frameRate() function lets you specify a desired speed
  frameRate(30);
}

void draw() {
  // background(255);
  float x = 200 + r * cos(a);
  float y = 200 + r * sin(a);

  noStroke();
  fill(0, 30);
  ellipse(x, y, 10, 10);
  
  // variables can be updated, the line below can be read as: add 0.05 to a every frame
  a = a +0.05;
  //r = r -0.05;
  //r =  r+ random(-5,5);

  // frameRate gives you the current speed
  println("frameRate: "+frameRate);
  // frameCount the number of frames since the program started running
  println("frameCount: "+frameCount);
  // millis() gives the number of milliseconds since the program started running
  println("milliseconds: "+millis());
}



