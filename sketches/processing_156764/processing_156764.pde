
void setup ()
{
  size(500, 500);
  background(255, 255, 255);
}
 
void draw ()
{
  rectMode(CORNER);
  noStroke();
  fill(255, 255, 255, 50);
  rect(0, 0, width, height);
  //background(255, 255, 255);
  noFill();
  stroke(100, 100, 100);
 
  rectMode(CENTER);
  translate(mouseX, mouseY);
  rotate(millis()/700.0);
  rect(0, 0, 100, 100);


}

void mousePressed() {
  noLoop();  // Holding down the mouse activates looping
}
 
void mouseReleased() {
  loop();  // Releasing the mouse stops looping draw()
}

