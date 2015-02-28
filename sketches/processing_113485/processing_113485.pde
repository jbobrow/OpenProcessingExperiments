
float xPos = 100;
float yPos;
Ovals[] ovalArray;

Ovals oval;
void setup(){
size(400,400);
smooth();
yPos = height/2;
frameRate(10);
}



void draw(){
background(200);
stroke(220, 20, 0);
fill(0,20,220);
ellipse(xPos, yPos, 50, 50);
// The below line says that the value of xPosition will grow by 2 every frame
xPos += 2; 
line(xPos, yPos, 200, 300);
line(200, 300, 100, 400);
line(200, 300, 300, 400);
line(mouseX, mouseY, xPos, yPos);
line(xPos, yPos, 300, 250);
drawOvals();
}

void drawOvals(){
for (int i; i < 10; i++){
oval = new Ovals();
oval.display();
//ovalArray = (Ovals[]) append(ovalArray);
} 
}


//page 121
//page 127
//page 174


class Ovals {
 float r;
 float g;
 float b;
 float s;
 float wid;
 float hei;
 
  Ovals() {
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
    s = random(0, 255);
    c = color(r, g, b);
    PosX = random(0, 400);
    PosY = random(0, 400);
    wid = random (10, 50);
    hei = random (10, 50);
  }
  void display() { 
  //constantly make random ellipses
  //int i = 1;
  //while(i < 9999999) {
    fill(c);
    stroke(s);
    ellipse(PosX, PosY, wid, hei);
  }
}


