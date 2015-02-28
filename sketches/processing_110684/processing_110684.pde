
void setup(){
  // Sets up the background and canvas size
  background(80);
  size(400, 400);
}

void draw(){
  // Sets the stroke colour
  stroke(random(255),random(255),random(255));
  // Draws the pen tip
  line((pmouseX + random(50)), (pmouseY + random(50)), (mouseX + random(80)), (mouseY + random(70)));
}
