
int object = 0;
void setup() {
  background(0);
  size(500, 500);
  colorMode(HSB);
  frameRate(40);
}

void draw() {

  if (object==0) {
    translate(250, 250);
    rotate(0.1*frameCount);
    drawHouse(255, 255, 255);
  }
  else if (object==1) {
    translate(250, 250);
    rotate(0.1*frameCount);
    drawHouse(105, 255, 255);
  }
  else if (object==2) {
    translate(250, 250);
    rotate(0.1*frameCount);
    drawHouse(30, 255, 255);
  }
  else if (object==3){
   translate(250, 250);
    rotate(0.1*frameCount);
    drawFlower(255, 255, 255);
}
  objectEraser();
}


void drawHouse(int h, int s, int b) {
  float sidelenght = random(100);
  float x = random(470);
  float y = random(15, 470);
  fill(h, s, b);
  rect(x, y, sidelenght, sidelenght);
  triangle(x, y, x+sidelenght, y, (x+x+sidelenght)/2, y-0.5*sidelenght);
  fill(0);
  stroke(0);
  rect(x+(sidelenght/6), y+(sidelenght/3), (sidelenght/6), (sidelenght/6));
  rect(x+(sidelenght/2), y+sidelenght/3+sidelenght/15, 4*sidelenght/15, 9*sidelenght/15);
}
void drawFlower(int h,int s,int b){
  float x=random(500);
  float y=random(500);
  float diameter=random(50);
  float radius=diameter/2;
  fill(30, 255, 255);
  ellipse(x,y,diameter,diameter);
  fill(h,s,b);
  ellipse(x-diameter,y,diameter,diameter);
  ellipse(x-radius,y-1.5*radius,diameter,diameter);
  ellipse(x+radius,y-1.5*radius,diameter,diameter);
  ellipse(x+diameter,y,diameter,diameter);
  ellipse(x+radius,y+1.5*radius,diameter,diameter);
  ellipse(x-radius,y+1.5*radius,diameter,diameter);
  
}

void objectEraser() {
  fill(0, 5);
  stroke(0, 0, 300);
  rect(0, 0, width, height);
}
void keyPressed() {
  //if (keyPressed==true) {
  object=(object+1)%4;
  //}
}





