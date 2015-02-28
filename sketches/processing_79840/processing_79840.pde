

void setup() {
size(300, 200);

ellipse(100,100,75,75);
background(0);
frameRate(10);
noStroke();
fill(112);
}
int a = 75;
int d = 100;
int e=50;
int b = 25;
int c = 125;

void draw() {
  background(0);
  frameRate(10);
rect(a++, 70, 15, 4);
rect(b++, 70, 15, 4);
rect(c++, 70, 15, 4);
rect(d++, 70, 15, 4);
rect(e++, 70, 15, 4);

fill(10,100,21);
ellipse(85,75,85,75);
ellipse(85,100,55,65);
fill(247,48,12);
ellipse(100,70,15,10);
ellipse(70,70,15,10);
}



