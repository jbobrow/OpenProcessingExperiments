
/* DESCRIPTION
Each time you click, you create new concentric
circles, and new lines.
You can draw multiple lines by keeping your mouse
clicked, and concentric circles are drawn once you release it.
you can save the frame with 's' or 'S', and reinitialise it
with backspace and delete.
*/

color[] palette1 = {#61FF0B, #FE19FF, #B200B2, #FFF900, #000000};

void setup() {
  size(800, 800);
  background(0);
}

void draw() {
    if(mousePressed) {
    float r2 = random(4);
    strokeWeight(1);
    stroke(palette1[int(r2)], random(50));
    line(height/2, width/2, mouseX, mouseY);
  }
}
void mouseReleased() {
  float r1 = random(4);
  float r3= random(5);
  float r = random(600);
  fill(palette1[int(r1)], random(50));
  ellipse(height/2, width/2, r, r);
  if(mouseX < 600) {
  noFill();
  stroke(0, random(30));
  strokeWeight(random(10));
  ellipse(height/2, width/2,mouseX, mouseX);
  }
    if(mouseX > 600) {
  noFill();
  stroke(255, random(10));
  strokeWeight(random(10));
  ellipse(height/2, width/2,mouseY, mouseY);
  }
}  

void keyReleased() {
  if (key== DELETE || key== BACKSPACE) background(0);
  if (key == 's' || key == 'S') saveFrame("screenshot.png");
}
