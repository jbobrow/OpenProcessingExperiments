
float r;
float g;
float b;
float a;
float w;
void setup() {
size(300,300);
background(0);
smooth();
}
void draw() {
r = random(255);
g = random(255);
b = random(255);
a = random(255);
w = random(10);
stroke(r,g,b,a);
strokeWeight(w);
line(pmouseX,pmouseY,mouseX,mouseY);
}
void mousePressed(){
  background(0);
}
