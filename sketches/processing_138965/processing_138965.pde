
color col1=#0B486B, col2=#CFF09E;
int columns = 250;
float stepX, theta, ot, fc, time, scal=1;
float[] offSets = new float[columns];
float[] offTheta = new float[columns];
boolean save = false;

void setup() {
  size(500, 500);

  stepX = width/columns;
  strokeWeight(stepX+1);

  initWaves();
  drawWaves();
  
}

void draw() {
  drawWaves();
  theta -= 0.0523;
  if (save) {
    if (frameCount%2==0 && frameCount<fc+121) saveFrame("image-####.gif");
  }  
}

void mouseReleased() {
initWaves();
}

void keyPressed() {
  fc = frameCount;
  save = true;
}

void initWaves() {
    
  float noiseVal = random(100);
  float sc = 50;
  time = random(1000);
  for (int i=0; i<columns; i++) {
    noiseVal += 0.02;
    offSets[i]= noise(sc*sin(time), sc*cos(time))*200;
    offTheta[i]= ot;
    ot += TWO_PI/columns;
    println(offSets[i]);
    time += 0.0523;
  }
}

void drawWaves() {

  for (int i=0; i<columns; i++) {
    scal = map(sin(theta+offTheta[i]), -1, 1, 0.5, 1.5);
    float x=stepX*(i+.5);
    if (i%2==0) {
      float y = height/2 - offSets[i]*scal;
      stroke(col1);
      line(x, 0, x, y);
      stroke(col2);
      line(x, y, x, height);
    } 
    else {
      float y = height/2 + offSets[i]*scal;
      stroke(col2);
      line(x, y, x, height); 
      stroke(col1);
      line(x, 0, x, y);
    }
  }
}

