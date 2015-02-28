
int numBalls = 3;
int[] xPos = new int[numBalls];
int[] yPos = new int[numBalls];
float[] speed = new float[numBalls];

float[] r = new float[numBalls];
int g = 100;
int b = 240;

void setup() {
  size(400, 400);
  frameRate(40);
  smooth();

  // we set them manually the first time, 
  //but now we can assign their values 
  //using arrays!
  
  //  xPos[0] = 4;
  //  xPos[1] = 8;
  //  xPos[2] = 12;
  
  // yPos[0] = 60;
  // yPos[1] = 120;
  // yPos[2] = 180; 
 
  //  speed[0] = 2;
  //  speed[1] = 3;
  //  speed[2] = 8;
  
  //setting a bunch of values at once using for loops + arrays
  for (int i =0; i < numBalls; i++) {
    xPos[i] = 4*(i+1); 
    yPos[i] = 60*(i+1); 
   //we can also set random values for things in this loop 
   // (that will then remain constant for the duration of the sketch
   // unless we change them in the draw loop)
    speed[i] = random(5, 10);
    r[i] = random(0, 255);
  }



  // printing out the value of just the first ball's x-position
  // println(xPos[0]);

  // printing the entire contents of the xPos and speed arrays
  // note: can't concatenate array with a string, has to be its own println call
  println("xPos: ");
  println(xPos);
  println("speed: ");
  println(speed);

  // printing just the contents of each cell in the xPos array
  for (int i = 0; i < numBalls; i++) {
    println(xPos[i]);
  }
}

void draw() {
  background(0);

  // loop through all contents of the arrays
  for (int i = 0; i < numBalls; i++) {
    ellipse(xPos[i], yPos[i], 20, 20);
    //increment x position by each ball's unique speed
    xPos[i] += speed[i];
    // change the color for each ball
    fill(r[i], g, b);
  }

}


