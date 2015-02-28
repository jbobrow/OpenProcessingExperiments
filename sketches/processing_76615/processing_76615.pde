
void setup() {
  size(700, 750);
  background(50);
}

void draw() {
    if (mousePressed == true) {
      stroke(255,50,0);
      fill(0,50,200);
      ellipse(mouseX, mouseY, 30, 30);
      stroke(255,155,200);
      fill(200,10,50);
      ellipse(mouseY, mouseX, 25, 25);
      stroke(255,255,255);
      fill(10,220,50);
      ellipse(mouseX, mouseY, 20, 20);
      stroke(100,200,50);
      fill(0,200,0);
      ellipse(mouseX, mouseY, 10, 10);
      fill(10,10,200);
      ellipse(mouseY/3+25, mouseX/3+25, 15, 15);    
      stroke(10,10,200);
      fill(100,200,50);
      ellipse(mouseX/3+25, mouseY/3+25, 15, 15);
  }
    stroke(0,150,0);
    fill(110,50,100);
    ellipse(mouseY, mouseX, 15, 15);
    fill(0,150,0);
    stroke(255,255,255);
    ellipse(mouseY/3+25, mouseX/3+25, 5, 5);
    fill(255,255,255);
    stroke(0,150,0);
    ellipse(mouseX/3+25, mouseY/3+25, 5, 5);
    stroke(0,0,200);
    fill(0,150,0);
    ellipse(mouseX, mouseY, 10, 10);
 if (mousePressed == false) { 
    fill(110,50,100); 
  stroke(0,150,0); 
  }
}


