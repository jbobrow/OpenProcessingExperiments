
//easing effect

float posX = 0;
float posY = 0;
float easing = 0.1;

void setup() {
  size(800, 800);
  background(173);
  noStroke();
}



void draw () {
  //  fill(279, 279, 0);
  //  rect(0, 0, width, height);
  //draw the cover transparent rect
  //  posX += (mouseX - posX) * easing;
  //  posY += (mouseY - posY) * easing;
  background(279, 279, 0);


  fill(290, 0, 200);
  for (int i = 0; i < 60; i++) {
    for (int j = 0; j < 60; j++) {

      drawShape(i, j);
    }
  }
}


void drawShape(int count, int countj) {
  pushMatrix();
  translate(posX + count * 20 + 10, posY + countj * 20 + 10);
  rotate(frameCount/30);
  if (count%3 == 0) {
    fill(100, 0, 100 );
    rect(0, 0, 25, 20);
    //    ellipse(posX/(i*0.1) + i * 0.5, posY/(i * 0.1) + i * 0.5, 190, 190);
    //  ellipse(posX, posY, 20, 20);
  }

  else if (count%3 == 1) {
    fill(0, 270, 270);
    rect(0, 0, 30, 60);
    
  }
  else {
    fill(290, 0, 200);
    rect(0, 0, 10, 40);
  }
  
  
  
  
    popMatrix();
}


