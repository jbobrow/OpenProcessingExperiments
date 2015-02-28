
//
// Final Project
// 
// Kids Games: Colors and Images
// 
// Strong colors with simple images and a simple interaction. The Layout is a grid.
// When the user clicks, that grid element is updated and the color and the image changes.
//
// All images used in this small project came from here: http://all-silhouettes.com
//
//------------------------------------------------------------------------------------

// colores
color[] myColors = {#FF7100, #FFA900, #1142AA, #009B95, #C41E00, #00CC00, #D30885, #DFFA19, #16B7F5, #FC080C, #07ED8F, #07EDE7};
// colors matrix
int[][] backgroundColors;
// images
PImage[] myImages = new PImage[12];
//images matrix
int[][] imagesGrid;

//square size in pixels
int sideSize = 150;
int cols;
int rows;

//Create setup code block
void setup(){
  
 //window size for this assignment
 size(1200, 600);
 
 cols = width / sideSize;
 rows = height / sideSize;
 
 backgroundColors = new int[cols][rows];
 imagesGrid = new int[cols][rows];
 
 // loadImages
 for (int i = 0; i < myImages.length; i++) {
   myImages[i] = loadImage("img"+i+".png");
 }
 
 noStroke();
 //generate the grid content
 generateBackgroundAndImages(); 
}


//creates the grid content: color and image
void generateBackgroundAndImages(){
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      updatePos(i, j);
    }
  }  
}//end generateBackground

//creates a new color and new image in a specific position
void updatePos(int x, int y){
  // random set color in this position
  backgroundColors[x][y] = int(random(myColors.length));
  // random set image in this position
  imagesGrid[x][y] = int(random(myImages.length));
}//end updatePos

//Create the draw code block
void draw(){
  // draw the grid
  drawGrid();
}

// mouse released. Gets the position and update the grid of that position
void mouseReleased() {
  int x = mouseX/sideSize;
  int y = mouseY/sideSize;
  updatePos(x,y);
}

// draw the grid in the canvas
void drawGrid(){
  
  for(int x=0; x< cols; x++){
    for(int y=0; y<rows; y++){
      // set fill color
      fill(myColors[ backgroundColors[x][y] ]);
      // draw the square
      rect(x*sideSize,y*sideSize,sideSize, sideSize);
      // inserts the image
      image( myImages[ imagesGrid[x][y] ] , x*sideSize, y*sideSize);
    }
  }
  
}


