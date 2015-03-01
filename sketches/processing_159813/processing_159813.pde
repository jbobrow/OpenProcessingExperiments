
//week 2 assignment 4a
//modifying the zoog

int headW = 100;
int headH = 50;
int eyeDia = 20;

void setup() {
size(300,300);
background(255);
ellipseMode(CORNER);
rectMode(CORNER);
}

void draw() {
//general
background(255);
strokeWeight(3);

//variables
int headX = mouseX - 50;
int headY = mouseY - 25;
int eyeLX = mouseX - 25;
int eyeRX = mouseX + 25;
int eyeY = mouseY - 20;
int mouthLX = mouseX - 25;
int mouthRX = mouseX + 25;
int mouthY = mouseY + 10;

//head
ellipseMode(CORNER);
fill(mouseX,100,100);
ellipse(headX,headY,headW,headH);

//eyes
fill(255);
ellipseMode(CENTER);
ellipse(eyeLX,eyeY,eyeDia,eyeDia);
ellipse(eyeRX,eyeY,eyeDia,eyeDia);
point(eyeLX,eyeY);
point(eyeRX,eyeY);

//mouth
strokeWeight(5);
line(mouthLX,mouthY,mouthRX,mouthY);

}
