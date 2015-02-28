
void setup() {
  size (400, 400);
  background(220);
  smooth();
}

void draw () {
  stroke (0);
  
  //sbianca lo sfondo
  if (mousePressed) {
    noStroke();
    fill(255, 10);
    rect(0, 0, 400, 400);
  }
  
  //speroni
  fill(0);
  strokeWeight(10);
  line( mouseX, mouseY, mouseX + 60, mouseY + 60);
  line( mouseX, mouseY, mouseX - 60, mouseY - 60);
  line( mouseX, mouseY, mouseX - 60, mouseY + 60);
  line( mouseX, mouseY, mouseX + 60, mouseY - 60);
  line( mouseX, mouseY, mouseX + 0, mouseY + 80);
  line( mouseX, mouseY, mouseX + 0, mouseY - 80);
  line( mouseX, mouseY, mouseX + 80, mouseY + 0);
  line( mouseX, mouseY, mouseX - 80, mouseY + 0);
  
  
//cursore morbido 
  noStroke ();
  fill(50);
  ellipse(mouseX, mouseY, 60, 60);
}      


