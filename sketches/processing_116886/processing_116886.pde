
float angle = 0.0;
float offset = 60;
float scalar = 2;
float speed = 0.02;
//PImage Yosemite;
void setup() {
  //Yosemite = loadImage("Yosemite.jpg");
  //Yosemite.loadPixels();
  frameRate(1600);
  //size(Yosemite.width,Yosemite.height);
  size(1200,1200);
  background(0);
  smooth();
}
void draw(){
  translate(width/2,height/2);
  stroke(255,0,0);
  fingerprint(240,240);
  stroke(0,255,0);
  pushMatrix();
  rotate(2*PI/3);
  fingerprint(240,240);
  popMatrix();
  stroke(0,0,255);
  pushMatrix();
  rotate(-2*PI/3);
  fingerprint(240,240);
  popMatrix();
  stroke(255);
  pushMatrix();
  rotate(PI/2);
  //fingerprint(240,240);
  popMatrix();
 angle += speed;
  scalar += speed;
}
void fingerprint(int q, int w) {
  pushMatrix();
  translate(q,w);
  rotate(angle + offset);
  float x= offset + cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  //stroke(Yosemite.get(round(x),round(y)));
  ellipse(x,y,1,1);
 
  popMatrix();
}


