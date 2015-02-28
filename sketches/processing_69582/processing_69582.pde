
int     radius;
float	frequency, position, positionAdder;
float   posOne, posTwo;
int     posFlower;

float [] yPos = new float [9];

void setup() {
  size(800, 800);
  background(255);
  smooth();

  //Sets the magnitude
  radius        = 300;

  //Sets rate of motion
  frequency     = 200;

  //Provides initial position value
  position      = 0;
  
  posFlower=0;

  //**This is important**
  //This specifies the increment taken for each draw cycle
  //A way to think of this is that we are taking a circle, which is two pi in radians
  //And breaking it up into 44,100 pieces (see http://en.wikipedia.org/wiki/44,100_Hz)
  //Our frequency is then saying how many steps to take around the circle each cycle
  //And positionAdder is that incremental value in radians
  positionAdder = ( (float)frequency / 44100) * TWO_PI;
}

void draw() {

  noStroke();


  fill(0, 50);
  rect(0, 0, width, height);

  // Move the origin to the center of screen
  translate(width/2, height/2);

  //Increment the position of the object
  position += positionAdder;

  // Red Circle
  rotate(PI/2.0);
  fill(255, 0, 0);
  posOne = oscillationPositive(position);
  ellipse(10, posFlower, 20, 20);
  arc(50, posFlower, 50, 50, 0, HALF_PI);
  
  // Green
  fill(0, 255, 0);
  posTwo = oscillationNegative(position);
  ellipse(0, posFlower, 20, 20);



  //rotating all objects 90 degrees (or PI/2.0) that follow this function
  //for info on translate, rotation, etc. check this out: http://processing.org/learning/transform2d/
}

//Instead of creating a function that is void (ie returns nothing)
//Here are two functions that return a float value

float oscillationPositive(float position) {

  float pos = sin(position);
  pos = pos * radius;

  //this is to keep the variable position at or under Two Pi
  while (position > TWO_PI) { 
    position -= TWO_PI;
  }

  //this tells the function what value to return
  return pos;
}

float oscillationNegative(float position) {

  //Subtract PI to provide a value on the opposite side in radians
  float pos = sin(position-PI);
  pos = pos * radius;

  //this is to keep the variable position at or under Two Pi
  while (position > TWO_PI) { 
    position -= TWO_PI;
  }

  //this tells the function what value to return
  return pos;
}


void keyPressed() {
  if (keyCode==UP) {

    posFlower +=3;
  }
  else if (keyCode == DOWN) {
    posFlower -=3;
  }



if (frameCount % 1 == 0) {
   
    pushMatrix();
    translate(100, 100);
    rotate(radians(frameCount * 2  % 360));
     noFill();
  stroke(0, 0, 255);
  ellipse(0, posFlower, 20, 20);
    popMatrix();
  }
//  rotate(PI/2.0);
 
}



