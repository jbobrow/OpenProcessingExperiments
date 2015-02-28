
int x=0;
 int y=0;

void setup() {
  size(600, 600);
  noFill();
  strokeWeight(15);

}
 
void draw() {
 background(255);

  ellipseMode(CORNERS);
 x=mouseX;
 y=mouseY;  


 for (int i=0; i<10; i++){
  
  stroke(100, random(200)+20, random(150)+50, 100);
  ellipse(x, y, x+random(300)-150, y+random(300)-150);
  
}
 }
