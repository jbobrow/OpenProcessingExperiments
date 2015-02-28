
int xPos = 0;
int yPos = 5;
int speed = 15;  
int yspeed = 1;
int xPos2 = 5;
int yPos2 = 2;
int speed2 = 8;
int yspeed2 = 10;
int xPos3 = 6;
int yPos3 = 10;
int speed3 = 10;  
int yspeed3 = 1;


void setup() {
  size(400, 400);
  smooth();
  background(255);
}

void draw() {




  xPos = xPos + speed;
  if (xPos >= width || xPos < 0) {
    speed = speed * (-1);
  }
  yPos = yPos + yspeed;
  if (yPos >= height || yPos < 0) {
    yspeed = yspeed * (-1);
  }

  fill(0);
  fill(random(255), random(255), random(255));

  noFill();
  strokeWeight(1);
  stroke(random(255), random(255), random(255), 255);
  line(xPos, yPos, 400, 100); 


  xPos2 = xPos2 + speed2;
  if (xPos2 >= width || xPos2 < 0) {
    speed2 = speed2 * (-1);
  }

  yPos2 = yPos2 + yspeed2;
  if (yPos2 >= height || yPos2 < 0) {
    yspeed2 = yspeed2 * (-1);
  }

  noFill();
  strokeWeight(1);
  stroke(random(255), random(255), random(255), 255);
  line(xPos2, yPos2, 30, 30); 

  xPos3 = xPos3 + speed3;
  if (xPos3 >= width || xPos3 < 0) {
    speed3 = speed3 * (-1);
  }
  yPos3 = yPos3 + yspeed3;
  if (yPos3 >= height || yPos3 < 0) {
    yspeed3 = yspeed3 * (-1);
  }
  noFill();
  strokeWeight(1);
  stroke(random(255), random(255), random(255), 255);
  line(xPos3, yPos3, 200, 400);
}


void mousePressed() {
  saveFrame("line.png");
}


