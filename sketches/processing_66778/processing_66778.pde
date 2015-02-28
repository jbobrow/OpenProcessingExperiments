
void setup() {

  size(500, 500);
  background(186, 125, 203);
  noStroke();
  frameRate(120);
  smooth();
}

void draw() {
}

void mouseDragged() {  
  ellipse (mouseX, mouseY, 5, 5);
}


void mouseClicked() {
  fill(random(255), mouseX,mouseY);

}

void keyPressed() {
  if (key == 'e') 
    background(186, 125, 203);

  if (key == 'w') 
  fill(255);
  ellipse(mouseX,mouseY,10,10);
  
  if (key == 'b') 
  fill(0);
  ellipse(mouseX,mouseY,10,10);

}

