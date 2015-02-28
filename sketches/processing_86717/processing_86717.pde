

int x1=0;
int x2=25;
int x3=50;
color c1= color(255, 0, 60);
color c2= color(255, 0, 100);
color c3= color(255, 0, 140);

void setup() {

size(300, 300);
noStroke();
}


void draw() {
background(0, random(250, 255), random(250, 255));
fill(c1, 100);
ellipse(x1, 150, 100, 100);
x1++;

fill(c2, 100);
ellipse(x2, 150, 100, 100);
x2+=2;

fill(c3, 100);
ellipse(x3, 150, 100, 100);
x3+=3;
}
