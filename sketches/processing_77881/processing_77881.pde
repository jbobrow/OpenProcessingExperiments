

////=================================================================
// University of Melbourne
// Master of Architecture// Natural Systems Studio// Semester 2-2012
// Student: Fernando Ghelfi
// Sketch: Emerging City

//=========================
// Based on:Cellular Automata (Gerard Vichniac Voting Rule). 
//Class based on Matt Pearson's code as seen on the book "Generative Art", and modified by Luiz Zanotello
// GUI Bar by Generative Gestaltung
/////////////////////////////////////////////////////////////////////

//=============================
import controlP5.*;
import toxi.geom.*;
import processing.opengl.*;
import processing.video.*;
MovieMaker mm;// movie maker

//=============================--------------------------Control P5

ControlP5 controlP5;

boolean showGUI = false;
Slider[] sliders;
int drawMode = 1;

//------------------------------------------------- Working variables


int sx, sy; 
float loc;
int lifeSpan;
float changeRate; // percentage for changing culture
int locXY = floor(constrain(loc, sx, sy));

Cell[][] CELLS;

int numX, numY, sumTrues, minCells;
float cellMod, maxCells, cellCount;

int cellSize = 2; //Size of the cell

int fRate = 15; //per second
int numCulture = 2; //Number of types of culture;
float density = 0.25; // (%) of total cells;
int[] sumCultures;
int[][] colors = {
  {55, 5, 255}, //blue
  {255, 255, 255}, //white
  {255, 55, 55}, // red
  {0, 0, 0}};//black

/////////////////////////////////////////////////////////////////////

void setup() {

  size(800, 600,P2D);  
  
//mm = new MovieMaker(this,width,height,"C:/Temp/Emerg62.mp4", 25, MovieMaker.JPEG, MovieMaker.HIGH);
//smooth();
  sx = width; 
  sy = height; 


  frameRate(fRate);
  numX = floor(sx/cellSize);
  numY = floor(sy/cellSize);
  sumCultures = new int[numCulture];


  restart();

  setupGUI();
}//end of setup-----------------



//===============================================
void draw() {
  //background (0);


 fill(0, 5);
 rect(0, 0, width, height);


  // CA cultures========

  sumTrues = 1;
  cellMod = cellCount*maxCells;
  //cellMod = cellMod*density;
  sumCultures = new int[numCulture];
  for (int x=0;x<numX;x++) {
    for (int y=0;y<numY;y++) {
      CELLS[x][y].calcNextState();
       CELLS[x][y].conVert();
      sumCultures[CELLS[x][y].culture]=sumCultures[CELLS[x][y].culture]+1;
      if (CELLS[x][y].state == true) {
        sumTrues++;
      }
    }
  }

  cellCount =sumTrues;

  translate(cellSize/2, cellSize/2);
  for (int x=0;x<numX;x++) {
    for (int y=0;y<numY;y++) {
      CELLS[x][y].drawMe();
     
     if (cellCount>9) {
       cellCount--;
       
     }
    }
  }


 if ((frameCount %25)==0) {
  setupLandscape();
  
  }

  // if ((frameCount %35)==0){
// saveFrame("emergcity62-###.tiff");
//}

//mm.addFrame();

  //================
  drawGUI();


}// end of draw============================




//===========
  void keyPressed() {  //MOVIEMAKER
  if (key == ' ') {  //MOVIEMAKER
    // Finish the movie if space bar is pressed  //MOVIEMAKER
    mm.finish();  //MOVIEMAKER
    // Quit running the sketch once the file is written  //MOVIEMAKER
    exit();  //MOVIEMAKER
  }  //MOVIEMAKER
}  //MOVIEMAKER

