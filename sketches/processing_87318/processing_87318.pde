
//Ben Norskov
//29 jan 2013
//intro class code

int xstep = 100;
int ystep = 80;
float targetX, targetY;
float x_speed = 3;
float y_speed = 3;
PFont rock;
boolean isMouse = false;
void setup() {
  size(900, 600); //make a 900x600 window
  noStroke();//turn off outlines
  rock = loadFont("Rockwell-48.vlw");//load in a font
  textFont(rock, 32);
}
void draw() {
  bounceTarget(); //function to turn pointy things at mouse
  
  //make things fade out
  fill(200, 10);
  rect(0, 0, width, height);
  float sinOff = sin(frameCount*.01);
  fill(50+sinOff*50, 70, 127+sinOff*126);
  text("Creative Computing", 50, 200);
  text("Ben Norskov", 50, 240);
  for (int i = 0; i<= width; i+=xstep) {
    for (int j = 0; j<=height; j+=ystep) {
      drawStarThing(i, j);
    }
  }
}
void bounceTarget() {
  targetX = (isMouse) ? mouseX : targetX + x_speed;
  targetY = (isMouse) ? mouseY : targetY + y_speed;
  if (targetX > width) {
    targetX = width;
    x_speed *= -1;
  }
  if (targetX < 0) {
    targetX = 0;
    x_speed *= -1;
  }
  if (targetY > height) {
    targetY = height;
    y_speed *= -1;
  }
  if (targetY < 0) {
    targetY = 0;
    y_speed *= -1;
  }
  x_speed += noise(frameCount*.1) * .2 - .1;
  y_speed += noise(frameCount*.12) * .2 - .1;
}

void drawStarThing(float x, float y) {
  float displace = targetX - x; 
  float fill_color = map(displace, 0, width, 0, 255);
  fill(fill_color, fill_color, fill_color);
  //map(mouseX, 0, width, 100, width-100);
  float back = map(displace, -x, x, -30, 30);
  float offset = map(displace, -x, x, 0, 20);
  pushMatrix();
  translate(x, y);
  rotate(atan2(targetY - y, targetX - x));
  beginShape();
  vertex(displace, 0);
  vertex(-displace, 30 + offset);
  vertex(back, 0);
  vertex(-displace, -30 - offset);
  endShape(CLOSE);
  popMatrix();
}
void keyPressed() {
  if (key == ' ') {
    isMouse = !isMouse;
  }
}
