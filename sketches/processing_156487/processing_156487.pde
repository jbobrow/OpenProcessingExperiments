

void setup() {
  background(0);
  size(800,860);
}
  
  
void draw() {
fill(200);
stroke(255,255,255,255);
strokeWeight(5);

if(mouseX>20 && mouseX<780 && mouseY>60 && mouseY<860) {
if (mousePressed) { drawEllipse();}
}
}
 
void drawEllipse() {
  float x= random(20,30);
  float y= random(20,30);
      fill(random(0,255),random(0,255),random(0,255));
      stroke(255,0,0,20);
ellipse (mouseX, mouseY, 60, 60);
      stroke(255,255,255,20);
ellipse (mouseY, mouseX, 60, 60);
}  

void keyPressed() {
  if (key=='s') saveFrame();} // S key for Save

void saveDrawing() {
saveFrame("images/Microscope_###.png");
} //Save function

 

