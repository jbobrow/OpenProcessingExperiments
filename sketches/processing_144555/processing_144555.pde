
int a = 1;
int b = 10;
int c = 0;

void setup() {
size(500,500);
background(0);
noStroke();
ellipseMode(RADIUS);
smooth();
}

void draw() { 
colorMode(HSB,360,100,100);
fill(190,b,70,150-a);
ellipse(250,250,a,a);
if(a < 150) {
a++;
} else {
a = 1;
b += 10;
if(b > 100) {
b = 10;
}
}
fill(0,0,100);
if(mousePressed) {
c = 0;
background(0);
}
}

void mouseMoved() {
c = c + 1;
if(c > 250) {
c = 0;
}
ellipse(0 + c + random(0,5*c),0 + c + random(0,5*c),1,1);
ellipse(0 + c + random(0,5*c),500 - c - random(0,5*c),1,1);
ellipse(500 - c - random(0,5*c),0 + c + random(0,5*c),1,1);
ellipse(500 - c - random(0,5*c),500 - c - random(0,5*c),1,1);
}
