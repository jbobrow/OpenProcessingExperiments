
float theta, scal, ang, angle = 6, flowerSize = 250, stepSize =4;
int steps = 55, fc;
float[] a = new float[steps];
boolean[] show = new boolean[steps]; 
boolean save = false;

void setup() {
  size(400, 400);
  rectMode(CENTER);

  for ( int i = 0; i < steps; i++ ) {
    a[i] = ang;
    ang += TWO_PI/steps;
    if (random(1)>.9) {
      show[i] = true;
    } else {
      show[i]=false;
    }
  }
}

void draw() {
  background(0);
  translate( width/2, height/2 );
  flowerSize = 250;
  for ( int i = 0; i < a.length; i++ ) {
    if (show[i]) {
      fill(#FFE600, 100);
      //scal = map(sin(theta*2), -1, 1, 1, 1.3);;
    scal = 1.0;  
  } else {
      fill(255/steps*i);
      scal = 1.0;
    }
    float wiggle = map(sin(theta+TWO_PI/steps*i), -1, 1, -20, 20);
    pushMatrix();
    rotate(a[i]+radians(wiggle));
    rect( 0, 0, (flowerSize - (stepSize * i))*scal, (flowerSize - (stepSize * i))*scal);
    popMatrix();
  }
  theta += .0523;

  if (save) {
    if (frameCount%2==0 && frameCount < fc + 121) saveFrame("image-###.gif");
  }
}

void keyPressed() {
  fc = frameCount;
  save = true;
}

