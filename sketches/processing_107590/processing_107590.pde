
//Alex Lee, asl1@andrew.cmu.edu, 60-257
//Copyright Alex Lee 2013, Pittsburgh PA

color b1 = color(131, 195, 224);
color b2 = color(100, 156, 180);
color c1 = color(255, 93, 93);
color c2 = color(245, 37, 37);
color[][] cArray = {
{b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1},
{b2,b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1,b2},
{b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1},
{b2,b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1,b2},
{b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1},
{b2,b1,c2,c1,c2,b1,c2,c1,c2,b1,c2,b1,b2,b1,b2},
{b1,b2,c1,b2,c1,b2,c1,b2,b1,b2,c1,b2,b1,b2,b1},
{b2,b1,c2,c1,c2,b1,c2,c1,c2,b1,c2,b1,b2,b1,b2},
{b1,b2,c1,b2,c1,b2,b1,b2,c1,b2,c1,b2,b1,b2,b1},
{b2,b1,c2,b1,c2,b1,c2,c1,c2,b1,c2,c1,c2,b1,b2},
{b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1},
{b2,b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1,b2},
{b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1},
{b2,b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1,b2},
{b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1,b2,b1}
};

int rectSize;
int stageSize;
int borderSize = 20;

void setup() {
  size(400, 400); 
  background(c1);
  noStroke(); 
  smooth();
  frameRate(15);
  stageSize = height - borderSize * 2;
  rectSize = stageSize/cArray.length;
  fill(c2);
  rect(borderSize/2, borderSize/2, width - borderSize, height - borderSize);
}

void draw() {
  modColors();
  createGrid();
}

void modColors() {
  c1 = color(255, 93 + random(-20,20), 93);
}

void createGrid() {  
  for(int i = 0; i < cArray.length; i++) {
    for(int j = 0; j < cArray.length; j++) {
      fill(cArray[i][j]);
      rect(rectSize * j + borderSize, rectSize * i + borderSize, rectSize, rectSize);
      if(cArray[i][j] == c2) {
        fill(c1);
        ellipse(rectSize*j + rectSize/2 + borderSize, rectSize*i + rectSize/2 + borderSize, rectSize/3, rectSize/3);
      }
    }
  }
}


