
import lmu.*;
float lm;
void setup() {
  size(400, 400);
} 

void draw() {
  fill(255, 10);
  rect(0, 0, width, height);

  translate(width/2, height/2);
  lm = LmuTracker.getLMURight() / 10000f * 4;
  fill(0, 0, 255);
  ellipse(0, 0, lm, lm);
}


