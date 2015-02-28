
float r;
float g;
float b;
float a;
void setup(){
  size(800,500);
  //stroke(r,g,b);
  smooth();
}
void draw(){
  stroke(0,0,0);
  line(random (int(800)),random (int (500)),mouseX,mouseY);
}
void mousePressed(){
  background(r=random(255),g=random(255),b=random(255));
}
void mouseDragged(){
stroke(255,255,255);
  line(mouseX,mouseY,0,300);
} 


