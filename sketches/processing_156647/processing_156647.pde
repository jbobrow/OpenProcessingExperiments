

float posX = 0;
float posY = 0;
float easing = 0.1;

void setup() {
  size(500, 500);
  background(255);
  noStroke();
  rectMode(CENTER);
}

void draw() {
  //draw the cover transparent rect
  //fill(255, 100);
  //rect(0, 0, width, height);
  background(255);
  //  posX += (mouseX - posX) * 0.01;
  //  posX += (mouseY - posY) * 0.01;

  //  posX += (mouseX - posX) * easing;
  //  posY += (mouseY - posY) * easing;

  //posX = posX + (mouseX - posX)*1;
  //posX = posX + (mouseX - posX)*0.5;  

  for (int i = 0; i < 20; i++) {
    for (int j=0; j<20; j++) {
      drawShape(i, j);    

      rotate(frameCount/2);
    }
  }
}

void drawShape(int count, int countj) {
  pushMatrix();
  translate(posX + count * 20 + 10, posY + countj *20 +10);


  //if (count%2 == 0) {
  //ellipse(posX/(i*0.1) + i * 20, posY/(i*0.1)+i*20, 20, 20);
  fill(count);
  ellipse(posX + count * 20 + 10, posY + countj *20 +10, 20, 20);
  //} else {
  //  rect(0, 0, 20, 20);
  //}
  popMatrix();


}





