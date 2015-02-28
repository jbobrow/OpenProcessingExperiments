
/*
HEXAGON COLOR GRID
Author: Martin Melcher
Comment: Actually these are only "Fake Hexagons" 
build by multiple Layers of overlaying Parallelograms.
*/

Hexagon[][][] grid;

int gridSize = 64;
float gridSizeW = sin(radians(60))*gridSize;

int cols = 16;
int rows = 18;
int zAxis = 8;
int target;

//int bMode = 1;

void setup() {
  size(720, 480, P2D);
  background(255);
  noStroke();
  //stroke(0);
  //strokeWeight(0.1);
  
  frameRate(60);
  randomSeed(zAxis);
  colorMode(HSB, 360, 100, 100, 100);
  smooth();
  grid = new Hexagon[cols][rows][zAxis];
  setupGrid(180,360);
}

void draw() {
  //Geht nur in JAVA Umgebung
  //blendMode(bMode);
  background(0, 0, 100, 100);
  translate(0, 0);

  /*
  float mX = mouseX/2;
  float mY = mouseY/2;
  translate(-mX, -mY);
  */

  //shift Row up
  translate(0, -50);
  for (int i=0; i < cols; i++) {
    for (int j=0; j < rows; j++) {
      for (int k=0; k < zAxis; k++) {
        pushMatrix();
        translate(gridSizeW*i, gridSize*j*0.5);
        grid[i][j][k].drawHex();
        grid[i][j][k].update();
        popMatrix();
      }
    }
  }
  // For Hi-Res Rendering Set NoLOOP
  //noLoop();
}

void setupGrid(int colorRangeMin, int colorRangeMax) {
 int crMin = colorRangeMin;
 int crMax = colorRangeMax;
 for (int i=0; i < cols; i++) {
    for (int j=0; j < rows; j++) {
      for (int k=0; k < zAxis; k++) {
       grid[i][j][k] = new Hexagon(gridSize, int(random(crMin, crMax)), int(random(0, 5))); 
      }
    }
  } 
}

void keyPressed() {
   switch(key) {
     case('1'): setupGrid(0,0); break;
     case('2'): setupGrid(90,90); break;
     case('3'): setupGrid(180,180); break;
     case('4'): setupGrid(270,270); break;
     case('5'): setupGrid(0,90); break;
     case('6'): setupGrid(90,180); break;
     case('7'): setupGrid(180,270); break;
     case('8'): setupGrid(270,360); break;
     case('9'): setupGrid(0,180); break;
     case('0'): setupGrid(180,360); break;
     
     case('y'): zAxis = 1; setupGrid(180,360); break;
     case('x'): zAxis = 2; setupGrid(180,360); break;
     case('c'): zAxis = 4; setupGrid(180,360); break;
     case('v'): zAxis = 8; setupGrid(180,360); break;
     
     /*
     case('q'): bMode = 1; break;
     case('w'): bMode = 2; break;
     case('e'): bMode = 3; break;
     case('r'): bMode = 4; break;
     case('t'): bMode = 5; break;
     case('z'): bMode = 6; break;
     case('u'): bMode = 7; break;
     case('i'): bMode = 8; break;
     case('o'): bMode = 9; break;
     case('p'): bMode = 0; break;
    */ 
     
   }
   //redraw();
}


class Hexagon {

  float a, b, c;
  int form;
  int rColor;
  float sideLength;
  int life;

  int counter = 1;

  int index = 1;

  Hexagon(float _sideLength, int _rColor, int _count) {

    c = _sideLength;
    a = c/2;
    b = sin(radians(60))*c;
    rColor = _rColor;

    form = _count;
    int life = 50+int(random(0, 50));
  }


  void drawHex() {  

    switch(form) {
      //links1
    case 0:
      beginShape();
      fill(rColor, 100, 90, 33);
      vertex(0, 0);
      vertex(b/2, 0.25*c);
      vertex(b/2, 0.75*c);
      vertex(0, 0.5*c);
      endShape();
      break;
      // links2
    case 1:
      beginShape();
      fill(rColor, 100, 90, 33);
      vertex(0, 0.5*c);
      vertex(b/2, 0.25*c);
      vertex(b/2, 0.75*c);
      vertex(0, c);
      endShape();
      break;
      //rechts1
    case 2:
      beginShape();
      fill(rColor, 100, 90, 33);
      vertex(b, 0);
      vertex(b/2, 0.25*c);
      vertex(b/2, 0.75*c);
      vertex(b, 0.5*c);
      endShape();
      break;
      //rechts2
    case 3:
      beginShape();
      fill(rColor, 100, 90, 33);
      vertex(b, c*0.5);
      vertex(b/2, 0.25*c);
      vertex(b/2, 0.75*c);
      vertex(b, c);
      endShape();
      break;
      //mitte
    case 4:
      beginShape();
      fill(rColor, 66, 90, 50);
      vertex(0, c*0.5);
      vertex(b/2, 0.25*c);
      vertex(b, c*0.5);
      vertex(b/2, 0.75*c);
      endShape();
      break;
    }
  }

  void update() {
    life = int(random(-100, 100))+count(0, 100);
    fill(0, life);

    if (life == 100) {
      form++;
      if (form > 5) {
        form = 0;
      }
    }

    //println(life);
  }

  int count(int rangeDown, int rangeUp) {
    counter = counter + index;
    if (counter == rangeUp) {
      index = -1;
    }
    if (counter == rangeDown) {
      index = 1;
    }
    return counter;
  }
}
