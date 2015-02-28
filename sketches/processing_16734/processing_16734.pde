
import processing.pdf.*;

int scale= 200;

int[][] grid;

int numchances= 1;
int gap_threshhold = 3;




int landarea = 194395/scale; //  - 1
int primaryarea = 34310/scale;    // - 2
int deforestarea = 1585/scale;  //3
int otherfrstarea = 30492/scale; //4

int cellsize = 15;

int landareacount = 0;
int primaryareacount = 0;
int deforestareacount = 0;
int otherfrstareacount = 0;

int gridsize = 300;//4* int(sqrt(landarea));
boolean growforest = false;

boolean savepdf = false;


void setup() {
  size(1200,800);

  background(255);


 

  grid = new int[gridsize][gridsize];
  
  println(landarea);

  grid[15][15] = 1; // first cell
  landareacount++;

  
  smooth();
}


void draw() {
// println(landareacount + "/" + landarea);

  if ( landareacount< landarea - 100) {
    landArea(); 
    fillGaps();
  }
 else if ( landareacount < landarea ){
   fillGaps();
 }
 
 if (landareacount == landarea && growforest == false){
 
   grid[20][20] = 2; // first cell
   primaryareacount++;

   

   grid[25][25] = 4; 
   otherfrstareacount++;
   
   growforest = true;
 }
 
 if (landareacount == landarea && otherfrstareacount == otherfrstarea && growforest ==true){
   grid[10][10] = 3; 
   deforestareacount++;
 }
   
   
 
if (growforest == true){

   growCells();
   //println("hello");
 }
  
  if (savepdf) beginRecord(PDF,millis()+ "mexico.pdf" );
  
  for (int r=0; r<gridsize; r++) { // rows
    for (int c=0; c<gridsize; c++) { // columns

      if (grid[c][r] > 0) {
        fill(255);
        rect(c*cellsize,r*cellsize,cellsize,cellsize);
      }

      if (grid[c][r] == 2) {
        fill(0,255,0);
        
        hatchCellVert(c*cellsize,r*cellsize,cellsize,cellsize);
        //rect(c*gridsize,r*gridsize,gridsize,gridsize);
      }
      if (grid[c][r] == 3) {
        fill(0, 100);
        rect(c*cellsize,r*cellsize,cellsize,cellsize);
      }
      if (grid[c][r] == 4) {
        //fill(0, 100, 50);
        hatchCellHor(c*cellsize,r*cellsize,cellsize,cellsize);
        //rect(c*cellsize,r*cellsize,cellsize,cellsize);
      }
    }  
  }
if (savepdf) {
endRecord();
savepdf = false;
}  


}


void keyPressed() {

  if (key == 's') {
  savepdf= true;
  
  }
}



void addData(int numcells, int cellvalue) {

  // random locations

  for (int c=0; c<numcells; c++) { // do this once for each new cell

    int cellx = int(random(gridsize));
    int celly = int(random(gridsize));

    while ( grid[cellx][celly] != 0 ) { //  - is not equal to zero - while we have picked an occupied cell
      cellx = int(random(gridsize)); // roll again
      celly = int(random(gridsize));
    }
    grid[cellx][celly] = cellvalue; // fill it with the required value
  }
}


void landArea() {
int neighbourx=0;
int neighboury=0;
 for (int r=0; r<gridsize; r++) { // rows
   for (int c=0; c<gridsize; c++) { // columns

      if (grid[c][r] == 1) { // total land

     int whichneighbour = int(random(4));  // whichneighbour is being checked 
      if (whichneighbour == 0){ //  top neighbour
        neighbourx=0;
        neighboury = -1;
      }
      
       if (whichneighbour == 1){ //  right neighbour
        neighbourx=1;
        neighboury = 0;
      }
      
       if (whichneighbour == 2){ //  bottom neighbour
        neighbourx = 0;
        neighboury = 1;
      }
      
       if (whichneighbour == 3){ //  left neighbour
        neighbourx = -1;
        neighboury = 0;
      }

        if (landareacount < landarea) {
          if (c+neighbourx > 0 && c+neighbourx < gridsize && r+neighboury > 0 && r+neighboury < gridsize) { // are we on the grid
            if (grid[c+neighbourx][r+neighboury] == 0) { // free space, make a cell
              grid[c+neighbourx][r+neighboury] = 1;
              landareacount++; // add one to our cell counter
            }
          }
        }
      }
  }
 } 
  
}


