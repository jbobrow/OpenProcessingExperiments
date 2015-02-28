
int num = 12;
int radiusKreis = 140;

int s = 0;

void setup() {
  size(400,400);
  rectMode(CENTER);
  
}

void draw() {
  background(255);
  translate(width/2, height/2);
  //translate(20, 70);
  for(int i = 0; i < num; i++) {
    pushMatrix();
      rotate(TWO_PI / num * i);
      translate(0, radiusKreis);
      rect(0,0,10,10); 
    popMatrix();

  }
  
  s = second();
  
  pushMatrix();
     rotate(TWO_PI / 60 * s);
     line(0,0,0, -120);
  popMatrix();
  
  
}
