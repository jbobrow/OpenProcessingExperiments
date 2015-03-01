
//x and y coordiantes
float thingX;
float thingY;

//eye color
float r;
float g;
float b;

void setup() {
  size (600, 400);
  thingX = width/2;
  thingY = height+200;
  smooth ();
 
}

void draw () {
  background (20, 255, 100);
  //setting ellipse mode
  rectMode (CENTER);
  ellipseMode (CENTER);
  
  //body
  noStroke ();
  fill (20, 50, 190);
  rect (thingX, thingY, 80, 80);
  
  //feet
  stroke (0);
  strokeWeight (2);
  line (thingX-20, thingY+40, thingX-pmouseX, thingY-pmouseY);
  line (thingX+20, thingY+40, thingX+pmouseX, thingY+pmouseY);
  
  //eyes
  r = random (255);
  g = random (255);
  b = random (255);
  strokeWeight(1);
  fill (r, g, b);
  ellipse (thingX-20, thingY-20, 20, 20);
  ellipse (thingX+20, thingY-20, 20, 20);
  fill(0);
  ellipse (thingX-20, thingY-20, 4, 4);
  ellipse (thingX+20, thingY-20, 4, 4);
  
  //eyebrows
  line (thingX-10, thingY-30, thingX-20, thingY-50);
  line (thingX+10, thingY-30, thingX+20, thingY-50);  
  
  //move up
  thingY = thingY -1;
 
}



