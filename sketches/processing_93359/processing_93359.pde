
int t = 300;

void setup() {
size(500,500);
frameRate(30);
}

void draw() {
background(255);

ellipseMode(CENTER);
rectMode(CENTER);

stroke(0);
fill(mouseX,5,mouseY);
rect(mouseX,mouseY,20,100);
//100,100

stroke(0);
fill(255);
ellipse(mouseX,mouseY-30,60,60);
//100,70

fill(random(255),random(255),random(255));
ellipse(mouseX-19,mouseY-30,16,32);
ellipse(mouseX+19,mouseY-30,16,32);
//81,70   119,70

stroke(0);
line(mouseX-10,mouseY+50,mouseX-20,mouseY+60);
line(mouseX+10,mouseY+50,mouseX+20,mouseY+60);
line(mouseX-10,mouseY-10,mouseX+10,mouseY-10);
}
//90,150,80,160
//110,150,120,160
//90,90,110,90

void mousePressed() {
ellipse(mouseX,mouseY,t,t);
fill(random(255));
}


