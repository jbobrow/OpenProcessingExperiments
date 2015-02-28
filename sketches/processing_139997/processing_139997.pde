
  
// learning map fucntion
//changing color when mouse gets closer to the center of the canvas
void draw() {
  noStroke();
  float d = dist(width/2, height/2, mouseX, mouseY);
  float maxDist = dist(0, 0, width/2, height/2);
  float red = map(d, 0, maxDist, 0, 255);
  fill(red,200,200);
  rect(0, 0, width, height);
}


