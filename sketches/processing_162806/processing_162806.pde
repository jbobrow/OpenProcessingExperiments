
color bColor = color(255, 255, 255);
float circleX;

float red;
float green;
float blue;
float Xspeed = 1;
float pXspeed = 0;

void setup () {
  size(800, 800);
  pXspeed = Xspeed;
  Xspeed = Xspeed + 1;
}

void draw () {
  red = random(255);
  green = random(255);
  blue = random(255);

  //change bcolour
  background(bColor);

  bColor = color(red, green, blue);
  //}


  if (circleX > width || circleX < 0) {
    red = 0;
    green = 0;
    blue = 0;

    Xspeed = Xspeed * -1;
  }

  //printline
  println (pXspeed); 
  println (Xspeed); 

  //change bcolor every 2nd time
  
  if (pXspeed > Xspeed) {
    background(0);
  }
  else if (pXspeed < Xspeed) {
    background(bColor);
  }
  
    //the ball
  fill(255);
  stroke(255);
  ellipse(circleX, 180, 24, 24);
  circleX = circleX + Xspeed;

  
}

