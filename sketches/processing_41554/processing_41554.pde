
int prevSec;
int millisRolloverTime;
int nCircles = 4;

void setup() {
  size(400, 400);
  millisRolloverTime = 0;
}

void draw() {
  smooth();
  noFill ();
  //background(255);
  fill(0);
  int H = hour();
  int M = minute();
  int S = second();

  if (prevSec != S) {
    millisRolloverTime = millis();
  } 
  prevSec = S;
  int mils = millis() - millisRolloverTime;
  
  float centerX   = 10;
  float centerY   = 10;
  float amplitude = 100.0;
  float period    = 0.003;
  float xPos = centerX + amplitude * sin(millis()*period);
  float yPos = centerY + amplitude * cos(millis()*period);
  


  for (int i=0; i< nCircles; i+=1) {
    float strokeColor = map(mils, 0, 1000, 0, 255);
    stroke (strokeColor);
    ellipse (80+80*i, 50, xPos, yPos);
  }

  for (int i=0; i< nCircles; i+=1) {
    float fillColor = map(S, 0, 60, 0, 255);
    fill (fillColor);
    ellipse (80+80*i, 150, xPos, yPos);
  } 

  for (int i=0; i< nCircles; i+=1) {
    float fillColor = map(M, 0, 60, 0, 255);
    fill (fillColor);
    ellipse (80+80*i, 250, xPos, yPos);
  }

  for (int i=0; i< nCircles; i+=1) {
    float fillColor = map(H, 0, 60, 0, 255);
    fill (fillColor);

    ellipse (80+80*i, 350, xPos, yPos);
  }
}

                
                
