
void setup() {
  size(600, 600);

  background(120, 190, 220);
  rectMode(CENTER);

  int centerX = width/2;
  int centerY = height/2;

  translate(centerX, centerY); 

  for (int i = 0; i < 10; i++) {
    fill(random(255), random(255), random(255));
    mandala(100 + i*25, 20, 0);
  }
   for (int i = 0; i < 4; i++) {
    fill(random(255), random(255), random(255));
    mandala(10 + i*70, 12, 1);
   }
  
}

void mandala(float r, int c, int t) {
  float theta = -PI/2;

  for (int i=0; i< c; i++) {
    pushMatrix();
    translate (cos(theta) * r, sin (theta) * r);
    
    if (t == 0) {
      ellipse(0, 0, 60, 60);
    }
    else {
       rect(0, 0, 40, 40); 
    }
    
    popMatrix();
    theta += TWO_PI/c;
    
  }
}


