
void setup() {
  size(500, 500);
  background(255);
 
}
void draw() {
  stroke(0);
  translate(50,50);
 fill(0);
  line(mouseX, mouseY,20,20, 5);
   fill(0);
  line(-mouseX, -mouseY,20,20, 5);
  noStroke();
  fill(150,40,255,80);
  ellipse(mouseX, mouseY, 10,10);

}
