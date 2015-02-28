
float x = 0; //starting location
float y = 0;
int speed = 1; //speed of movement
int state = 0;

void setup(){
  size (500,500);
  smooth();
}

void draw(){
  background (255, 255, 255);
  rectMode(CENTER);
  zoog();
  //movement
  if (state == 0) {
    x = x + speed;
    if (x > width-55) {
      x = width-55;
      state = 1;
    }
  } else if (state == 1) {
    y = y + speed;
    if (y > height-110) {
      y = height-110;
      state = 2;
    }
  } else if (state == 2) {
    x = x - speed;
    if (x < 55) {
      x = 55;
      state = 3;
    }
  } else if (state == 3) {
    y = y - speed;
    if (y < 0) {
      y = 0;
      state = 0;
    }
  }
}

//functions//////////////////////////////////////////////

void zoog () {
//left legs
  float aX = 40; //start position x
  float aY = -30; //start position y
  float spacingX = 2; //increment x
  float spacingY = 15; // increment y
  float bX = 50; //end point x
  float bY = -50; //end point y
  float endLegs = -100; //loop end point
  
  stroke(0);
  while (aY>= endLegs) {
    line (x - aX, y - aY, x - bX, y - bY);
    line (x + aX, y - aY, x + bX, y - bY);
    
    aX = aX - spacingX;
    aY = aY - spacingY;
    bX = bX - spacingX;
    bY = bY - spacingY;
  }

//body
  float a = dist(x, y, mouseX, mouseY); //alpha changes according to mouse position
  beginShape();
  stroke(0);
  strokeWeight(1);
  fill(125, 124, 61,a);
  vertex(x-30, y+115);
  vertex(x-40, y+25);
  vertex(x-15, y+15);
  vertex(x, y);
  vertex(x+15, y+15);
  stroke(171, 170, 149);
  vertex(x+40, y+25);
  vertex(x+30, y+115);
  endShape(CLOSE);

//eyes
  float p = dist(mouseX, mouseY, x, y+20);
  strokeWeight(4);
  stroke(232, 231, 197);
  fill(0);
  //This looks really long and confusing, but its really not once the constrain function makes sense to you.
  ellipse(x-7, y+20,constrain(40-(p/2),8,15), constrain(40-(p/2),8,25)); //size of eyes changes in relation to mouse proximity
  ellipse(x+7, y+20,constrain(40-(p/2),8,15), constrain(40-(p/2),8,25));
  }



