
float r;
float g;
float b;
float a;
float diam;
float x;
float y;
void setup() {
size(200,200);
background(0);
smooth();
}
void draw() {

r = random(255);
g = random(255);
b = random(255);
a = random(255);
diam = random(20);


 stroke (random(255), random(255), random(255));
 }
void mousePressed() {
noStroke();
fill(r,g,b,a);
rectMode(CENTER);
rect(mouseX,mouseY,diam,diam);
}
void keyPressed() {
background(255);

}

