
// building

color cIvy;
color cPaleGreen;
color cCreme;
color cHot;
color cBrick;

int numberBuildings;
int buildingWidth;
int buildingHeight;
color buildingColor;
color windowColor;
color windowAltColor;
int roadLevel;
int roadWidth;
int windowsLit;
int windowWidth;
int windowHeight;
int rowsWindows;
int columnsWindows;

void setup() {
  size(800, 600);
  noLoop();
  strokeWeight(5);
  roadLevel=500;
  roadWidth=35;
  windowHeight=16;
  windowWidth=15;
  cBrick=color(#8C1D04);
  cHot=color(#BF2806);
  cCreme=color(#F2E1C2);
  cPaleGreen=color(#8DA681);
  cIvy=color(#3F4036);
}

void draw() {
  // call makeRoad
  background(cIvy);
  makeRoad();
  // set building location
  // randomize
  numberBuildings=int(random(15, 42));

  // begin construction!

  for (int n=0;n<numberBuildings;n++) {
    
    
    buildingHeight=int(random(100, 450));
    buildingWidth=int(random(60, 180));
    windowHeight=int(buildingHeight/random(12,17));
    windowWidth=int(buildingWidth/random(12,17));
    rowsWindows=int(random(6, 15));
    columnsWindows=int(random(4, 12));
    windowsLit=int(random(50, 100));
    pushMatrix();
    translate(int(random(buildingWidth, width-buildingWidth)), roadLevel);
    // make building
    stroke(0);
    if (random(0,1)>0.5) {
      fill(cBrick);
    } else {
      fill(cPaleGreen);
    }
    makeBuilding();
    popMatrix();
  }
}

  void makeRoad() {
    // presumes no translation!
    fill(32);
    rect(0, roadLevel, width, roadLevel+roadWidth);
  }

void makeBuilding() {
  //draw building 
  int buildStart=-buildingWidth/2;
  rect(buildStart, 0, buildingWidth, -buildingHeight);

  // calculate spacing
  float totalWinHoriz=columnsWindows*windowWidth;
  float totalMarginHoriz=buildingWidth-totalWinHoriz;
  float horizMargin=totalMarginHoriz/columnsWindows;

  float totalWinVert=rowsWindows*windowHeight;
  float totalMarginVert=buildingHeight-totalWinVert;
  float vertMargin=totalMarginVert/rowsWindows;
  
  //draw windows
  noStroke();
  for (int row=0;row<rowsWindows;row=row+1) {
    float rowLoc=(row*(windowHeight+vertMargin))+vertMargin/2;
    for (int window=0;window<columnsWindows;window++) {
      float winLoc=(window*(windowWidth+horizMargin))+horizMargin/2;
      pushMatrix();
      translate(buildStart, 0);
      
      // window lights on or off?
      if (random(0,100)<windowsLit) {
        fill(cHot);
      } else {
        fill(cCreme);
      }
      
      if (random(0,100)>windowsLit) {
        fill(32);
      }
      
      // draw the window
      rect(winLoc, -rowLoc, windowWidth, -windowHeight);
      popMatrix();
    }
  }
}


