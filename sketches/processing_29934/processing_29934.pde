
float inc = 0.0;
float[] xArray;
float[] unitArray;
int numBlades = 100;
void setup() { 
  size(640, 640); 
  stroke(255, 204); 
  smooth();
  frameRate(60);
  xArray = new float[numBlades];
  unitArray = new float[numBlades];
  for (int i = 0; i < numBlades; i++) {
    xArray[i] = random(0,640);
    unitArray[i] = random (20,60);
  }
}


void draw() { 
  background(0); 
  float angle = sin((mouseX-320)/(960/PI))/4; //+ sin(mouseX/(320/PI))/10; 
  for(int i = 0; i < numBlades; i++) {
    tail(xArray[i], unitArray[i]-(mouseY/8), angle/5);
  } 
}

void tail(float x, float units, float angle) { 
  pushMatrix(); 
  translate(x, height); 
  for (float i = units; i > 0; i--) {
    strokeWeight(i/8); 
    line(0, 0, 0, -8); 
    translate(0, -8); 
    rotate(angle);
  } 
  popMatrix();
}


