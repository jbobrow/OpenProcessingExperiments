
int x1=10;
int x2=50;
int x3=500;
int y1=500;
int y2=30;
int y3=600;
 
 
void setup() {
  size(600,600);
  background(40);
}
 
 
void draw() {
  stroke(255,10);
  line(mouseX,mouseY,x2,y3);
  line(mouseX,mouseY,x3,y2);
  line(mouseX,mouseY,x1,y1);
  
}
