
PImage  stars;

int     radius, rocketRadius;
float   frequency, position, positionTwo, positionAdder;
float   posOne, posTwo, posThree, posFour;
float angle1;
float x;
float y;
float move;
int angle;
int deg;

//for rocket
PImage  rocket;
float   rocketFrequency;
float   rocketPosition;
float   rocketPositionAdder;
float     posX, posY;

void setup() {
  size(600,600);
  
  stars = loadImage("http://i44.tinypic.com/20tr03n.png");
  rocket = loadImage("http://i44.tinypic.com/zkfzas.png");

  posX = 0;
  posY = 0;

    //Sets the magnitude
  radius        = 50;
  rocketRadius     = 30;
  
  //Sets rate of motion
  frequency     = 200;
  rocketFrequency = 300;
  
  //Provides initial position value
  position      = 0;
  positionTwo   = PI/2;
  rocketPosition  = PI;
  
  //**This is important**
  //This specifies the increment taken for each draw cycle
  //A way to think of this is that we are taking a circle, which is two pi in radians
  //And breaking it up into 44,100 pieces (see http://en.wikipedia.org/wiki/44,100_Hz)
  //Our frequency is then saying how many steps to take around the circle each cycle
  //And positionAdder is that incremental value in radians
  positionAdder = ( (float)frequency / 44100) * TWO_PI;  
  //rocketPositionAdder = ( (float)rocketFrequency / 44100) * TWO_PI;
}


void draw() {
  
  background(18,48,110);
  pushMatrix();
  translate(-100,0);
  
  posX += 2;
  


  //Increment the position of the object
  position     += positionAdder;
  positionTwo  += positionAdder;
  rocketPosition += rocketPositionAdder;

  posOne = oscillationPositive(position, radius);
  posTwo = oscillationNegative(position, radius);
  posThree = oscillationPositive(positionTwo, radius);
  posFour  = oscillationNegative(positionTwo, radius);
  
  posY = oscillationPositive(rocketPosition, rocketRadius);
  posY += 180;
  

  image(stars, posThree, posOne);
  image(stars, posFour, posTwo);
  popMatrix();
 
  PVector rocketpos = new PVector(300, 300);
  translate(rocketpos.x, rocketpos.y);
  rotate(atan2(mouseY-rocketpos.y, mouseX-rocketpos.x));
  image(rocket, -75+move, -75/2);
}
  
  void keyPressed(){
  if (key == CODED){
    if (keyCode == UP){
    move= move+10;
    }
  }
  if (key == CODED){
    if (keyCode == DOWN){
    move= move-10;
    }
  }

}


//Instead of creating a function that is void (ie returns nothing)
//Here are two functions that return a float value

float oscillationPositive(float position, float theRadius) {

  float pos = sin(position);
  pos = pos * theRadius;

  //this is to keep the variable position at or under Two Pi
  while (position > TWO_PI) { position -= TWO_PI; }

  //this tells the function what value to return
  return pos;
}

float oscillationNegative(float position, float theRadius) {

  //Subtract PI to provide a value on the opposite side in radians
  float pos = sin(position-PI);
  pos = pos * theRadius;
  
  //this is to keep the variable position at or under Two Pi
  while (position > TWO_PI) { position -= TWO_PI; }

  //this tells the function what value to return
  return pos;
}


