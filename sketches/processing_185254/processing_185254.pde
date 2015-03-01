
//Casey Hamilton, 2/10,
//Helped from class variations



int columns = 12; //# of columns for squares
int rows = 17; //# of rows for squares
int square = 30; //square size
int padding = 2*square; //margins
float rotation = .20; //rotation degree
float rotationadd = 0; //additive rotation value
float randomvalue; //random value for translation and rotation


void setup() {
  size(5+(12*square), 5+(17*square)); //margins
  background(255);
  rectMode(CENTER);
  noLoop(); //only draw once
}

void draw() {
  for (int y=1; y<rows; y++) {  //adds to row
    rotationadd = rotationadd+(y*rotation);  //add rotation to lower rows
    for (int x=1; x<columns; x++) {  //adds to columns
      pushMatrix();
      randomvalue=random(-rotationadd, rotationadd); //more rotation, random values
      translate(x*square,y*square); //keeps the squares from stacking on top of each other
      rotate(radians(randomvalue)); //degree value
      rect(0, 0, square, square);
      popMatrix();
    
    }
  }
}



