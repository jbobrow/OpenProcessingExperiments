

int speed=10;

void setup() {
  size(400,400);
  noStroke();
  smooth();
}

void draw(){
   background(0);
   frameRate(12);
   cropCircle();
}

void cropCircle () {
  for (int i=200; i>=0; i=i-10) {
    float r= random(255);
    float g= random(255);
    float b= random(255);
    float x= random(350);
    float y= random(350);

    fill(r,g,b);
    ellipse(x,200,i,i);
  }
}









