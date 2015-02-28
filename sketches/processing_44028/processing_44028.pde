

void setup() {
  size(500, 500);
  smooth();
  background(222,36,85);
}
{
color c;}

void draw() {
  
  if (mousePressed) {
    fill(random(255));
  } else {
    fill(random(255));
    stroke(100);
  }
  ellipse(mouseX, mouseY, 30, 30);
}

 void keyPressed() {
   if (key == ' ') {
     background (222,36,85);
   } 
 }

