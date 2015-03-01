
Square[] squares; // array for the square objects
int numSquares=400; // number of square in simulation

void setup() {
  size(525,525);
  //smooth();
  //strokeWeight(0); // boundaries thicker
  //strokeColor(128);
  noStroke();
  squares = new Square[numSquares]; // create the array of the given size
  for (int i=0; i<numSquares; i++) {
    // now create squares according to the given definition, use random numbers as values
    
    //random
    squares[i] = new Square(12+random(500),12+random(500),8,random(0.01,0.1),random(128,128));
   
    //
  }
}

void draw() {
  background(255); //, 0); // repaint a white background in each frame
  for (int i=0; i<numSquares; i++) {
    squares[i].render(); // tell every square to repaint itself (after rotating a bit)
  }
}

class Square {
  float x, y; // position
  float angle=0; // angle 
  float w; // width=height
  float s; // speed of rotation
  float c; // grey value
  
  Square(float x, float y, float w, float s, float c) {
    // assign the randomly created values to the class variables to remember them for painting
    this.x=x; 
    this.y=y;
    this.c=c;
    this.w=w;
    this.s=s;
  } 
  
  void render() {
    fill(c); // set the gray value as color to fill
    //strokeColor(128);
    //angle += s; // adjust the angle according to the rotation speed s
    pushMatrix(); // used for local transformation
    translate(x,y); // the center of the local coordinate system is the center of the square
    //rotate(angle); // rotate the coordinate system
    rect(-w/2,-w/2,w,w); // draw the square
    popMatrix(); // used for local transformation
  }
}

