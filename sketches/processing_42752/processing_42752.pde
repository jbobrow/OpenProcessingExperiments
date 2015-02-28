
/* 
 Daniel C. Young
 Pulsating
 10/14/2011
 */

float ang=0.0;
float easing=0.03;
float easeX=0.0;
float theta = 0.0;

void setup(){
  size(500,500);
  smooth();
}

void draw(){
  background(255);
  easeX += (mouseX-easeX) * easing;
  float amp = map(easeX,0,width,0.5,2.0);
  float freq = map(easeX,0,width,0.02,0.20);
  pulsate(freq, amp);
}

void pulsate(float _freq, float _amp){
  ang += _freq;
  theta  = 3 + (_amp * sin(ang));

  pushMatrix();
  translate(width/2,height/2);
  scale(theta);
  noStroke();
  fill(240,20,10,200);
  ellipse(0,0,100,100);
  popMatrix();
}

