
//x and y coordiantes
float thingX;
float thingY;
float bodySize;

//eye color
float r;
float g;
float b;

void setup() {
  size (600, 400);
  thingX = width/2;
  thingY = height+100;
  smooth ();
}

void draw () {
  background (20, 255, 100);
  //setting ellipse mode
  rectMode (CENTER);
  ellipseMode (CENTER);

  //flashing body
  noStroke ();
  r = random (255);
  g = random (255);
  b = random (255);
  bodySize = random (40, 300);
  noStroke();
  fill (r, g, b);
  rect (thingX, thingY, bodySize, bodySize);
    //hard body
  strokeWeight(1);
  fill (20, 255, 100, 255);
  rect (thingX, thingY, 80, 80);
  
  
  
  //feet
  stroke (0);
  strokeWeight (2);
  line (thingX-20, thingY+40, thingX-40, thingY+80);
  line (thingX+20, thingY+40, thingX+40, thingY+80);
  
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



