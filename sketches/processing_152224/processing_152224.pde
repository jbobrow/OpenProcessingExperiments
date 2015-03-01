
float ang = 0;
float znoise;
float what=20;

void setup() {
  size(600, 400);
  background(0);
  noStroke();
  fill(255, 50);
  znoise = random(10);
}

void draw() {
  ang-=0.0003;
  znoise+=0.051;
  //fill(0,20);
  //rect(0,0,width,height);
  fill(255, 10);
  background(0);
  translate(width/2, height/2);
  drawSpiral(ang, znoise);
  //what = 30*mouseX/width;
  what+=0.0006783;
}

void drawSpiral(float angle, float z) {
  pushMatrix();
  rotate(angle);
  float rad=0;
  while (rad<width/2) {
    float x=rad*cos(rad*what); 
    float y =rad*sin(rad*what);
    pushMatrix();
    translate(x, y);
    scale(noise(x/100, y/100, znoise)*3+1);
    float r = sqrt(x*x+y*y)/12+2;
    ellipse(0, 0, r, r);
    popMatrix();
    rad+=0.23;
  }
  popMatrix();
}