void fillGaps(){

  int neighbourx=0;
int neighboury=0;
 for (int r=0; r<gridsize; r++) { // rows
   for (int c=0; c<gridsize; c++) { // columns
 if (grid[c][r] == 0){
        int countneighbours =0;
       neighbourx = 0;
       neighboury = -1;
        if (c+neighbourx > 0 && c+neighbourx < gridsize && r+neighboury > 0 && r+neighboury < gridsize) {
         if (grid[c+neighbourx][r+neighboury] == 1) countneighbours++;
      }
      
       neighbourx = 1;
      neighboury = 0;
        if (c+neighbourx > 0 && c+neighbourx < gridsize && r+neighboury > 0 && r+neighboury < gridsize) {
         if (grid[c+neighbourx][r+neighboury] == 1) countneighbours++;
      }
      
       neighbourx = 0;
      neighboury = 1;
        if (c+neighbourx > 0 && c+neighbourx < gridsize && r+neighboury > 0 && r+neighboury < gridsize) {
         if (grid[c+neighbourx][r+neighboury] == 1) countneighbours++;
      }
      
       neighbourx = -1;
      neighboury = 0;
        if (c+neighbourx > 0 && c+neighbourx < gridsize && r+neighboury > 0 && r+neighboury < gridsize) {
         if (grid[c+neighbourx][r+neighboury] == 1) countneighbours++;
      }
      
         neighbourx = -1;
      neighboury = -1;
        if (c+neighbourx > 0 && c+neighbourx < gridsize && r+neighboury > 0 && r+neighboury < gridsize) {
         if (grid[c+neighbourx][r+neighboury] == 1) countneighbours++;
      }
      
         neighbourx = 1;
      neighboury = 1;
        if (c+neighbourx > 0 && c+neighbourx < gridsize && r+neighboury > 0 && r+neighboury < gridsize) {
         if (grid[c+neighbourx][r+neighboury] == 1) countneighbours++;
      }
      
         neighbourx = -1;
      neighboury = 1;
        if (c+neighbourx > 0 && c+neighbourx < gridsize && r+neighboury > 0 && r+neighboury < gridsize) {
         if (grid[c+neighbourx][r+neighboury] == 1) countneighbours++;
      }
      
             neighbourx = 1;
      neighboury = -1;
        if (c+neighbourx > 0 && c+neighbourx < gridsize && r+neighboury > 0 && r+neighboury < gridsize) {
         if (grid[c+neighbourx][r+neighboury] == 1) countneighbours++;
      }
      
      if (countneighbours > gap_threshhold && landareacount < landarea) {   // more than2 neighbours so fill in this hole
      grid[c][r] = 1;
      landareacount++;
      } 
    } 
   }
 }

}

void growCells() {
      int neighbourx = 0;
      int neighboury =0;
  for (int r=0; r<gridsize; r++) { // rows
    for (int c=0; c<gridsize; c++) { // columns

      
      if (grid[c][r] == 2) { // primaryarea
      
      int whichneighbour = int(random(4));  // whichneighbour is being checked 
      if (whichneighbour == 0){ //  top neighbour
        neighbourx=0;
        neighboury = -1;
      }
      
       if (whichneighbour == 1){ //  right neighbour
        neighbourx=1;
        neighboury = 0;
      }
      
       if (whichneighbour == 2){ //  bottom neighbour
        neighbourx = 0;
        neighboury = 1;
      }
      
       if (whichneighbour == 3){ //  left neighbour
        neighbourx = -1;
        neighboury = 0;
      }
    
       // int neighbourx = int(random(3))-1; // will be -1, 0 or 1
       // int neighboury = int(random(2))-1; // will be -1, 0 or 1
        
        if (primaryareacount < primaryarea) {
          if (c+neighbourx > 0 && c+neighbourx < gridsize && r+neighboury > 0 && r+neighboury < gridsize) { // are we on the grid
            if (grid[c+neighbourx][r+neighboury] == 1) { // free space, make a cell
              grid[c+neighbourx][r+neighboury] = 2;
              primaryareacount++; // add one to our cell counter
            }
          }
        }
      }

      if (grid[c][r] == 3) { // deforestarea
 
     int whichneighbour = int(random(4));  // whichneighbour is being checked 
      if (whichneighbour == 0){ //  top neighbour
        neighbourx=0;
        neighboury = -1;
      }
      
       if (whichneighbour == 1){ //  right neighbour
        neighbourx=1;
        neighboury = 0;
      }
      
       if (whichneighbour == 2){ //  bottom neighbour
        neighbourx = 0;
        neighboury = 1;
      }
      
       if (whichneighbour == 3){ //  left neighbour
        neighbourx = -1;
        neighboury = 0;
      }
 
        if (deforestareacount < deforestarea) {
          if (c+neighbourx > 0 && c+neighbourx < gridsize && r+neighboury > 0 && r+neighboury < gridsize) { // are we on the grid
            if (grid[c+neighbourx][r+neighboury] == 4) { // free space, make a cell
              grid[c+neighbourx][r+neighboury] = 3;
              deforestareacount++; // add one to our cell counter
            }
          }
        }
      }

      if (grid[c][r] == 4) { // otherfrstarea

     int whichneighbour = int(random(4));  // whichneighbour is being checked 
      if (whichneighbour == 0){ //  top neighbour
        neighbourx=0;
        neighboury = -1;
      }
      
       if (whichneighbour == 1){ //  right neighbour
        neighbourx=1;
        neighboury = 0;
      }
      
       if (whichneighbour == 2){ //  bottom neighbour
        neighbourx = 0;
        neighboury = 1;
      }
      
       if (whichneighbour == 3){ //  left neighbour
        neighbourx = -1;
        neighboury = 0;
      }

        if (otherfrstareacount < otherfrstarea) {
          if (c+neighbourx > 0 && c+neighbourx < gridsize && r+neighboury > 0 && r+neighboury < gridsize) { // are we on the grid
            if (grid[c+neighbourx][r+neighboury] == 1) { // free space, make a cell
              grid[c+neighbourx][r+neighboury] = 4;
              otherfrstareacount++; // add one to our cell counter
            }
          }
        }
      }
    
    }
  }
}



void hatchCellVert(int xpos, int ypos, int w, int h){

  int numlines = 4;  // number of lines to draw
  float spacing = 1.0*w/numlines;
  
  for (int l=0; l<numlines; l++) {
  line(xpos+spacing*l, ypos, xpos+spacing*l, ypos+h);
  }
}

void hatchCellHor(int xpos, int ypos, int w, int h){

  int numlines = 4;  // number of lines to draw
  float spacing = 1.0*w/numlines;
  
  for (int l=0; l<numlines; l++) {
line(xpos+spacing*l, ypos+h, xpos+w, ypos+spacing*l);


  }
}






