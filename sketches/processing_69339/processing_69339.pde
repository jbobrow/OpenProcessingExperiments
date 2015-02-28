
/**
 * Motion 
 * CC Lab Fall 1512
 *
 * by Ryan Raffa
 * 09/02/12
 */

//create initial global variables

Star [] stars = new Star [8];
float [] rPosY = new float[200];
float [] gPosY = new float[200];
int starCounter1;
int starCounter2;
Star tempStar;

int     radius;
float	frequency, position, positionAdder;
float   posOne, posTwo;

int origin;

void setup() {
  size(500, 500);
  background(0);
  smooth();
  starCounter1 = 0;
  starCounter2 = 0;
  
  for (int i = 0; i < stars.length; i++) {
  stars [i] = new Star();
  stars[i].init();
  
  }

  //Sets the magnitude
  radius        = 60;

  //Sets rate of motion
  frequency     = 300;
  
  //Provides initial position value
  position      = 0;

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
  
  //This simulates a "tail" on the end of the moving object
  //by using the alpha channel of a rect instead of a backgroud
  //Change the alpha value of fill to see what happens
  fill(0, 0, 0, 30);
  rect(0, 0, width, height);
  
  // Move the origin to the center of screen
  translate(width/2, height/2);
  
  origin = mouseY - (height/2);
  
  //Increment the position of the object
  position += positionAdder;

  // Red Circle
  posOne = oscillationPositive(position);
  rPosY [0] = posOne + origin;

  // Green
  posTwo = oscillationNegative(position);
  gPosY [0] = posTwo + origin;
  
  if (posOne > 0){
  //strokeWeight(1);
  stroke (255, 0, 0);
  arc (0, origin, width/2, abs(posOne*2), HALF_PI, PI); 
  stroke (0, 255, 0);
  arc (0, origin, width/2, abs(posOne*2), PI, PI+HALF_PI);
  
  } else {
  stroke (0, 255, 0);
  arc (0, origin, width/2, abs(posOne*2), HALF_PI, PI); 
  stroke (255, 0, 0);
  arc (0, origin, width/2, abs(posOne*2), PI, PI+HALF_PI);
    
  }
  
  for (int i = 0; i < rPosY.length-1; i++){
  strokeWeight(10);
  //noStroke ();
  stroke(255, 0, 0, 400-(i*2));
  line(i, rPosY[i], i+1, rPosY[i+1]);
  stroke(0, 255, 0, 400-(i*2));
  line(i, gPosY[i], i+1, gPosY[i+1]);

  
  }
  
  for (int i = rPosY.length-1; i > 0; i--) {
   
   strokeWeight(1);
   rPosY[i] = rPosY [i-1]; 
   gPosY[i] = gPosY [i-1]; 
    
  }
  
  //ellipse(0, posOne/15, 15, 15);
  noFill();
  stroke(0, 0, 255);
  
  for (int i = 0; i < 5; i++) {
  
  ellipse(- random(width/4 - 10, width/4 + 10), origin + random(-10, 10), 15, 15);

  }
  
  
/*  starCounter1 += 1;
  
  if (starCounter1 == 20) {
  
  starCounter2 += 1;

      if (starCounter2 > stars.length) {
       starCounter2 = 0; 
      }
    
  }*/
  
  for (int i = 0; i < stars.length; i++) {
   stars[i].update();
   stars[i].drawStar();
    
    
  }
  
  
  
}

//Instead of creating a function that is void (ie returns nothing)
//Here are two functions that return a float value

float oscillationPositive(float position) {

  float pos = sin(position);
  pos = pos * radius;

  //this is to keep the variable position at or under Two Pi
  while (position > TWO_PI) { position -= TWO_PI; }

  //this tells the function what value to return
  return pos;
}

float oscillationNegative(float position) {

  //Subtract PI to provide a value on the opposite side in radians
  float pos = sin(position-PI);
  pos = pos * radius;
  
  //this is to keep the variable position at or under Two Pi
  while (position > TWO_PI) { position -= TWO_PI; }

  //this tells the function what value to return
  return pos;
}


