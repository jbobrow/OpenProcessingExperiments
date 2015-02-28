
//Copyright Eric Mackie, September 2011
float xPos;
float yPos;
float ampx;
float ampy;
float per;
float pery;

void setup() {
  size(400, 400);
  smooth();
}



void draw() {
  background(0);
  noStroke();
  for (float i=0; i<=.01; i=i+.002) {
    for (float iy=0; iy<=.01; iy=iy+(random(0,.001))) {
      ampx = 200;
      ampy=100;
      per=i;
      pery=iy;
      xPos=width/2 + ampx* sin(millis()*per);
      yPos=height/2 +random(0,2*ampy)* cos(millis()*pery);
      fill(255, 255, 0, 150);
      ellipse(xPos, yPos, 25, 25);
      fill(255, 255, 0, random(0, xPos/10));
      ellipse(xPos, yPos, 40, 40);
    }
  }
}

