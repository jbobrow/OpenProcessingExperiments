
//easing effect

float posX = 0;
float posY = 0;
float easing = 0.1;

void setup() {
  size(800, 800);
  background(255, 0, 0);
  noStroke();
}



void draw () {
//  fill(279, 279, 0);
//  rect(0, 0, width, height);
  //draw the cover transparent rect
  posX += (mouseX - posX) * easing;
  posY += (mouseY - posY) * easing;
  background(255, 0, 0);
  

  fill(255, 0, 0);
  for (int i = 0; i < 60; i++) {
    for(int j = 0; j < 60; j++) {
    drawShape(i, j);
    }
  }
}
    
  
  void drawShape(int count, int countj) {
    pushMatrix();
    translate(posX + count * -20 + 10, posY + countj * 30 + 30);
   
    if(count%5 == 0) {
    fill(255, 0, 0 );
    ellipse(posX + count * -220, posY + countj * 30, 30, 30);
//    ellipse(posX/(i*0.1) + i * 0.5, posY/(i * 0.1) + i * 0.5, 190, 190);
    //  ellipse(posX, posY, 20, 20);
  }
  
  else if(count%5 == 1) {
      fill(247, 5, 5);
    rect(posX + count * -300, posY + countj * 20, 40, 40);
  }
  
  if(count%5 == 2) {
    fill(245, 68, 68 );
    ellipse(posX + count * 2, posY + countj * 100, 100, 100);
  }
  
   if(count%4 == 3) {
    fill(255 );
    ellipse(posX + count * 2, posY + countj * 100, 100, 100);
  }
    else {
      fill(68, 245, 203);
      rect(posX + count * -300, posY + countj * 20, 120, 120);
    }
    popMatrix();
  }
  


