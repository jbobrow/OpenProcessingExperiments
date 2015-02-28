

 
 
int ballRadius = 30;
 
// DECLARE AND INITIALIZE ARRAY
 
float [] allBallsX = new float[25];
float [] allBallsY = new float[25];
float [] ballSpeed = new float [30];
 
// SETUP
 
void setup() {
  size(600,400);
  smooth();
  frameRate(30);
  fill (0);
   
// For LOOP giving ball random STARTING X location (initialize allBallsX array / assign the first value in the array allBallsX)
 
for (int i = 0; i < allBallsX.length; i++) {
  allBallsX[i] = random(0, 50); // give the X location a random variable between -100 and 50

  }
 
// For LOOP giving ball random STARTING Y location (initialize allBallsY array / assign the first value in the array allBallsYs)
 
for (int i = 0; i < allBallsY.length; i++) {
  allBallsY[i] = random(400); // random Y location between 0 and 400 (height of sketch window)
  }
 
// For LOOP giving ballSpeed random value
 
for (int i = 0; i < ballSpeed.length; i++) {
  ballSpeed[i] = random(5,11); // initialize ballSpeed array with random speed between 5 and 10
  }
}
 
// DRAW
 
void draw() {
  background(200);  
  ellipseMode(RADIUS);
   
  for (int i = 0; i < allBallsX.length; i++) {
    
  ellipse(allBallsX[i], allBallsY[i], ballRadius, ballRadius); // draw ball
//constrain (allBallsX[i], 0, width);
  ballRadius = constrain(ballRadius-1,15,100);
            fill(random(255),random(255),random(255));

   }
  
  for (int i = 0; i < allBallsX.length; i++) {
    if ((allBallsX[i] >= width) || (allBallsX[i] <= 0)) { // reverse direction (bounce balls back)



  ballSpeed[i] = ballSpeed[i] * -1; // change direction
  ballRadius = 30; // increase size when ball reaches end (wall) to give illusion of bouncing
  fill(0);

    }
   allBallsX[i] = allBallsX[i] + ballSpeed[i]; // give speed along X  
 
  }
 
 
 
}
//http://www.openprocessing.org/sketch/11234
//http://openprocessing.org/sketch/40846
 



