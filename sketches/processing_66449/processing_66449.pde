
int posX;
int posY;
int state;

void setup() {
  size(500, 500);
  posX = 25;
  posY = 125;
  
  noStroke();
  smooth();
  
  state = 0;
}

void draw() {
  background(45, 0, 0);
  fill(0);
  rect(0, 100, 50, 50);
  rect(400, 100, 50, 50);
  rect(0, 400, 50, 50);
  rect(400, 400, 50, 50);
  
  fill(255);

  if (state == 0) {
    if (mousePressed && mouseX > 0 && mouseX < 50 && mouseY > 100 && mouseY < 150) {
      state = 1;
    }
  }

  // TL -> TR
  if (state == 1) {
    posX = posX + 5;
    if (posX > 425 && posX < 550) {
      state = 2;
    }
  }
  
  // TR -> BL
  if (state == 2) {
    posX -= 7;
    posY += 5;
    
    if (posX < 20 && posY > 420) { 
      state = 3;
    }
  }

  // BL -> BR
  if (state == 3) {
    posX += 5;
    
    if (posX > 425) { 
      state = 4;
    }
  }
  
  // BLACKOUT
  if (state == 4) {
    background(0);
    fill(0);
  }
  
 
  ellipse(posX, posY, 20, 20);
  }
