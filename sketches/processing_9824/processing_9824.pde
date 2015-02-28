
// object array
Spot spArray [] = new Spot [20]; // create array of spots

void setup(){
  size(400, 400);
  background(255,100,10);
  noStroke();
  smooth();
 // fill(100,180);
  //initialize spot array
  for (int i = 0; i <spArray.length; i++){
    // distribute spots evenly across the screen
    float startX = map(i, 0, spArray.length, 50, width-50);
    spArray[i] = new Spot(startX, 150, 10, random(5));
  }
}

void draw(){
  background(255,100,10);
  //move and display spots
  for (int i = 0; i <spArray.length; i++){
    spArray[i].move();
    spArray[i].display();
  }
}

class Spot { // class declaration
  // fields - all instances of the Spot class will have values stored in these fields
  float x, y; 
  float diameter;
  float speed;
  int direction;

  Spot(float xi, float yi, float di, float sp) { // constructor method 
    // set initial values to fields
    x = xi; 
    y = yi;
    diameter = di;
    speed = sp;
    direction = 1;
  }

  void display() {
    bezier(y, x, diameter, diameter,20,40,60,80);
    fill(#03ADFF);
    bezier(x+40, y+40, diameter, diameter,80,60,60,60);
    
  }

  void move() {
    y += (speed*direction); // multiply by direction to control up/down travel
    //use radius (diameter/2) to see if ellipse hits edge of window
    if ((y > (height-diameter/2)) || (y < diameter/2)) {
      //if edge hit, reverse direction of travel
      direction *= -1;
    }
  }

}


