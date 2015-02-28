
PFont myFont; 
//positions of x, y are stored in [][] arrays 
int[][] oldWorld;  
int[][] newWorld;  
//considering cell is a given integer, use int  
//String cell;  
int cell;  
color isAlive;  
color isDead;  
color isOutline;  
int dX, dY;   

void setup(){   
  size(800, 600);  
  frameRate(5);  
  //color = hexadecimal notation (such as #FFCC00 or 0xFFFFCCOO)  
  //in this case, #FFBA4B, & #755F31 
  isAlive=#FFBA4B; //FFBA4B;
  isDead=0x8091D6BC;  
  isOutline=#755F31;//755F31;  
  stroke(isOutline);  
  strokeWeight(1);  
  noStroke();
  //haven't set up myFont, add PFont at the begining
  //will need to setup everytime codes copied to a new computer 
  myFont=loadFont("Harrington.vlw");  
  textFont(myFont, 32); 
  //don't know why to setup ellipseMode
  //ellipseMode(CORNER);  
  //missing simicolon ;  
  smooth();  
  //now that cell is a interger, give number directly to it
  //cell determines the size of the game & the size of the rectangles
  //cell="18";  
  cell=18;
  //dX and dY is the size of the game world
  dX = (width/cell);//*15);  
  dY = (height/cell);//*15);  
  oldWorld = new int[dX][dY];  
  newWorld = new int[dX][dY];
  //give initial status to the cells  
  doWorldMaker();
//missing } curly braket  
}  

void draw(){   
  background(0x8091D6BC);  
  fill(32);  
  //The frame count is shown at the bottom right corner
  textAlign(RIGHT);  
  text(frameCount, width-15, height-15);  
  //in the for next loop, after the init and test, there should be update
  //reference from processing.com
  //The for next loop draws rectangles determined by the status of oldWorld cells  
  for (int x = 0; x < dX; x++) {   
    for (int y = 0; y < dY; y++) {   
      if (oldWorld[x][y] ==1){  
        cellon(x*cell, y*cell);
        //cellon (int posX, int posY)
      }else{  
        celldie(x*cell, y*cell);  
        //celldie is a function, should have ();  
        //plus, it is customized with two int arguments, and should be given int to
      }
    }
  }
  //Done with draw oldWorld
  //Again: in the for next loop, after the init and test, their should be update  
  //Determine the newWorld under three rules (words from Wiki)
  //#1 Any dead cell with three live neighbours becomes a live cell
  //#2 Any live cell with two live neighbours lives on to the next generation
  //#3 Any live cell with fewer than two live neighbours or more than three live neighbours dies
  for (int x = 1; x < dX-1; x++) {   
    for (int y = 1; y < dY-1; y++) {  
      int count = neighbors (x, y);  
      if (count == 3) {  
        newWorld[x][y] = 1;
      }  
      if (count == 2) {  
        newWorld[x][y]=oldWorld[x][y];
      }  
      if (count <2 || count>3) {  
        newWorld[x][y]= 0;
      }
    }
  }
  //At the end of each loop, update the oldWorld to newWorld
  //draw the new oldWorld at the begining of next loop
  for (int x = 0; x < dX; x++) {   
    for (int y = 0; y < dY; y++) {  
      //wrong use of ==, == determines if two values are equivalent  
      //in this case, the value of oldWorld[x][y] is given as newWorld[x][y]
      oldWorld[x][y] = newWorld[x][y];
    }
  }
}  

//The neighbors counts the 8 cells around each cell
//The alived ones are 1, and dead ones are 0
//So interger (neighbors) is the number of alived neighbors
int neighbors(int col, int row){   
//neighbors is used as int in the draw loop  
//return() function return the number to interger (neighbors)
  int result = ((oldWorld[col-1][row-1])+(oldWorld[col-1][row])+(oldWorld[col-1][row+1])+(oldWorld[col+1][row-1])+(oldWorld[col+1][row])+(oldWorld[col+1][row+1])+(oldWorld[col][row-1])+(oldWorld[col][row+1]));  
  return (result);
}  

//The cellon draws smaller rect in (isAlive) color
void cellon(int posX, int posY){  
  fill(isAlive);  
  stroke(isOutline);  
  //I think there should be noStroke() here
  strokeWeight(1);
    //noStroke();
  rect(posX+cell, posY+cell, cell-2, cell-2);
  //In reference to the example of Conway in the program itself
  //The easy way to express rect is set()
  //set(posX+cell, posY+cell, isAlive);
} 

//The celldie draws larger rect in (isDead) color
void celldie(int posX, int posY){  
  noStroke();  
  fill(isDead);  
  stroke(isOutline);  
  noStroke();  
  rect(posX+cell, posY+cell, cell, cell);
  //set(posX+cell, posY+cell, isDead);
}  

//The doWorldMaker gives initial status to the cell randomly
//The ones within 0-65 are turned off, and within 65-100 are turned on
void doWorldMaker() {  
  for (int x = 0; x < dX; x++) {   
    for (int y = 0; y < dY; y++) { 
      //random () generates random float numbers, use int(random()) to convert float to int 
      int temp = int (random (100));  
      if (temp>65) {  
        oldWorld[x][y]=1;
      } else {  
        oldWorld[x][y]=0;
      }
    }
  }
}
//extra } curly braket 
//}  
 

//doCrosshairs() draws a single line across in the middle
//not sure what to do with it
//void doCrosshairs() {  
//  for (int x=0;x<dX;x++) {  
//    oldWorld[x][dY/2]=1;
//  }
//} 

