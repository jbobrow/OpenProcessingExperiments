
import processing.opengl.*;

int screenSizeX = 600;
int screenSizeY = 600;
float tileSize = 5;
int gridResolutionX, gridResolutionY;
char[][] tiles;
color[][] tileColors;

Line[] lineArr = new Line[20];
int lineNum = 0;
boolean flag = false;

float cameraX = 0;
float cameraY = 0;

void setup() {
  size(screenSizeX, screenSizeY, OPENGL);
  smooth();
  cameraX = width/2.0;
  cameraY = height/2.0;
}

void draw() {
  background(255);

  camera(cameraX, cameraY, 200, width/2.0, height/2.0, 0, 0, 1, 0);
  pushMatrix();
  translate(width / 2, height / 2, -20);
  popMatrix();
  
  //println(keyCode);

  if (keyCode == 38) {//up
    cameraY = cameraY + 1;
  } 
  else if (keyCode == 40) {//down
    cameraY = cameraY - 1;
  }
  else if (keyCode == 37) {//left
    cameraX = cameraX - 1;
  }
  else if (keyCode == 39) {//right
    cameraX = cameraX + 1;
  }
  if (mousePressed && (mouseButton == LEFT)) {
    if (flag == false) {

      flag = true;
      lineArr[lineNum] = new Line(tileSize, (color)200);
      lineNum = lineNum + 1;
    }
    else {
      lineArr[lineNum-1].drawing((float)mouseX, (float)mouseY);
    }
  };

  if (lineNum > 0) {
    for (int i = 0; i < lineNum; i ++) lineArr[i].update();
  }
}

void mouseReleased() {
  if (flag == true) {
    flag = false;
  }
}

void keyReleased() { 
  //if (key == '1') activeModulsSet = 'A';
  //if (key == 'y' || key == 'Y') activeTileColor = color(0);
}


class Line {
  char[][] tiles;
  color[][] tileColors;
  int gridResolutionX, gridResolutionY;
  float tileSize;
  char activeModulsSet = 'A';
  color activeTileColor;

  Line (float tile, color colorVal) {
    tileSize = tile;
    activeTileColor = color(random(130, 200),  random(0, 30),  random(20, 80));

    gridResolutionX = round(width/tileSize)+2;
    gridResolutionY = round(height/tileSize)+2;
    tiles = new char[gridResolutionX][gridResolutionY];
    tileColors = new color[gridResolutionX][gridResolutionY];

    for (int gridY=0; gridY< gridResolutionY; gridY++) {
      for (int gridX=0; gridX< gridResolutionX; gridX++) {
        tiles[gridX][gridY] = '0';
        tileColors[gridX][gridY] = color(random(255), 0, random(255));
      }
    }
  }

  void drawing(float x, float y) {

    int gridXX = floor(x/tileSize) + 1;
    gridXX = constrain(gridXX, 1, gridResolutionX-2);
    int gridYY = floor(y/tileSize) + 1;
    gridYY = constrain(gridYY, 1, gridResolutionY-2);
    tiles[gridXX][gridYY] = activeModulsSet;
    tileColors[gridXX][gridYY] = activeTileColor;

    shapeMode(CENTER);
    for (int gridY=1; gridY< gridResolutionY-1; gridY++) {  
      for (int gridX=1; gridX< gridResolutionX-1; gridX++) { 
        char currentTile = tiles[gridX][gridY];
        if (currentTile != '0') {
          float posX = tileSize*gridX - tileSize/2;
          float posY = tileSize*gridY - tileSize/2;

          fill(tileColors[gridX][gridY]);
          noStroke();

          pushMatrix();
          translate(posX, posY);
          //rotateX(radians(30));
          //rotateY(radians(30));
          rect(0, 0, tileSize, tileSize);
          popMatrix();
        }
      }
    }
  }

  void update() {
    shapeMode(CENTER);
    for (int gridY=1; gridY< gridResolutionY-1; gridY++) {  
      for (int gridX=1; gridX< gridResolutionX-1; gridX++) { 
        char currentTile = tiles[gridX][gridY];
        if (currentTile != '0') {
          float posX = tileSize*gridX - tileSize/2;
          float posY = tileSize*gridY - tileSize/2;

          fill(tileColors[gridX][gridY]);
          noStroke();

          pushMatrix();
          translate(posX, posY);
          //rotateX(radians(30));
          //rotateY(radians(30));
          rect(0, 0, tileSize, tileSize);
          popMatrix();
        }
      }
    }
  }
}
