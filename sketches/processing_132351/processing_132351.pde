
// Nees_Recreation
// Patrick J. O'Donnel
// http://www.artsnova.com/Nees_Schotter_Tutorial.html

int sq = 20;

void setup() {
  size(sq*10,sq*30);
  background(255);
  frameRate(30);
}
        int i = sq;
        
        int j = sq;
        
        float x = 0;
        
void draw () {
      
      if (j<height-sq) {  
        
        //row and column count
        int row = j/sq;
        int column = i/sq;
        println("row: " + row + "  column: " + column);
        
        //square descriptors
        noFill();
        stroke(0);
        strokeWeight(sq/20);
        
        //translate randoms
        translate(random(-row*row/sq/(sq/4),row*row/sq/(sq/4)),random(-log(column)*column/4,log(column)*column/4));
        
        //rotate
        rotate(random(-row/(sq*sq)-.015,row/(sq*sq)+.015));
        
        //rectangle
        rect(i,j,sq,sq);
        
        
        //duplicate rectangle to right
        i+=sq;
        
        //typewriter reset
          if (i>=width-sq) {
            i = sq;
            j = j + sq;
          }
        
      }
}
