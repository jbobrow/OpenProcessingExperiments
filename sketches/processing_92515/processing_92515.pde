
//Valentina Pherson
//Creative Computing
//200 Objects Homework
//March 11, 2012

int num_of_lines = 200;
float[] lineX = new float[num_of_lines];
float[] lineY = new float[num_of_lines];
float[] lineSpeed = new float[num_of_lines];
float gravity = .4;
float angle = 45;
 
int currentClick = 0;
void setup() {
  size(350, 550);
}
 
void draw() {
  background(14, 14, 14);
  for (int i = 0; i < num_of_lines; i++) {
    drawMyStuff(lineX[i], lineY[i]);
    lineY[i] += lineSpeed[i];
    lineX[i] += lineSpeed[i];
    lineSpeed[i] += gravity;
  }
  
}
 
void drawMyStuff(float x, float y) {
 
  //1 Pressed, Lines Dark Blue
  if(key == '1') {
  stroke(0, 100, map(y, 0, height, 100, 255));
  line(x, 0, x, height);
  stroke(0, 100, map(y, 0, height, 100, 255));
  line(0, y, width, y);
  }
  //2 Pressed, Lines Bright Green
  if(key == '2') {
  stroke(0, 255, map(y, 0, height, 100, 255));
  line(x, 0, x, height);
  stroke(0, 255, map(y, 0, width, 100, 255));
  line(0, y, width, y);
}
//3 Pressed, Lines are Pink
  if(key == '3') {
  stroke(255, 0, map(y, 0, height, 0, 255));
  line(x, 0, x, height);
  stroke(255, 0, map(y, 0, width, 0, 255));
  line(0, y, width, y);
}
//If 4 Pressed, fill Random
if(key == '4') {
  stroke (random(255),random(255),random(255),random(255));
  line(x, 0, x, height);
  stroke (random(255),random(255),random(255),random(255));
  line(0, y, width, y);
}
if(key == '5') {
  pushMatrix();
  translate(width, 0);
  rotate(angle);
   stroke(255);
  line(x, 0, x, height);
  stroke(255);
  line(0, y, width, y);
  popMatrix();
}
//If ! Pressed, Rotate Lines Slightly
if(key == '0') {
  translate(mouseX, mouseY);
  rotate(angle);
   stroke(255);
  line(x, 0, x, height);
  angle +=0.1;
  translate(mouseX, mouseY);
  rotate(angle);
  stroke(255);
  line(0, y, width, y);
  angle +=0.1;
}
}
 
void mouseDragged() {
  lineX[currentClick] = mouseX;
  lineY[currentClick] = mouseY;
  lineSpeed[currentClick] = -10;
  currentClick +=1;
  if (currentClick >= num_of_lines) {
    currentClick =0;
  }
}
