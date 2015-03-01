
// Square Packing version
// Packs Squares using an array to hold the
// location of every square it draws
// Not very efficient but it works
// 4 April 2014

int xOrigin;
int yOrigin;
float len = 40;
int cols = 300;
int rows = 300;
int count;


  
// Declare 2D array
boolean[][] myArray = new boolean[cols][rows];
boolean okToDrawSquare = true;
  
void setup() {
  
  stroke(0);  
  size(250,250);
  colorMode(HSB, 100);
  background(255);
  // Initialize 2D array values
  for (int x = 0; x < cols; x++) {
     for (int y = 0; y < rows; y++) {
    myArray[x][y] = false;
    }
  }
}

void draw() {
  fill(random(100),100,100);
  okToDrawSquare = true;

 /*
  println("inside draw loop count =" + count);
  println("is it okToDrawSquare? " + okToDrawSquare);
  
  println("xOrigin = " + xOrigin);
  println("yOrigin = " + yOrigin);
  println("len = " + len);
 */
 
  // generate a random square
  // declare every point in the square to true (ie used)

  xOrigin = int(random(width));
  yOrigin = int(random(height));
  len = (random(30) + 5) ;
 
 // test every point in the random square to make sure it has not been used before
 for (int i = 0; i < len; i++) {
  for (int j = 0 ; j < len; j++) {
    if (myArray[xOrigin +i][yOrigin +j] == true){
      
      // Don't draw this random square
      okToDrawSquare = false;
      
      
    }
  }
}
 
 
// test to see if the square will be drawn outside the screen boundary
if (xOrigin + len > width){
   okToDrawSquare = false;
}

if (yOrigin + len > height){
   okToDrawSquare = false;
}

 
 // if it's OK to draw the square draw it and recored all it's points as used
 if (okToDrawSquare == true){
   rect(xOrigin, yOrigin, len, len);  // draw the square
   // ellipse(xOrigin + len /2, yOrigin + len /2,  len,  len);  // draw the ellipse
 
   // Record all the points within the square as used
   for (int i = 0; i < len; i++) {
    for (int j = 0 ; j < len; j++) {
      myArray[xOrigin +i][yOrigin +j] = true;
    }
  }
}
}


void mousePressed() {
  count ++;  
  save("square_Packed_" + count);
  println("square_Packed_" + count);
}
