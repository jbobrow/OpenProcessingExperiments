
int tranches = 20;
float v = 0.01;
float s = 20;
float rs= 0.5;
float rr = 0.2;
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
     
    
    for ( float j = 0; j < 16 ; j++) {
      float ratio = j / 16.;
      fill((1-ratio)*255,0,0);
      pushMatrix();
      
      rotate(cos(frameCount * 0.01 *j* rs) * rr * (1-ratio));
      translate(j*s*0.5,0);
      ellipse(0,0,(1-ratio)*s,(1-ratio)*s);
      popMatrix();
    }
    
    rotate(radians(tranche));
  }
   
}
 
void mousePressed() {
   

  tranches = 360/int((360/random(5,80 )));
   
  v = random(0.005,0.02);
  s = random(5,25);
   rs = random(0.2,2);
   rr = random(0.05,0.3);
}

