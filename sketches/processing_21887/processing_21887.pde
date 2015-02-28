
int radius; // spacer
int diam; //diameter of ellipse
float xCenter; //starting x point
float yCenter; // starting y point


void setup() {
  size(400,400);
  noStroke();
  background(0);
  smooth();


  radius = 250;
  diam = 1;

  xCenter=400;
  yCenter=400;
}
void draw() {



  fill(5,219,242);
  for (float deg = 0; deg < 480; deg +=.5) {

    float angle = radians(deg);
    float xWave = xCenter + (cos(angle)*radius);
    float yWave = yCenter + (sin(angle)* radius)*(cos(angle)); // this causes the figure 8 loop
    ellipse(xWave,yWave,diam,diam);
    for(int i = 0; i < 600; i +=10) {
      ellipse(xWave-i,yWave-i,diam,diam);
      // rotates the 2nd ellipse
      pushMatrix();
      translate(300,100);
      rotate(radians(90));

      ellipse(xWave-i,yWave-i,diam,diam);
      popMatrix();


      noLoop();
    }
  }
}


