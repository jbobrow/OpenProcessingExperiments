
Spot [][] mySpot = new Spot[30][30];  // we delcare the array of objects

// this means: use the class Spot, make it an array called mySpot. Create an array of 30 objects using the class Spot.
// in short: create an array of "Spots" with 30 elements.

void setup() {
  size(600, 600);
  smooth();

  for (int i=0; i<mySpot.length; i++) {
    for (int j=0; j<mySpot.length; j++) {
      mySpot [i][j] = new Spot(30 * i, 30*j, 20); // We assign the elements of the array, and we give it some properties
  }
  }
}


void draw() {
  background(0);

  for (int i=0; i<mySpot.length; i++) {
    for (int j=0; j<mySpot.length; j++) {
      mySpot[i][j].update(mouseX, mouseY);
      mySpot[i][j].display();
  }
}
}
class Spot {
  
  // we define the variables
  // these variables are accesible 
  float x;
  float y;
  float mx;
  float my;
  float sz;
  float mouseDist;
  float mouseDistMapped;
  
  // this is the Constructor
  // The Constructor is used for initializing data for the object
  // It's like the initials parameters needed to create the object
  // Note the syntax. There is no "void" before the name
  Spot(float xPos, float yPos, float spotSize){
    x = xPos;      // assign xPos (a number coming from outside the class) to x (a local variable)
    y = yPos;      // same case with y and yPos
    sz = spotSize; // same for sz and spotSize
  }
  
  
  // The functions inside a class are called Methods
  // this "update" method is to check things every frame
  // in this case we are checking the mouse position 
  // the name "update" is just a name
  void update(float mousePosX, float mousePosY){
    mx = mousePosX;
    my = mousePosY;
    mouseDist = dist(x, y, mx, my);
    mouseDist = constrain(mouseDist, 0, 200);
    mouseDistMapped = map(mouseDist, 0, 200, 1.5, 0.3);
  }
  
  
  // with this method we draw
  // To be less confusing, we call this method "display", but could be "draw" or any other name
  void display(){
    // draw an ellipse
    // note that we are controlling the size with mouseDistanceMapped (that gives us a number between 0 and 1
    // what we do is multiply the size by a number between 0 and 1, so it's like a percentage
    ellipse(x, y, sz * mouseDistMapped, sz * mouseDistMapped); 
  }
   
  
  

}

