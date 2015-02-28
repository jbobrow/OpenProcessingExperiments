
/*
Ball Toss - Dec 2013-Jan 2014
by Thomas Ferris & Colm Mullan 
A javascript program for a game to toss a ball into a waste paper bin. 
*/

float centerLaunchX = 75; // Center of Launch Display Square 
float centerLaunchY = 525; // Center of Launch Display Square 
float speedX = 0; // Speed of ball in X direction, initialised to zero
float speedY = 0; // Speed of ball in Y direction, initialised to zero
float datumLaunchX = 0; // X datum for working out ball speed compraed to mouse location 
float datumLaunchY = 600; // Y datum for working out ball speed compraed to mouse location 
float ballX = 0; // Starting X Location of Ball 
float ballY = 600; //Starting Y Location of Ball 
float accY = 0; //Ball acceration due to gravity - this is set to a value later. 
Boolean win = false; // win = false until the ball goes into the lip of the bin. 
Boolean shotEnd = false; // shotEnd will be true when ball goes out of play or in the bin. 
Boolean training = false;//  training is true in Practice Mode 
Boolean endGame = false; // Needs to be reset to begin games
int shotCount = 0; // Number of shots taken
int hitCount =0; //Number of times the bin has been hit
PImage bin;// For the image of the bin
HitLight light;// Declare an Object "light" from the "HitLight" Class. Goes green if for a good hit into the bin. 


void setup() {
 // Basic Setup 
  frameRate(30);
  size(800,600);// Play area
   bin = loadImage("bin2.jpg"); // image of the bin 
   
// Draw the Launch Area.  
   noStroke();
   fill(255);
   rectMode(CENTER);
   rect(centerLaunchX,centerLaunchY,150,150);
 //  
   light = new HitLight (700,570);// have a light "object" on the bin 
    
 }// end setup

void draw() {
  
  //for (shot = 1; shot < 10; shot++){// 
  drawLaunchArea (); // Draw a rectangle to indicate how the mouse controls the ball launch speed and angle. 
  launchBall (); // Workout X and Y Speed based on mouse location and launch the ball
  drawAndUpdateBall();// Draw the ball and work out its new location
  testBallLocation();// Test to see if the ball needs to bounce or is in the bin 
  displayShotResult();// Display total shots and number of hits
  endGame();// Test for end of Game
  //}// end for shot
}// End Draw

void drawLaunchArea(){ // Draw the launch Area 
  noStroke();
  fill(64);
  rectMode(CENTER);
  rect(centerLaunchX,centerLaunchY,150,150);
  // Now write a text message to explain the launch area
  fill(255,0,0);
  textSize(14);
  text("Shoot at the bin by ", 10, 405); 
  text("clicking below in the", 10, 425); 
  text("Launch Control Area", 10, 445); 
 
  
} // End drawLaunchArea() Function

void launchBall() {
  // launch ball Block of code. If the Mouse is pressed (and it is not end of game) then use its co-ordinates to set the ball speed
  // Then launch the ball
    
  if (mouseX>0 && mouseX<150 && mouseY>450 && mouseY<600 && mousePressed && !endGame) {// start of mousepressed if
    
  ballX = 0; // Start the ball in the bottom corner
  ballY = 600;// Start the ball in the bottom corner
  
  speedX = (mouseX - datumLaunchX);// Set the X horizontal speed 
  speedY = (datumLaunchY- mouseY); // Set the ball Y vertical speed (Rememeber that down is +ve direction )
  speedX = constrain(speedX,1,149); // Used during debug to adjust and make the game playable
  speedY = constrain(speedY,1,149); //
  
  speedY = speedY / 4; // This is to scale the speed to make the game playable 
  speedX = speedX / 5;  // This is to scale the speed to make the game playable 
  accY = 1; // This was found by trial and error to amke the game playable.
  shotEnd = false;// not end of shot, the ball is moving, used for count and display logic later
  win = false;// reset win,, used for count and display logic later
  light.nohit();// make sure the hit indicator on the bin is off

  shotCount++; // add one to shot count 
    // need a delay to stop having multi mouse reads
   for (int wait = 0; wait<=1000000000; wait++){ 
   int square = wait*wait;   //do nothing just a delay 
   } // end of delay 
  } //end launch mousepress if
 }// end launchBall() function  

  void drawBin(){// Draw the Bin as a target.(Not needed if the image is used)  
   fill(255,255,0);
  rectMode(CENTER);
  rect(700,550,100,100);
  fill(100);
  ellipse(700,500,100,20);
  
  // This image was added intead of drawing the bin
    image (bin, 620,480, 160,140);
    
    if (win) {light.hit();// Update the score indicator, green for hit
    } 
    else 
    light.nohit(); // yellow bin color for no hit
    
}// End of drawBin()

