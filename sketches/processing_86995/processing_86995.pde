
int tranches = 20;
float v = 0.01;
float s = 20;
void setup() {
  size(400,400);
  smooth();
  frameRate(30);
  noStroke();
}

void draw() {
  background(127);
  
  translate(width/2, height/2);
  rotate(frameCount * v);
  float tranche = 360 /tranches;
  for (float i = 0; i < 360 ; i = i+ tranche) {
    
    pushMatrix();
    for ( float j = 0; j < 16 ; j++) {
      float ratio = j / 16.;
      fill((1-ratio)*255,0,0);
      ellipse(0,0,(1-ratio)*s,(1-ratio)*s);
      
      translate((1-ratio)*s,0);
      rotate(cos(frameCount * 0.01) * 0.2);
    }
    popMatrix();
    rotate(radians(tranche));
  }
  
}

void mousePressed() {
  
  tranches = 360/int((360/random(5,80 )));
  
  v = random(0.005,0.02);
  s = random(5,25);
  
}
