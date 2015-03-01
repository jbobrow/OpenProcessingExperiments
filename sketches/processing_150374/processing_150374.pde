
/*
 * Creative Coding
 * Week 2 exercise
 * 
 */
 //variables definitions,so these will be available from any function 
int num,gapx,gapy;
float cellsize; 
float rotation=0;

void setup() {
//environment setup and variables definitions
  randomSeed(hour() + minute() + second() + millis());
  size(820, 820);
  rectMode(CORNER);
  noStroke();
  background(180); // clear the screen to grey
  num = 5;
  gapx = 10;
  gapy = 10;
  cellsize = 150; 
  //initial call to the generating function
  generateGrid();
  
}
//proper function to genearate the grid
void generateGrid(){
for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        gapx = 10 + (int)random(-5, 5);
        gapy = 10 + (int)random(-5, 5);

        int colc = (int)random(0, 3);
        int red = 175;
        int green = 12;
        int blue = 12;
        
        if (colc == 0) {
          red = 230;
          green = 0;
          blue = 0;
        }
        
        fill(red, green, blue, 180); // rectangle
        rect(gapx * (i+1) + cellsize * i, gapy * (j+1) + cellsize * j, cellsize, cellsize);
      }
    }
}
//what should be done everyframe
void draw() {

  if(frameCount%50==0){
  background(180);
  generateGrid();
  }

} //end of draw 
