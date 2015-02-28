
//Fading Sticks and Balls

void setup() {
  background(5);
  size(300, 300);
}

void draw() {
  fill(5, 20);
  rect(0, 0, width, height);
}

void mousePressed() {
  stroke(random(255), random(255), random(221));
  
  line(150, 150, mouseX+50, mouseY+50);
  ellipse(mouseX+50, mouseY+50, 50, 50);

  line(150, 150, mouseX+60, mouseY+60);
  ellipse(mouseX+60, mouseY+60, 50, 50);

  line(150, 150, mouseX+70, mouseY+70);
  ellipse(mouseX+70, mouseY+70, 50, 50);

  line(150, 150, mouseX+80, mouseY+80);
  ellipse(mouseX+80, mouseY+80, 50, 50);

  line(150, 150, mouseX+40, mouseY+40);
  ellipse(mouseX+40, mouseY+40, 50, 50);
}



