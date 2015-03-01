
/*
 * Attempt at using an array
 * 
 */
  //int i = 1;
  //int j = 1;
  float gap = 100;
  float cellsize = 50;
  float h [] = { 5, 33, 60, 90, 150, 180, 210, 250, 290 };


// setup function -- called once when the program begins
void setup() {

  // set the display window to size 500 x 500 pixels
  size(500, 500);

  // set the background colour to white
  background(255);

  // set the rectangle mode to draw from the centre with a specified radius
  rectMode(CORNER);

noLoop();
}


// draw function -- called continuously while the program is running
void draw() {
  for(int i=0; i<3; i++){
    for(int j=0; j<3; j++){
drawRectangle(h, i, j, gap, width, cellsize); 
//saveFrame("Array##.jpg");
    }
  }
 }
void drawRectangle(float [] hues, int i, int j, float gap, float width, float cellsize) {
    colorMode(HSB,360,100,100);  
  fill( hues[j*3+i],99,99);
    ellipse(gap * (i+1) + cellsize * i, gap * (j+1) + cellsize * j, cellsize, cellsize);
}
