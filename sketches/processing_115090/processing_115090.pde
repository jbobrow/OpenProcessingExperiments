
// AC21010 circle and triangle animation by Colin Mackey, group 22

// Initial variables
int circleSize = 50;
int x1 = 200;
int y1 = 400;
int x2 = 300;
int y2 = 200;
int x3 = 400;
int y3 = 400;
int circleMax = 20;
int circleNo = 0;

void setup(){
  //600x600 window
  size(600, 600);
  // Light blue background
  background(149, 165, 232);
}

void draw(){
  // Circle spawn coordinates
  float xSpawn = random(600);
  float ySpawn = random(600);
  
  //Draws circles with a diameter of 50 units in random locations and of random colour 5 times before switching colour
  if (circleNo == circleMax){
    //Change the colour and reset the circle counter
     fill(random(255), random(255), random(255));
     circleNo = 0;
  }
  ellipse(xSpawn, ySpawn, circleSize, circleSize);
  circleNo++;
  
  //Draws a triangle of the current colour after the circles so it is always on the top layer
  triangle(x1, y1, x2, y2, x3, y3);
  
}


