
float x=0;
float y=0;
float a=42;
 
 
void setup() {
size(400, 400);
y=height/2;
y=width/2;
noStroke();
size(600, 600);
background(0);
colorMode(RGB, height);
 
 
int sw = 0;
 
 
for (int i=10;i<height;i+=10) {
 
 
strokeWeight(sw+.5);
smooth();
 
 
stroke(random(255), random(255), random(255), random(255));
fill(random(255),random(255),random(255),random(255));
 
 
 
}
}
 
 
void draw() {
 
 
line(x, y, 300, 300);
x+=cos(radians(a))*5;
y+=sin(radians(a))*5;
a++;
 
 
x+=1;
 
 
if ((x > width) || (x < 0)) {
x = 300;
}
if ((y > height) || (y < 0)) {
y = 300;
}
}

