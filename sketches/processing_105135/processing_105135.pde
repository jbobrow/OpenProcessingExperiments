
//declare variables
int xPos;
int yPos;
int diameter;
float xspeed;
float yspeed;

void setup() {
  size(400, 300);
  background(255);
  fill(150, 0, 0);
  noStroke();
  diameter=50;
  xPos=25;
  yPos=25;
  xspeed=4;
  yspeed=6;
}

void draw() {
  background(150);
  fill(150, 0, 0);
  ellipse(xPos, yPos, diameter, diameter);


  xPos+=xspeed;
  yPos+=yspeed;

  if (xPos < width-25 && xPos > 25) {
    xspeed=xspeed;
  }

  if ((xPos >= width-25) || (xPos <= 25)) {
    xspeed=xspeed*-1;
  }

  if (yPos < height-25 && yPos > 25) {
    yspeed=yspeed;
  }

  if ((yPos >= height-25) || (yPos <= 25)) {
    yspeed=yspeed*-1;
  }
}
