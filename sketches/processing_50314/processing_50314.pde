
//Quadrilateral-based; progressively smaller quads are drawn in each quarter, overlapping so as to appear like multiple neighboring quads
//Perspective down a hallway
//Mouseclick centers the hallway, redraws

float centerX;
float centerY;
int hallsize = 80;  //sets dimensions of the center square; offsets of +/- hallsize / 2 are used to position center (as opposed to upper left vertex)
                    //on click location

void mouseClicked() { //on MouseClick, recenters the screen on the click's location and calls the draw() function once
  centerX = mouseX;
  centerY = mouseY;
//  print("Clicked!"); //used to test condition
  background(200);
  redraw();
}

void setup() {
  size(600, 600);
  background(200);
  noStroke();
  centerX = width / 2;  //first run of draw() centers on center of screen
  centerY = height / 2;
  noLoop();
}

void draw() {
  int i, j;
  float scal = 1.0;  //scal is a scaling factor for the quadrilaterals being drawn
  float[] coords = new float[8];    //array to hold coordinates for drawing quads
  float topdiff_x, topdiff_y, botdiff_x, botdiff_y;  //these variables track the distance between vertices of the square and the corners of the window
  
  fill(40);
  rect(centerX - hallsize / 2, centerY - hallsize / 2, hallsize, hallsize); // center of hallway//
  
  //left quarter
  int shade = 50;  //sets starting color for quads
  //println(topdiff_x+" "+topdiff_y+" "+botdiff_x+" "+botdiff_y);  //testing correct distance measurement

  coords[0] = 0;    //[0], [1] and [6], [7] are the coords for the start and end points of each quad, on the edges of the window
  coords[1] = 0;    //i.e., coords[0], coords[1] = starting x, y; coords[6], coords[7] = ending x, y
  coords[6] = 0;
  coords[7] = height;
  topdiff_x = abs((centerX - hallsize / 2) - coords[0]);  //for convenience, these distances are made positive here
  topdiff_y = abs((centerY - hallsize / 2) - coords[1]);  //the adding or subtracting of coordinates is handled manually
  botdiff_x = abs((centerX - hallsize / 2) - coords[6]);  //based on which quarter is being addressed
  botdiff_y = abs((centerY + hallsize / 2) - height);

  for (scal = 1.0; scal > 0; scal -= 0.1) {
    fill(100, shade, 100);
    coords[2] = coords[0] + scal*topdiff_x;
    coords[3] = coords[1] + scal*topdiff_y;
    coords[4] = coords[6] + scal*botdiff_x;
    coords[5] = coords[7] + scal*botdiff_y;
    quad(coords[0], coords[1], coords[2], coords[3], coords[4], coords[5], coords[6], coords[7]);
    shade += 15;
  }
  
  //top quarter; for top and bottom quarters, "topdiff" refers to left and "botdiff" refers to right
  shade = 50;
  coords[0] = 0; 
  coords[1] = 0;
  coords[6] = width;
  coords[7] = 0;
  topdiff_x = abs((centerX - hallsize / 2) - coords[0]);
  topdiff_y = abs((centerY - hallsize / 2) - coords[1]);
  botdiff_x = abs((centerX + hallsize / 2) - coords[6]);
  botdiff_y = abs((centerY - hallsize / 2) - coords[7]);
  
  for (scal = 1.0; scal > 0; scal -= 0.1) {  
    fill(100, shade, 120);          //each quarter has subtly different shading
    coords[2] = coords[0] + scal*topdiff_x;
    coords[3] = coords[1] + scal*topdiff_y;
    coords[4] = coords[6] - scal*botdiff_x;
    coords[5] = coords[7] + scal*botdiff_y;
    quad(coords[0], coords[1], coords[2], coords[3], coords[4], coords[5], coords[6], coords[7]);
    shade += 15;
  }
  
  //right quarter
  shade = 50;
  coords[0] = width;
  coords[1] = 0;
  coords[6] = width;
  coords[7] = height;
  topdiff_x = abs((centerX + hallsize / 2) - coords[0]);
  topdiff_y = abs((centerY - hallsize / 2) - coords[1]);
  botdiff_x = abs((centerX + hallsize / 2) - coords[6]);
  botdiff_y = abs((centerY + hallsize / 2) - coords[7]);
  
  for (scal = 1.0; scal > 0; scal -= 0.1) {
    fill(120, shade, 100);
    coords[2] = coords[0] - scal*topdiff_x;
    coords[3] = coords[1] + scal*topdiff_y;
    coords[4] = coords[6] - scal*botdiff_x;
    coords[5] = coords[7] - scal*botdiff_y;
    quad(coords[0], coords[1], coords[2], coords[3], coords[4], coords[5], coords[6], coords[7]);
    shade += 15;
  }
  
  //bottom quarter; background pattern is added to create illusion of a hallway
  
  fill(10, 150, 10);
  quad(centerX - hallsize / 2, centerY + hallsize / 2, centerX + hallsize / 2, centerY + hallsize / 2, width, height, 0, height);
  fill(50, 100, 50);
  quad(centerX - hallsize / 6, centerY + hallsize / 2, centerX + hallsize / 6, centerY + hallsize / 2, width - hallsize, height, hallsize, height);
  
  shade = 50;
  coords[0] = 0;
  coords[1] = height;
  coords[6] = width;
  coords[7] = height;
  topdiff_x = abs((centerX - hallsize / 2) - coords[0]);
  topdiff_y = abs((centerY + hallsize / 2) - coords[1]);
  botdiff_x = abs((centerX + hallsize / 2) - coords[6]);
  botdiff_y = abs((centerY + hallsize / 2) - coords[7]);
  
  for (scal = 1.0; scal > 0; scal -= 0.1) {
    fill(120, shade, 120, 60);
    coords[2] = coords[0] + scal*topdiff_x;
    coords[3] = coords[1] - scal*topdiff_y;
    coords[4] = coords[6] - scal*botdiff_x;
    coords[5] = coords[7] - scal*botdiff_y;
    quad(coords[0], coords[1], coords[2], coords[3], coords[4], coords[5], coords[6], coords[7]);
    shade += 15;
  }
  

}

