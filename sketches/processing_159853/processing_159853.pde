
//Exploring 2D Noise
//Using 2D Noise for various grid experiments
//Based on Ex 5.2 from Generative Art book by Matt Pearson
//Updated to react to mouse movement (X & Click)
//Use 1-5 to move between different modes
//Use 6-7 to see contrast between random & noise
//Move mouse (X) to change the element size/density
//Use "R"/Click to regenerate pattern
//Use [Space] to save screen
//Created by @rasagy

float xstart, xnoise, ynoise;
int cellSize=50; //Different approach for all aspect ratios
float xCount, yCount;
int drawingMode=6;

void setup() {
  size(800, 500);
  xCount = width/cellSize;  yCount = height/cellSize;   
  smooth();
  colorMode(HSB, 255);
  background(200);
  xstart=random(10);
  xnoise=xstart;
  ynoise=random(10);
  for (int y=0; y<=height; y+=cellSize) {
    ynoise+=0.1;
    xnoise=xstart;
    for (int x=0; x<=width; x+=cellSize) {
      xnoise+=0.1;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  //  println(noiseFactor);
  switch(drawingMode)
  {
  case 1:
    //    noStroke();
    float len = (cellSize)*noiseFactor*2;
    rect(x, y, len, len);
    break;

  case 2:
    pushMatrix();
    translate(x, y);
    rotate(noiseFactor*radians(360));
    stroke(0, 150);
    line(0, 0, cellSize, cellSize);
    popMatrix();
    break;

  case 3:
    noStroke();
    float r=cellSize*noiseFactor*2;
    ellipse(x, y, r, r);
    break;

  case 4:
    noStroke();
    fill(map(noiseFactor, 0.25, 0.75, 0, 255), 200, 200, 100);
    float r=cellSize*noiseFactor*3;
    ellipse(x, y, r, r);
    break;

  case 5:
    noStroke();
    fill(map(noiseFactor, 0.25, 0.75, 0, 255), 200, 200);
    rect(x, y, cellSize, cellSize);
    break;

  case 6:
    noStroke();
    if(x>=width/2-cellSize/2)
      fill(map(noiseFactor, 0.25, 0.75, 0, 255), 200, 200, 100);
    else
      fill(map(random(1), 0, 1, 0, 255), 200, 200, 100);
    float r=cellSize*noiseFactor*3;
    ellipse(x, y, r, r);
    break;
    
  case 7:
    noStroke();
    if(x>=width/2-cellSize/2)
      fill(map(noiseFactor, 0.25, 0.75, 0, 255), 200, 200);
    else
      fill(map(random(1), 0, 1, 0, 255), 200, 200);
    rect(x, y, cellSize, cellSize);
    break;
  }
}

void mousePressed() {
  cellSize=ceil(map(mouseX, 0, width, 25, 1))*4;
  setup();
}
void mouseMoved() {
//  mousePressed(); //Let's not kill the browser
}

void keyPressed() {
  boolean flag=false;
  if (key == '1')
    drawingMode = 1;
  else if (key == '2')
    drawingMode = 2;
  else if (key == '3')
    drawingMode = 3;
  else if (key == '4')
    drawingMode = 4;
  else if (key == '5')
    drawingMode = 5;
  else if (key == '6')
    drawingMode = 6;
  else if (key == '7')
    drawingMode = 7;
  else if (key == 'r' || key == "R") { ;}      
  else if (key == ' ')
    saveFrame("###.png");
  else flag=true;
  
  if(!flag) mousePressed();
}

