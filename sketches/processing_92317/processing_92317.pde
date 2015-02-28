
// comments
// comments
void setup() {
  size(400, 400);
  smooth();
  strokeWeight(5);
}

void draw() {
  
  //background(175, 250, 22);
  stroke(10, 20, 30);
  fill(175, 250, 22);
  ellipse(200, 200, 300, 300); //face
  curve (200, 180, 220, 200, 220, 220, 200, 280); //nose
  fill(180, 190, 124);
  ellipse(250, 150, mouseX/3P, mouseY/3P); //right eye
  ellipse(150, 150, mouseX/3P, mouseY/3P); //right eye
  
  stroke(140, 20, 30);
  //curve (100, 250, 175, 280, 225, 280, 300, 250); //mouth
  rect(179, 260, 50, 20, 10, 10, 5, 5);
}



