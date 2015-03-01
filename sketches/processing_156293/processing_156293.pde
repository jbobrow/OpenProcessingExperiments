
int change = 5;
int posX = 500;
int posY = 300;

void setup() {
  size(800, 600);

  rectMode(CENTER);
}

void draw(){
  background(255);
  drawR();
  drawE();
  drawP();
}

void drawP(){
  strokeWeight(10);
  point(posX, posY);
}


void drawR() {
  strokeWeight(1);
  ellipse(200, 400, 100, 100);
  
    if (mouseX >= 150 && mouseX <= 250 
    && mouseY >= 150 && mouseY <= 250
    && mousePressed) {
      fill(255, 0, 0);
      posY -= change;
   } 
  
  else {
    fill(255);
  }
  
}


void drawE() {
  strokeWeight (1);
  rect(200, 200, 100, 100);  
  
if (dist(mouseX, mouseY, 200, 400) <= 100
  && mousePressed) {
      fill(0, 255, 0);
      posY += change;
   } 
  
  else {
    fill(255);
  }
}




