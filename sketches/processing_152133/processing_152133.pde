
  int num = 3;
// setup function -- called once when the program begins
void setup() {

  // set the display window to size 500 x 500 pixels
  size(500, 500);
  // set the background colour to white
  background(255);
  // set the rectangle mode to draw from the centre with a specified radius
  rectMode(RADIUS);
  int array1[] = new int [10]; // new array of integers with ten elements
  for (int i = 0; i < 10; ++i){
    array1[i] = i * 2;
    int array2[] = array1;
    array1[0] = 100;
    println("Array 1 value ",i, " is ", array1[i]);
    println("Array 2 value ",i, " is ", array2[i]);
  }
}

 //draw function -- called continuously while the program is running
void draw() {
  int num = 3;// hardcode for simplicity 
  int gap =  50;//hardcode for simplicity 
  
  // calculate the size of each square for the given number of squares and gap between them
  // from a previous week
  float cellsize = ( width - (num + 1) * gap ) / (float)num;

  // declare and allocate space for the array
  //float greys[] = new float[9]; // nine elements - to 8 // one method
  float greys [] = { 10, 30, 50, 160, 5, 200, 122, 140, 250 }; // another method
  // draw grid
  for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {
          fill( greys[ i*3 + j ] );
          drawRectangle(greys, i, j, gap, width, cellsize); 
      } // end for
  } // end for
}

void drawRectangle(float [] greys, int i, int j, float gap, float width, float cellsize) {
    rect(gap * (i+1) + cellsize * i, gap * (j+1) + cellsize * j, cellsize, cellsize);
}


