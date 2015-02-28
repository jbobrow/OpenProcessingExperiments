
///MATRIX CODE////
///Inspired by the movie the matrix //
/// code was created from scratch///

PFont myFont; // declare font

void setup(){
  size(400, 400); // window size in pixels
  smooth(); // smooth jagged lines
  strokeWeight(3); // make stroke weight 3
  background(0); // make background black

  frameRate(20); // make frame rate 20
  //fill(255, 0, 0, 5);
}

void draw(){
  float x = random(0, 399); // make x a random generated number between 0 and 399
  float lineHeight = random(5, 399); //make lineHeight a random generated number between 0 and 399
  for (float y = 0; y < lineHeight; y+=10) { /// if y is less then the linheight y = y + 1
    myFont = createFont("FFScala", 12); // create font make it 12 point
    textFont(myFont);
    fill(44, 255, 13); // make font "matrix green"
    int f = round(random(0,mouseX/200)); // mouse position x determines the numbers generated (max X width = 400/200= 2) therefore a random number between 0 and 1 as it is rounded to the nearest whole number
    text(f, x, y); // generat number for text using integr f, put it at position x and y
  }
 noStroke(); // no stroke
 fill(0, 5); // fill with black at 5% opacity, to create fade effect

// Lines from bottom
float xxx = random(0, 399); // xxx random number between 0 and 399
 lineHeight = random(5, 399);  // lineHeight random number between 0 and 399
  for (float yyy = 399; yyy > lineHeight; yyy--) { // if yyy is more than lineHeight subtract yyy
    stroke(44, 255, 13, 40);
    point(xxx, yyy); // (line) 
  }
  // Lines from top
   noStroke();
 rect(0, 0, 400, 400);
 float xx = random(0, 399); // xx random number between 0 and 399
  float lineHeight2 = random(5, 399); // lineHeight2 random number between 0 and 399
  for (float yy = 0; yy < lineHeight2; yy++) { // if yy is less than lineHeight2 add yy
    point(xx, yy); ///(line)
  }
 rect(0, 0, 400, 400);
}

void keyPressed(){ // on any key press save a jpeg
  save("matrix.jpg"); // call it matrix
}