// Function the draw the ball at the latest postion and then recalculate the new position. 
void drawAndUpdateBall(){
// draw the ball at latest ball(X,Y) location 
  
 if (!training){ background(0,10,0); //for training display don't overwrite the background 
 }
  
  menu();// Check the Menu Normal/Practice button
  drawBin(); // call a function to re-draw the waste bin if it was overwritten by the background
  drawLaunchArea();
  //now draw the ball 
  noStroke();
  fill(0,255,0);
  ellipseMode(CENTER);
  ellipse(ballX,ballY,40,40);
  // Update ball cordinates 
  ballX = ballX + speedX;
  ballY = ballY - speedY;
  speedY = speedY - accY; // For gravity speedY needs to decrease on each step
  }
  
 
 void testBallLocation(){ // Tests: Bounce required?, or out of play area. 
 // Test is bounce needed
 // Detect if the ball is at the bottom of the screen 
 // If so, then, make the ball bounce with 70% speed
  if (ballY > height) {
   ballY = height;
    speedY = speedY * -0.7; // (70% speed in the other direction)
  } // End of Bounce if  
  
  // Test to see if the ball hits the side of the bin
  if (ballX < 700 && ballX > 650 && ballY > 500) { 
       speedX = -speedX; // Change X direction
  }  // End of Side of Bin bounce test
 
  // Test to see if the ball is inside of the bin
  if (ballX < 750 && ballX > 650 && ballY > 480 && ballY < 510) {
   win = true;// a good hit
  if (win && !shotEnd) {hitCount++; //increase the hit counter for a win before setting shotEnd
  }// end of if 
   shotEnd = true;// end of shot 
   speedX  = 0;
   speedY = 0;
   accY = 0;   
   
 } // End of Test for shot in bin
 
 // Test to see if the ball is outside the sceen
 // if so stop this shot. 
 if (ballX > width || ballX < 0){
   win = false;
   shotEnd = true;
   speedX = 0;
   speedY = 0;
   accY = 0; 
 }// End of Test for ball out of play
}// end of testBallLocation() function  

void menu(){ // Draw and Test the Menu Button
  //draw the button
    
  fill(150);
  rectMode(CENTER);
  rect(100,50,100,50);
  fill(0);
  textSize(12);
  if (training){
     fill(0,0,255);
     text("Practice Mode", 55, 60); 
  }
  else{
    fill(0,255,0);
    text("Normal Mode", 55, 60); 
  }
  
// Now test if the Practice/Normal buttons is pressed
if (mouseX>50 && mouseX<150 && mouseY>50 && mouseY<100 && mousePressed) { // mouse pressed inside button

  training = !training; //Toggle between Practice and Normal mode.
  // need a delay to stop having multi mouse reads
 for (int wait = 0; wait<=1000000000; wait++){ 
   int square = wait*wait;   //do nothing just a delay 
  } // end of delay
 }// End if on buttons pressed
}// End Menu() funtion

 void displayShotResult() {// function to display results on screen
      fill(255);
      textSize(32);
      if (!training){ // don't show the shot count for training
       text("Shots", 600, 50);// show shot no on screen
       text("Hits", 700, 50);// show shot no on screen
       text(shotCount, 600, 100);// show shot no on screen
       text(hitCount, 700, 100);// show shot no on screen

      }//end of training if
 }// end displayShotResult() function
 
 void endGame(){// Test for end of game. Then put a message up to play again
   if (shotCount == 10) { // Test for 10 shots
     // Now write an End Game message on screen
     fill(255);
     textSize(32);
     text("END GAME", 300, 300); 
     endGame = true;// end of game is detected true 
     
     // Now put a play again button on screen
     fill(150);
     rectMode(CENTER);
     rect(370,400,100,50);
     fill(0);
     textSize(12);
     fill(0,0,255);
     text("Play Again?", 340, 400);   
     if (mouseX>320 && mouseX<420 && mouseY>375 && mouseY<425 && mousePressed) {// check for play again button press 
    resetGame(); // if play again is pressed then reset the game. 
   }//end of buttonpress if
  }// end of test for 10 shots
 } // end of endGame() function
 
 void resetGame(){ // reset hitCount and shotCount to O and allow game to restart (endGame= false)
   endGame = false;
   shotCount = 0;
   hitCount= 0;
        
  }  
 
 class HitLight {// make this look like the jitterbug example
   float x;// x location of light
   float y;// x location of light
  HitLight (float tempX, float tempY){// location of indicator 
    x = tempX;
    y = tempY;
  } // end of constructor

    void hit (){// set the indicator colour to green  
    fill(0,255,0);
    ellipse (x,y,15,15);
  } //end of hit()
     void nohit (){ // set the colour to the same as the bin - no indicator 
    fill(250,255,110);
    ellipse (x,y,15,15);
  }// end of nohit()
    
 } //end of class HitLight


