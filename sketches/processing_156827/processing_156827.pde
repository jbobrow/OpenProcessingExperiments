
//easing effect

float posX = 0;
float posY = 0;
float easing = 0.1;

void setup() {
  size(800, 800);
  background(120, 200, 0);
  noStroke();
}



void draw () {
//  fill(279, 279, 0);
//  rect(0, 0, width, height);
  //draw the cover transparent rect
  posX += (mouseX - posX) * easing;
  posY += (mouseY - posY) * easing;
  background(120, 120, 255);
  

  fill(120, 200, 0);
  for (int i = 0; i < 60; i++) {
    for(int j = 0; j < 60; j++) {
    drawShape(i, j);
    }
  }
}
    
  
  void drawShape(int count, int countj) {
    pushMatrix();
    translate(posX + count * 20 + 10, posY + countj * 20 + 10);
  rotate(frameCount/30);
  if(count%3 == 0) {
    fill(0, 0, 100 );
    ellipse(posX + count * 20, posY + countj * 20, 20, 20);
//    ellipse(posX/(i*0.1) + i * 0.5, posY/(i * 0.1) + i * 0.5, 190, 190);
    //  ellipse(posX, posY, 20, 20);
  }
  
  else if(count%3 == 1) {
      fill(100, 270, 270);
    ellipse(posX + count * -100, posY + countj * 20, 40, 40);
  }
    else {
      fill(200, 200, 200);
      rect(posX + count * -100, posY + countj * 20, 120, 120);
    }
    popMatrix();
  }
  


