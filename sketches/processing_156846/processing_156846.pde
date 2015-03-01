
float posX = 0;
float posY = 0;

void setup(){
  size(600,600);
  background(#266EBC);
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(255);

  for (int i = 0; i < 90; i++) {
    for (int j = 0; j < 90; j++) {
      drawShape(i, j);
    }
  }
}

void drawShape(int counti, int countj){
  
  pushMatrix();
  
  translate(posX + counti*50+20,posY+countj*50+20);
  rotate(frameCount/float(20));
  
  fill(counti*50, countj*50, counti+countj);
  if ((counti%2 == 0 && countj%2 == 0) || (counti%2 == 1 && countj%2 == 1)) {
  scale(sin(frameCount/float(80)));
  ellipse(0,0,40,40);
  }
  
  popMatrix();
}


