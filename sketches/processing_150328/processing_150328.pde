
float xstart, ystart, squaresize, squaresizeX, time, d;
int delay = 60;
int density = 75; //more is less
int siatasize = 7;

void setup() {
  size(800, 600, P3D);
  background(0);
  xstart = random(10);
  ystart = random(10);
  squaresize = height/siatasize;
  squaresizeX = width/siatasize;
  smooth(8);
}
 
void draw() {
  time = map(frameCount, 0, delay, 0, 1);
  background(0);
  noStroke();
 
  //stroke(0);
  fill(255, 80);
 
  xstart += 0.02;
  ystart += 0.01;
 
  translate(width/2, height/2);
  float ynoise = ystart;
  for (float y = -squaresize; y <= squaresize; y+=density) {
    ynoise += 0.02;
    float xnoise = xstart;
    
    for (float x = -squaresizeX; x <= squaresizeX; x+=density) {
      colorMode(HSB, 255, 100, 100);
      d = map(sin(0.02*dist(width/2+x, width/2+y, width/2, height/2) - TWO_PI*time), -1, 1, .5, 1);
      float f = map(sin(0.02*dist(width/2+x, width/2+y, width/2, height/2) - TWO_PI*time), -1, 1, 0, 150);
      //text(str(int(f)),-350,-10+x*3,100,100);  // wyswietl zmienna
      //rotate(PI*7.0);
      //fill(int(f), 90, 100);
      noFill();
      strokeWeight(3);
      stroke(int(f), 90, 100);
      xnoise += 0.02;
      drawPoint(x, y, noise(xnoise, ynoise));
      colorMode(RGB);
    }
  }
}
 
void drawPoint(float x, float y, float noiseFactor) {
 
  pushMatrix();
  translate(x * noiseFactor * 4, y * noiseFactor * 4);
  float edgeSize = noiseFactor * 22;
  ellipse(0, 0, edgeSize*d*10, edgeSize*d*10);
  float r = 0.0;
  r += 0.01 + abs(sin(frameCount/50)/50);
  rotateY( mouseX*0.01+r);
  rotateX( mouseY*0.01+r);
  box(7*edgeSize*3*d);
  sphereDetail(2);
  sphere(150);
  strokeWeight(2);
  float mouseposmax=map(mouseX,0,800,0,6);
  sphereDetail(4);//+int(mouseposmax));
  sphere(80);
  popMatrix();
}

