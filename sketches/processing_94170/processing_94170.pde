
int r = 255;
int g = 255;
int b = 255;
float x = 200;
float y = 200;
float d = 100;
float a = 0;
void setup(){
size (800, 600);
}
void draw() {
if (mousePressed == true) {
x = random(800);
y = random(600);
d = random(25, 50);
r=mouseX;
g=mouseY;
b = mouseX;
x = random(800);
y = random(600);
d = random(10,100);
a = random(0,255);
fill(255,g,b,a);
rect (x, y, 25, 25);
ellipse (x + 5, y + 10, 5, 5);
ellipse (x + 20, y + 10, 5, 5);
arc(x + 12.5, y + 13, 5, 5, 0, PI);
} else {
x = random(800);
y = random(600);
d = random(25, 50);
r=mouseX;
g=mouseY;
b = mouseX;
fill (51,g,b);
//fill (c,153,c);
rect (b, y, 25, 25);
ellipse (b + 5, y + 10, 5, 5);
ellipse (b + 20, y + 10, 5, 5);
arc(b + 12.5, y + 13, 5, 5, 0, PI);
}
if (keyPressed){
background (255);
}
}
//


