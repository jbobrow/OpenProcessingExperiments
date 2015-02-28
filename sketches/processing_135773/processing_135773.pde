

float startAngle = 0;
float angleVel = 0.1;

float tailHeight =300;

String instructions = "Move the mouse.";

int startX, endX;
int tailLength;
int xspacing = 5;   

int angle;
int suckersangle;

void setup() {
  size(800, 800);
  smooth();

  rectMode(CENTER);
  tailLength = width/2;
  suckersangle = 1;
  angle = 0;
}

void draw() {
  background(255);
  tailLength = mouseX;
  startAngle += 0.5;  //controls speed of wave, smaller numbers make it slower
  float angle = startAngle; //this will make it stop moving with a static number
  angle = 1;  //as far as I can tell this part does nothing
  startX = 0;  //controls where the origin of the wave is on x
  endX = startX + tailLength;

  for (int x = startX; x <= endX; x ++) {  //NoC example NOC_3_09

    // a is the angle of sine wave to calculate thickness of the half of tail
    float a = map(x, startX+tailLength/2, startX+tailLength, 90, 0);

    // thickness of tail (each pixel)
    float y = map(sin(radians((startAngle+a)%360)), -1, 1, 0, height/2);
    // println("xspacing = " + xspacing + " x = " + x + " (x*xspacing) " + (x*xspacing) ); 
    float h = tailHeight * ((x > startX+tailLength/2) ? sin(radians(a)) : 1);
    //  ellipse(x, y, 20, 20); 
    noStroke();
    fill(109, 24, 170);  //purple color
    //fill(0);  //making a black tentacle exactly behind the other tentacle
    rect(x, y + 10, 4, h);  //kind of adds a drop shadow effect
    //rect(x, y - 10, 4, h);

    angle++;

    if (angle>360)
      angle = 0;
  }

  for (int x = startX; x <= endX; x ++) {  

    // a is the angle of sine wave to calculate thickness of the half of tail
    float a = map(x, startX+tailLength/2, startX+tailLength, 90, 0);

    // thickness of tail (each pixel)
    float y = map(sin(radians((startAngle+a)%360)), -1, 1, 0, height/2);
    // println("xspacing = " + xspacing + " x = " + x + " (x*xspacing) " + (x*xspacing) ); 
    float h = tailHeight * ((x > startX+tailLength/2) ? sin(radians(a)) : 1);
    //  ellipse(x, y, 20, 20); 
    noStroke();
    //fill(255, 10, 10);  //red
    fill(186, 146, 201);  //purple color
    rect(y, x, 10, h);
    //fill(14, 234, 12);  //green
    fill(135, 13, 180);  //purple color
    rect(y, y, 10, h);
    angle++;

    if (angle>360)
      angle = 0;
  }
  textSize(24);
  text(instructions, (width/2), (height-50));

  // suckers();
}

void suckers() {
  for (int e = 1; e <= width/2; e += 8) {  //NoC example NOC_3_09
    float y = map(sin(suckersangle), -1, 1, 0, height/2);
    strokeWeight(2);
    stroke(15);
    fill(255);
    ellipse(e*xspacing, y, 20, 20);  
    ellipse((e*xspacing) + 10, y + 40, 20, 20);  
    suckersangle++;

    if (angle>360)
      angle = 0;
  }
}



