
// parameterized
// mjmurdock 2012
 
 
 
//global variables ///////////////////////////
int numArray = 100;
float[] colorR = new float[numArray];
float[] colorG = new float[numArray];
float[] colorB = new float[numArray];
float[] theta = new float[numArray];
float[] brancher = new float[numArray];
float[] bigness = new float[numArray];
 
 
 
float t_angle = 0.0;
 
 
//SETUP /////////////////////////////////////
void setup() {
  size(500, 500);
  background(255);
  smooth();
 
  // FILL ARRAYS ////////////////////////////
  for (int i=0; i < 100; i++) {
    colorR[i] = random(0, 255);
    colorG[i] = random(20, 50);
    colorB[i] = random(0, 150);
    theta[i] = radians(random(-30, 30));
    brancher[i] = random(0, 10);
    bigness[i] = random(1, 10);
  }
 
 
  for (int i=0; i<numArray; i+=5) {
    for (int j = 0; j <numArray; j+=5) {
    pushMatrix();
     
    translate(25, 25);
    translate(10*i, 10*j);
    //    bugs();
    scale(.35);
    legs(i*(random(2,50)), random(0,3));
    wings(i*j);
    body(random(300), 40, 100);
 
 
    popMatrix();
    }
  }
}
 
//DRAW /////////////////////////////////////
void bugs() {
 
  strokeWeight(5);
  stroke(colorR[40], colorG[50], colorB[10]);
  ellipse(0, 0, 10, 10);
}
 
 
 
 
void body (float xpos, float ypos, float r)
{
  pushMatrix();
  rotate(radians(90));
  scale(.3);
 
  float mx = map(mouseX, width/3, 0, 0.05, 0.6);
  mx = constrain(mx, 0.05, 0.6);
  float a = map(sin(t_angle), -1, 1, 0.5, 2.5);
 
  noStroke();
  fill(random(0, 255), random(60, 100), random(200, 255), 100);
 
 
  beginShape();
  for (int i=0; i<360; i++) {
 
    float x = cos( radians(i) ) *r;
    float y = sin( radians(i) ) * pow(sin(radians(i)/2), a) *r;
 
    vertex(x, y);
  }
  endShape();
  popMatrix();
  t_angle+=mx;
  ellipse(0, -25, 30, 30);
}
 
void wings(float ang) {
  noStroke();
   fill(random(0, 255), random(60, 100), random(0, 255), 150);
 
 
  pushMatrix();
  translate(10, 0);
  rotate(-radians(ang));
  ellipse(0, 0, 20, 70);
  popMatrix();
 
  pushMatrix();
  translate(-10, 0);
  rotate(radians(ang));
  ellipse(0, 0, 20, 70);
  popMatrix();
}
 
void legs(float ang, float numLegs) {
  stroke(0, 100);
  for (int i = 0; i<numLegs; i++) {
 
    pushMatrix();
    translate(0, i*10);
    strokeWeight(2);
    rotate(ang);
    line(0, 0, 0, 30);
 
    translate(0, 30);
    rotate(-ang);
    line(0, 0, -10, 50);
    popMatrix();
 
    pushMatrix();
    translate(0, i*10);
    strokeWeight(2);
    rotate(-ang);
    line(0, 0, 0, 30);
 
    translate(0, 30);
    rotate(ang);
    line(0, 0, 10, 50);
    popMatrix();
  }
  noStroke();
}


