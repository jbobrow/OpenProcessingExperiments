
void setup () {
  size (800,600);
  createGraphics(800, 600);
}
 void draw () {
   fill (0, 255);
  
stroke(255, 25, 200);
ellipseMode(CENTER);
ellipse(400, 300, mouseX, mouseY);

}
