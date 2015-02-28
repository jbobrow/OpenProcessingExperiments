
//******change the size of the cells/tiles here
//******make sure it is divisible by the width and height values
//dimensions of a square cell in pixels
int cellSize = 100; 

//calculate total number of tiles in grid
int numCells = (600/cellSize)*(400/cellSize);

 /* @pjs preload="logo_img"; */
  /* @pjs preload="back_img"; */
//images referenced in sketch
PImage logo_img, back_img;

//array to store grid points which marks the origin of each cell drawn. first stored then shuffled
ArrayList<PVector> points = new ArrayList<PVector>();

//===================================================//
void setup() {
  size(600,400);

  //images re400ferenced in sketch
  logo_img = loadImage("arLogo.jpg"); 
  back_img = loadImage("arBck.jpg");
  background(back_img);

  //initializing an array list with the positions of major grid intersections
  for (int i = 0; i < (600/cellSize) ;i++) {
    for (int j = 0; j < (400/cellSize) ; j++) {
      int x = i*cellSize;
      int y = j*cellSize;
      PVector p = new PVector(x, y);
      points.add(p);
      //print (p);
    }
  }
  //and now randomize the array!
  Collections.shuffle(points);
  //print (points);

  //this draws a grid over logo image *
  for (int q = 0; q < 600 ; q+=cellSize) { 
    //modify properties of line here....can change color or thickness etc.
    line (q, 0, q, 400);
  }
  for (int k = 0; k < 400 ; k+=cellSize) { 
    //modify properties of line here....can change color or thickness etc.
    line (0, k, 600, k);
  }
}

//===================================================//
int idx = 0; //index to step through shuffled array of coordinates

void draw() {
  PVector p = points.get(idx);

  int xVal = int (p.x); //some shuffled x coordinate in the array in the idx'th position
  int yVal = int (p.y); //some shuffled x coordinate in the array in the idx'th position

  loadPixels();
  //we must call loadPixels() on the PImage since we are going to read its pixels.
  logo_img.loadPixels();

  for (int y = yVal+1; y < yVal+(cellSize-1); y++ ) {   //not reading the first or last pixel in each cell
    for (int x = xVal+1; x < xVal+(cellSize-1); x++ ) { //this leaves room for background color to appear
      int loc = x + y*600;

      //the functions red(), green(), and blue() pull out the three color components from a pixel.
      float r = red(logo_img.pixels [loc]); 
      float g = green(logo_img.pixels[loc]);
      float b = blue(logo_img.pixels[loc]);

      // Image Processing would go here
      // If we were to change the RGB values, we would do it here, before setting the pixel in the display window.

      //set the display pixel to the image pixel
      pixels[loc] = color(r, g, b);
    }
    updatePixels();
  }

  //here we increment and advance to the next indexed value before coming out of the loop
  if (idx<(numCells-1)) { 
    idx = idx+1; //max number of cells = numCells
  } 
  else { //when max is reached then stop drawing and looping 
    noLoop();
  } 

  //set a delay before next tile appears
  delay (int(random(100,500))); //milliseconds, 1000 = 1sec
}


