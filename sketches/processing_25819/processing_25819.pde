

boolean gradient = false;

void setup() {
  size(400,400);
  smooth();
  fill(0);
  noStroke();
  colorMode(HSB,100);
}

void draw() {
  background(0,0,100); // weisser Hintergrund
  float stepSize = 20;
  for(int x=0; x<=width; x+=stepSize) {
      for(int y=0; y<=height; y+=stepSize) {
        float distanceToMouse = dist(x,y,mouseX,mouseY);
        float ellipseDiameter = distanceToMouse*0.2;
        if (gradient) fill(0,0,100-distanceToMouse*0.3);
        else fill(0);
        ellipse(x,y,ellipseDiameter,ellipseDiameter);
      }
  }
   
}

void mousePressed() {
    gradient = !gradient;
}

