
float mx, my;
float radius = 25; 
float angleStep = 6;
int numPeriod = 4; 
float period; 

void setup() {
  size(600, 600);
  background(255);
  //colorMode(HSB, 360, 100, 100);
  //frameRate(30);
  mx = width/2; 
  my = height/2;

  period = 360 / ( numPeriod * angleStep);
}

void draw() {
  background(0);

  int counter = 1;    
  for (float angle = 0; angle <= 360; angle += angleStep) {
    drawSin(angle, counter);
    counter++;
  }
}

void drawSin(float _angle, int _count) {
  float growth = 0; 
  float age = ((frameCount + _count) % (int) period ) / period; 
  float eSize = 10 * sin(age);   

  noFill();
  stroke(lerp(0, 128, age), lerp(255, 0, age));
  pushMatrix();
  translate(mx, my); 
  rotate(radians(_angle));
  for (int i = 0; i < width; i++) {         
    float x = i; 
    growth += 0.01; 
    float y = - growth * sin(radians(6*x)) * radius; 

    ellipse(x, y, eSize+growth*2, eSize+growth*2);
  }
  popMatrix();
}

void keyReleased() {
  if ( key == CODED ) {
    if (keyCode == UP) {
      numPeriod = constrain(++numPeriod, 1, 8);
      period = 360 / ( numPeriod * angleStep);
    }
    if (keyCode == DOWN) {
      numPeriod = constrain(--numPeriod, 1, 8);
      period = 360 / ( numPeriod * angleStep);
    }
  }
}



