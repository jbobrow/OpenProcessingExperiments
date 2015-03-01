
int margin;
float leng, ecart;
void setup() {
  size(600, 600);
  background(0);
  smooth(8);
  margin=50;
  leng=200;
  rectMode(CENTER);  
  noStroke();
}
void draw() {
  leng=mouseX/10;
  ecart=(width-2*margin)/5;
  background(0, 255, 255); 

  noStroke();
  
  for (int i=0; i<6; i++) {
    for (int j=0; j<6; j++) {
      pushMatrix();
      translate(margin+i*ecart, margin+j*ecart);
      rotate(frameCount/60);
      fill(255, 0, 128);
      rect(0, 0, width/10, width/10);
      popMatrix();
      pushMatrix();
      translate(margin+i*ecart, margin+j*ecart);
      fill(255, 140, 0);
      rect(1.2*width/25, 1.2*width/25, leng, leng);
      rect(-1.2*width/25, 1.2*width/25, leng, leng);
      rect(-1.2*width/25, -1.2*width/25, leng, leng);
      rect(1.2*width/25, -1.2*width/25, leng, leng);
      popMatrix();      
    }
  }
}




