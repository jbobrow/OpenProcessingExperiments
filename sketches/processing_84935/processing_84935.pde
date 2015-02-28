
int xPos;                      //X Position of the ball
int yPos;                      //Y Position of the ball
int speed=1;                   //How fast is it moving?
int xDir=1;                    //what direction is the ball going?
int score=0;                   //Inital score
int lives=5;                   //Number of lives you start with
boolean lost=false;            //Have you lost yet?
int x = 150;                  // x location of owl
int y = 150;                 // y location of owl
int z = 0;

void setup()                   //Runs once when program launches
{
  size (800,600);
  smooth();
  xPos=width/2;                //Centers our ball
  yPos=height/2;
  fill(255);               //Makes the ball and text green
  textSize(20);                //Sets the size of our text
}

void draw()                                      //Loops over and over again
{
background(#C9FFFE);
   
  //draw sun
  noStroke();
   fill(#FBFF21);
   ellipse(650,x,x,x);
    
   //draw cloud
 noStroke();
 fill(255);
 ellipse(z+100,80+100,102,102);
noStroke();
 fill(255);
 ellipse(z-40+100,130+100,102,102);
noStroke();
 fill(255);
 ellipse(z+40+100,130+100,102,102);

// draw owl
//draw left wing
ellipseMode(CENTER);
noStroke();
fill(#C9BFBD);
ellipse(xPos-60,yPos,25,50);
 
//draw right wing
ellipseMode(CENTER);
noStroke();
fill(#C9BFBD);
ellipse(xPos+60,yPos,25,50);
 
//draw left foot
ellipseMode(CENTER);
noStroke();
fill(#744747);
triangle(xPos-20,yPos+75,xPos-15,yPos+50,xPos-10,yPos+77.5);
 
//draw right foot
ellipseMode(CENTER);
noStroke();
fill(#744747);
triangle(xPos+10,yPos+77.5,xPos+15,yPos+50,xPos+20,yPos+75);
 
//Draw Owl Body
ellipseMode(CENTER);
noStroke();
fill(#A28D8A);
ellipse(xPos,yPos,125,150);
 
//draw owl left ear
ellipseMode(CENTER);
noStroke();
fill(#A28D8A);
ellipse(xPos-20,yPos-65,25,25);
 
//draw owl right ear
ellipseMode(CENTER);
noStroke();
fill(#A28D8A);
ellipse(xPos+20,yPos-65,25,25);
 
//eye left circle
noStroke();
fill(#C9BFBD);
ellipse(xPos-20,yPos-35,50,50);
 
//eye right circle
noStroke();
fill(#C9BFBD);
ellipse(xPos+20,yPos-35,50,50);
 
//draw owl left eye
ellipseMode(CENTER);
noStroke();
fill(#FEFF00);
ellipse(xPos-20,yPos-40,25,25);
 
//draw owl right eye
ellipseMode(CENTER);
noStroke();
fill(#FEFF00);
ellipse(xPos+20,yPos-40,25,25);
 
//draw owl right pupil
ellipseMode(CENTER);
noStroke();
fill(0);
ellipse(xPos-20,yPos-40,10,10);
 
//draw owl left pupil
ellipseMode(CENTER);
noStroke();
fill(0);
ellipse(xPos+20,yPos-40,10,10);
 
//draw chest
ellipseMode(CENTER);
noStroke();
fill(#C9BFBD);
ellipse(xPos,yPos+20,90,90);
 
//draw owl beak
noStroke();
fill(#FF4C2C);
triangle(xPos-5,yPos-25,xPos,yPos-15,xPos+5,yPos-25);


/// vv owl after score
  xPos=xPos+(speed*xDir);                        //update the ball's position 
  if (xPos > width-20 || xPos < 20)                //Did the ball hit the side?
  {
    xDir=-xDir;                                  //If it did reverse the direction
  }
  text("score = "+score,20,20);                  //Print the score on the screen
  text("lives = "+lives,width-100,20);            //Print remaining lives
  if (lives<=0)                                  //Check to see if you lost
  {
    textSize(20);
    text("Click to restart the game!", 270,100);
    noLoop();                                    //Stop looping at the end of the draw function
    lost=true;
    textSize(25);

  }
  
}
void mousePressed()                              //Runs whenever the mouse is pressed
{
  if (mouseX<xPos+63 && mouseX>xPos-63 && mouseY<yPos+75 && mouseY>yPos-75)  //Did we hit the target? >>>> i need this is be x+y position to be equal to greater than or less than a value 
    
  {
    score=score+speed;                           //Increase the speed
    speed=speed+1;                               //Increase the Score
  }
  else                                           //We missed
  {
    if (speed<1)                                 //If speed is greater than 1 decrease the speed
    {
    speed=speed-1;
    }
    lives=lives-1;                               //Take away one life
  }
  if (lost==true)                                //If we lost the game, reset now and start over 

  {
    speed=1;                                     //Reset all variables to initial conditions
    lives=5;
    score=0;
    xPos=width/2;
    yPos=height/2;
    xDir=1;
    lost=false;
    loop();                                     //Begin looping draw function again
  }
}
