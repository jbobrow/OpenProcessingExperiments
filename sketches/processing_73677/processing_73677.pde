
//Dakotah Konicek    dkonicek
//Copyright © 2012 Dakotah Konicek
//HW8
//
int s = 10;
void setup() {
size(400,400);


}

void draw() {
background(255);
drawTopLines();
drawRightLines();
drawBottomLines();
drawLeftLines();
drawTopLines2();
drawRightLines2();
drawBottomLines2();
drawLeftLines2();
}

void drawLeftLines() {
  int bx=0;
  int by=height;
  while (by>0) {
  stroke(0);
  line(mouseX,mouseY,bx,by);
  by+=-s;
  }
}
  

void drawBottomLines() {
  int bx=width;
  int by=height;
  while (bx>0) {
  stroke(0);
  line(mouseX,mouseY,bx,by);
  bx+=-s;
  }
}

void drawRightLines() {
  int rx=width;
  int ry=0;
  while (ry<height) {
  stroke(0);
  line(mouseX,mouseY,rx,ry);
  ry+=s;
  }
}
  
void drawTopLines() {
int ux=0;
int uy=0;
while (ux<width) {
stroke(0);
line(mouseX,mouseY,ux,uy);
ux+=s;
 
}
}

void drawLeftLines2() {
  int bx=0;
  int by=height;
  while (by>0) {
  stroke(0);
  line(mouseY,mouseX,bx,by);
  by+=-s;
  }
}
  

void drawBottomLines2() {
  int bx=width;
  int by=height;
  while (bx>0) {
  stroke(0);
  line(mouseY,mouseX,bx,by);
  bx+=-s;
  }
}

void drawRightLines2() {
  int rx=width;
  int ry=0;
  while (ry<height) {
  stroke(0);
  line(mouseY,mouseX,rx,ry);
  ry+=s;
  }
}
  
void drawTopLines2() {
int ux=0;
int uy=0;
while (ux<width) {
stroke(0);
line(mouseY,mouseX,ux,uy);
ux+=s;
 
}
}

void keyPressed() {
  if (key=='p')
  {saveFrame("hw8.jpg");}}
    

