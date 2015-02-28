
/***************************************
Project Insanity!
chris-henrick
DT/bootcamp/coneyisland/code/homework/8-05-13
***************************************/

int headX;
int headY;
int bodyx;
int bodyy;

float r;

void setup() {
  size(500, 500);
  background(200);
  headX = width/2;
  headY = height/2;
  bodyx = -26;
  bodyy = -26;
}

void draw() {
  r += 1;
  headRotate(r);
    
  for (float i = 0; i <366; i += 1) {
  projectInsanity(bodyx +i, bodyy + 10 + i, i);
  }
}

void headRotate(float x) {
  
  //rotate everything! but first offset rotation.
  translate(headX, headY);
  rotate(radians(x));
  
  // draw the head, eyes, mouth
  strokeWeight(1);
  stroke(0, 100);
  fill(255);
  ellipse(bodyx, bodyy, 40, 40);
  fill(0);
  ellipse(bodyx - 10, bodyy, 10, 10);
  ellipse(bodyx + 10, bodyy, 10, 10);
  fill(255);
  ellipse(bodyx, bodyy + 10, 10, 3);
  
  // body and legs white outlines
  strokeWeight(5);
  stroke(255, 100);
  line(bodyx, bodyy + 20, bodyx, bodyy +100);
  line(bodyx, bodyy + 100, bodyx -20, bodyy + 150);
  line(bodyx, bodyy + 100, bodyx + 20, bodyy + 150);
  
  // body and legs black lines
  strokeWeight(2);
  stroke(0, 100);
  line(bodyx, bodyy + 20, bodyx, bodyy +100);
  line(bodyx, bodyy + 100, bodyx -20, bodyy + 150);
  line(bodyx, bodyy + 100, bodyx + 20, bodyy + 150);
    
  rotate(0);
}

void projectInsanity(float xPos, float yPos, float size) {
  
  // make some random colors!
  int r = int(random(255));
  int g = int(random(255));
  int b = int(random(255));
  
  // make the projection of insanity!
  fill(r, g, b, 100);
  noStroke();
  ellipse(xPos, yPos, size, size);
}


