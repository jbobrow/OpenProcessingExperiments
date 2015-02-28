
float t = 0;
float theta = 0;
float speed = 0.0003;
float spacing = 2;
float amp = PI/3;
float g = 9.8;
float a = (width/2-20)/spacing;


void setup() {
  size(400, 400);
  background(255);
  smooth();
  noStroke();
  fill(0);
}

void draw() {
  translate(width/2, height/2);
  background(255);
  

  for (int i = 0; i<width/2 - 10; i+=spacing) {
    theta =amp*cos(sqrt(g/i)*t);
    pushMatrix();
      rotate(theta);
    //line(0, 0, 0, i);
    translate(0,i);
    ellipse(0,0,(230-i)/12,(230-i)/12);
    popMatrix();
    t+=speed;
  }
  pushMatrix();
  rotate(2*PI/3);
  for (int i = 0; i<width/2 - 10; i+=spacing) {
    theta = amp*cos(sqrt(g/i)*t);
    pushMatrix();
      rotate(theta);
    //line(0, 0, 0, i);
    translate(0,i);
    ellipse(0,0,(230-i)/12,(230-i)/12);
    popMatrix();
    t+=speed;
  }
  rotate(2*PI/3);
  for (int i = 0; i<width/2 - 10; i+=spacing) {
    theta = amp*cos(sqrt(g/i)*t);
    pushMatrix();
      rotate(theta);
    //line(0, 0, 0, i);
    translate(0,i);
    ellipse(0,0,(230-i)/12,(230-i)/12);
    popMatrix();
    t+=speed;
  }
  popMatrix();
if (t > 150 || t < -150){
    speed=-speed;
   }
   //filter(BLUR,1);
  }
   



