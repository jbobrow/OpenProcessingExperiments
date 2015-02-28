
int x=0; 
void setup() {
size(800, 800);
fill(254, 255, 0);
ellipse(400, 400, 600, 600); 
fill(0);
ellipse(300, 300, 60, 60);
ellipse(500, 300, 60, 60);
ellipse(400, 500, 400, 200);
} {
strokeWeight(7);
smooth();
stroke(0, 102);
}
void draw() {
  fill(3, 12, 255);
  line(mouseX, mouseY, pmouseX, pmouseY);
}
void mouseClicked() {
if(x==0) {
  fill(240, 17, 17); 
  ellipse(400, 500, 100, 50);
  ellipse(300, 300, 30, 30);
  ellipse(500, 300, 30, 30); 
  x=1;
  }
  else {
    fill(97, 0, 225);
  ellipse(400, 500, 100, 50);
  ellipse(300, 300, 30, 30);
  ellipse(500, 300, 30, 30);
  x=0; 
}
}
