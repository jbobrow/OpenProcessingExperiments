
int rectangles = 0;
int rx = 0;
float ry = 0;
int boxdrops = 1;
int sizea = 100;
int ypos = mouseY;
int speed = 1;
int direction = 1;
int xpos = mouseX;
float ellx = 5;
void setup() {
  size(400,700);
  background(255);
}

void draw() {
  smooth();
  background(255);
  fill(112,33,6);
  noStroke();
  if (rectangles == 1){
    rect(rx,ry,sizea,sizea);
    ry = ry *1.05;
    
    if (ry > height){
      rectangles = 0;}
  }
  
  /*
  if (mousePressed == true) {
    rect(mouseX,mouseY,sizea,sizea);
    mouseY = mouseY + mouseY/45;
  }
  */
  fill(12,7,133);
  ellipse(ellx,680,20,20);
  
  ellx = ellx + random(6);
  while (ellx > 400) {
    ellx = 0;
   
    
  }
}

void mousePressed() {
  if (rectangles == 0){
  rectangles = 1;
  rx = mouseX;
  ry = mouseY;}
}

void mouseMoved() {
}


