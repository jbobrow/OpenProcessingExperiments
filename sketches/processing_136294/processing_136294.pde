
float c = random(255);
float d = random(255);
float e = random(255);
void setup(){
size(400,400);
background(c,d,e);
smooth();
}
   float r = random(255);
   float g = random(255);
   float b = random(255);
void mousePressed (){
     float r = random(255);
   float g = random(255);
   float b = random(255);
  fill(r,g,b);
   }
float x = PI/12;
void draw() {
  noStroke();
  translate(200,200);
if(mouseButton==RIGHT) {
fill(c,d,e);
  ellipse(mouseX-200,mouseY-200,15,15);
}
if(mouseButton==LEFT) {
  rotate(x);
  x = x + PI/12;
quad(mouseX-200,mouseY-200,mouseX-180,mouseY-200,mouseX-170,mouseY-185,mouseX-210,mouseY-185);
  }
}
void mouseDragged() {
  float f = random(255);
  float h = random(255);
  float i = random(255);
  float j = random(255);
  fill(f,h,i,j);
}
