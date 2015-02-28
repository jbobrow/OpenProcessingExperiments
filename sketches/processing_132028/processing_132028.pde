
/* Special Feature 1: Screen Shot with camera sfx.Taken with z key
   Special Feature 2: A picture appears in a random segment and if mouse is pressed on picture a gun sound is triggered and a gif of a blood splatter appears
   Special Feature 3: In segment 14 the webcam takes a picture,camera sfx is triggered and the picture is loaded back into the program as a target picture.
   Special Feature 4: If 5 target pictures have been shot a video plays and the background is changed
   PS. I have a second path that needs to be changed. Search H:/PongEndtermReturnMinim/minim/ to find.Needs to be path to main directory of the sketch
*/

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim minim;
import processing.video.*; // Imports video library

import arb.soundcipher.*;
import arb.soundcipher.constants.*;

int x1;
int y1, y2;
int velocityX;
int velocityY;
color c = color((int)random (255),(int)random (255),(int)random (255)); // Create randon RGB colour
int ballPos; // Keeps track of what segment of the grid the ball is in
int change = 0; 
int oddCount; // Keeps track of how many times the ball hits an odd numbered segment
float picNo; // Used to create random number 
int picNo2; // For converted int number
PImage randompic;
PImage target;
PImage blood;
int [] picX = {0, 600/4, 600/2, 600/4 * 3}; // Array containing x coordinates of the top left corner of each segment to place target images
int [] picY = {0, 400/4, 400/2, 400/4 * 3}; // y coordinates for target images
String [] targetPic = {"hitler", "binladen", "sadam", "stalin", "drevil", "bieber", "bigfoot","iceking"};// Contians all the names of the pictures to be used as targets
SoundCipher note = new SoundCipher(this);
SCScore myScore = new SCScore();
double [] noteArray = new double [16]; // Creates new empty double array to store nores in
int i;
int i2;
int i3;
int pitch;
int alpha,alpha2;
int move;
int ss; // Used to number screen shots
int self; // Used to number pictures taken by camera 
int self2; // Holds value of the newest picture taken by camera to load back into game
int shotCount = 0; // Counts now many target pictures have been shot
Movie d5; // Sets up d5 to have video loaded into later
Capture cam; // To use video from webcam
PImage selfie;
boolean pause; // Used to tell if game is paused
boolean selfieTaken; // To say if camera picture has been taken or not
int picSelect;
int billy;
AudioPlayer gun;
AudioPlayer camSound;

void setup()
{ 
  size(600,400);
  noLoop(); // Starts game paused
  smooth();
  x1= width/2;
  y2= height/2;  
  y1= y2;
  ballPos = 0;
  oddCount = 0;
  randoms();
  picNo=random(1,15); // Picks a random float valve between 1 and 14
  picNo2 = int (picNo); // Converts float value to int (whole number)
  randompic = loadImage(picNo2 +".jpg"); // Takes my random whole number and adds .jpg extention to allow for random image to be chosen
  target = loadImage(targetPic[i3]+".jpg"); // takes a random name from string array, adds .jpg to load a random image
  blood = loadImage("blood.gif");
  cursor(CROSS); // Changes mouse icon to a cross
  alpha = 0;
  alpha2 = 1;
  move = 0;
  ss = 1;
  self = 1; // Used to number pictures taken by camera.It will increment after each pic.
  self2 = self -1; // Holds value of the newest picture taken by camera to load back into game.
  d5 = new Movie(this, "killHitler.mov"); // Loads my video into d5
  cam = new Capture(this); // Initializes webcam
  cam.start(); // Starts webcam taking video
  pause = false;
  selfieTaken = false;
  billy = 1;
  velocityX = ballSpeed(billy); // Move ball on x-axis using value returned from ballSpeed function
  velocityY = ballSpeed(billy); // Move ball on y-axis using value returned from ballSpeed function
  minim = new Minim(this);
  gun = minim.loadFile("barretaM9.wav", 2048); // Loads audio file for gun sfx
  camSound = minim.loadFile("camera.wav", 2048); // Loads audio file for camera sfx
}
 
void draw()
{
  background(randompic); // Adds random game background image
  smooth();
  game();
  ballSpeed(velocityX); 
  if(pause == true) // When game is paused
  {
    fill(alpha,alpha,0,alpha); // Same variable used to incrament colour and alpha(transparency)
    textSize(100);
    text("PAUSED",width/2 - 190, height/2);
    alpha = alpha + alpha2; // Incrases alpha causing test to fade in and colour value to increase
    if(alpha <= 0 || alpha >= 300) // I allowed it to go out of range in the higher values to allow a little time before fading out again
      alpha2 = alpha2*-1; // Changes value from positive to negative and visa versa to cause fade in and out effect
  }
}

void game() // Calls functins required for game
{ 
  gridDivision(x1,y2); // Return function where x1 and y2 will be subbed it 
  lines();
  centerLine();
  drawPaddles();
  ballBounce();
  
  if(shotCount == 5) // If 5 target pictures have been shot
  {
    move = 0; // Stops ball and paddles moving
    d5.play(); // Plays my video
    image(d5,0,0); // Displays video onscreen
    if(d5.time() >= d5.duration()) // .time keeps track of vidoes playback position.When time reaches .duration(end of video) 
    {
      shotCount = 0; // Resets shotCount
      move = 1; // Starts ball and paddles moving again
      d5.stop(); // Stops video
      d5.jump(0); // Jumps to frame 0 (rewinds video)
      randoms(); // Calls randoms function to generate new random values
      randompic = loadImage(picNo2 +".jpg"); // New value for picNo2 loads new image into randompic
      background(randompic); // Background is changed to new pic
    }
  }
}

void movieEvent(Movie m) // Called when my video has a new frame available 
{
  m.read(); // Captures frames from video
}

void keyPressed()  // Allows for interaction using keys
{
  if (key == 's') // When s is pressed 
    {
      loop(); // To start the game
      if(move == 1) // If ball and paddles are moving  
      {
        alpha = 0; // Resets Alpha each time paused so it text always fades in each time
        move = 0; // Stops ball and paddles moving causing pause effect
        pause = true; // Starts pause text from code in draw.I used this so i can stop the ball in other situations (like playing video) without text appearing
      }
      
      else // When ball and paddles are not moving
      {
        move = 1; // Starts ball and paddles moving causing resume effect
        pause = false; // This will stop pause text appearing
      }
    }
    
    if(key == 'a')
    {
      float duration = random(0.5,2); // random value for note duration
      for(int a = 0; a < noteArray.length; a++)
      {
        myScore.addNote(a, noteArray[a], 100, duration); // Adds a note to score, incraments the beat position and position in noteArray and adds that note.This continues until all notes stored in noteArray have been added. 
        a += duration; // Spaces the notes out by adding the duration to the beat position
      }
    }

    if(key == 'z')
    {
      saveFrame("ScreenShot" + ss + ".jpg"); // saveFrame creates a jpg of the current frame. ss starts = 1 so first pic is named ScreenShot1.jpg
      ss++; // ss is then incramented so a new pic and be created instead of overwriting the first (ScreenShot2.jpg then ScreenShot3.jpg etc.)
      camSound.play(); // Plays camera sound
      camSound.rewind(); // Rewinds camera sound to be ready to use again
    }  

      if(key == CODED)
      {
      if (keyCode == ESC)
        myScore.writeMidiFile("D:/Users/Win-7.32/Desktop/myScore.mid"); // Creates a midi file of the notes stored in myScore
      } 
}

void lines() // Draws the lines to divide the screen into segments
{
  stroke(255,75);// Partially transparent so not distracting
  line(width/2,0,width/2,height); 
  line(width/4,0,width/4,height);
  line(width/4 * 3,0,width/4 * 3,height);
  line(0,height/2,width,height/2);
  line(0,height/4,width,height/4);
  line(0,height/4 * 3,width,height/4 * 3);
}

void drawPaddles()
{  
  fill(255);
  rect(10, y1 - 25, 5, 50); // left paddle
  rect(width - 15, y1 - 25, 5, 50); // right paddle
  if(y2 >= 25 && y2 <= height -25)// Keeps paddles inbounds
    y1 = y2;
  if(y1 - 25 <= 0)// y1 is center of paddle hence -25
    y1 = 25;
  if(y1 + 25 >= height)
    y1 = height - 25;
}

void ballBounce()
{
  ellipse(x1,y2,10,10); // Ball
  x1 = x1 + velocityX * move; // Moves the ball by adding 5 to the x co-ordinate (multiplied by either 0 or 1 to stop or start animation,controlled by keypress s)
  y2 = y2 + velocityY * move; // Moves the ball by adding 2 to the y co-ordinate
  
  if (x1 + 5 >= width - 15 && x1 + 5 <= width - 10) // If ball hits right paddle
    velocityX = velocityX * -1; // Reverses the direction of ball
  
     
  if (x1 - 5 >= 10 && x1 - 5 <= 15) // If ball hits left paddle
    velocityX = velocityX * -1; // Reverses the direction of ball
  
  
  if (y2 - 5 <= 0 || y2 + 5 >= height)
    velocityY = velocityY * -1; // Causes ball to bounce off top and bottom of screen
}

int ballSpeed(int currentspeed)
{
  
  velocityX = currentspeed;
  if (keyPressed)
  {
    if(key == CODED)
        {
          if(keyCode == LEFT) // If left arrow is pressed
          {
            if(velocityX >= 0) // If velocityX is positive
              velocityX--; // Subtract from velocityX to slow down
              
            if(velocityX <= 0) // If velocityX is negative
              velocityX++; // Add to velocityX to slow down
          }
            
          if(keyCode == RIGHT) // If right arrow is pressed
          {
            if(velocityX <= 0) // If velocityX is negative
              velocityX--; // Subtract from velocityX to speed up
              
            if(velocityX >= 0) // If velocityX is positive
              velocityX++; // Add to velocityX to speed up 
          } 
        } 
  }
  if (velocityX >= 5) // Keeps top speed to a limit of 5
    velocityX = 5;
    
  if (velocityX <= -5)
    velocityX = -5; 
  return velocityX; // Sends new value back 
}

void centerLine()
{
  stroke(255); // White line colour
  for (int i = 0; i < height; i = i + 20) // Draws a vertical line in center of screen 10 pixels long then adds 20 to original y value (0) and repeats process until it reaches the bottom of the screen 
    line (width/2,i,width/2,i + 10);
}

void gridDivision(int ellipseX, int ellipseY) // Return function where x1 and y2 are subbed into ellipseX and ellipseY
{
  fill(c,75); // random rgb colour partially transparent so not distracting
  noStroke(); // No outline on shapes
  if(oddCount % 5 == 0) // If ball hits 5 odd segments
    note.instrument(random(127)); // Random instrument is selected
  
  change = ballPos; // These values are made the same at the start of each frame
  
  if(ellipseX <= width/4 && ellipseY <= height/4) // Defines the area of a segment and says if the ball enters do...
  {
    rect(0,0,width/4,height/4); // Puts a rectangle into the segment
    ballPos = 1; // Gives a value to the segment
  }

  if(ellipseX <= width/2 && ellipseX >= width/4 && ellipseY <= height/4)
  {
    rect(width/4,0,width/4,height/4);
    ballPos = 2;
  }
    
  if(ellipseX <= width/4 * 3 && ellipseX >= width/2 && ellipseY <= height/4)
  {
    rect(width/2,0,width/4,height/4);
    ballPos = 3;
  }
    
  if(ellipseX <= width && ellipseX >= width/4 * 3 && ellipseY <= height/4)
  {
    rect(width/4 * 3,0,width/4,height/4);
    ballPos = 4;
  }
  
  if(ellipseX <= width/4 && ellipseX >= 0 && ellipseY <= height/2 && ellipseY >= height/4)
  {
    rect(0,height/4,width/4,height/4);
    ballPos = 5;
  }
  
   if(ellipseX <= width/2 && ellipseX >= width/4 && ellipseY <= height/2 && ellipseY >= height/4)
  {
    rect(width/4,height/4,width/4,height/4);
    ballPos = 6;
  }
  
   if(ellipseX <= width/4 * 3 && ellipseX >= width/2 && ellipseY <= height/2 && ellipseY >= height/4)
  {
    rect(width/2,height/4,width/4,height/4);
    ballPos = 7;
  }
  
   if(ellipseX <= width && ellipseX >= width/4 * 3 && ellipseY <= height/2 && ellipseY >= height/4)
  {
    rect(width/4 * 3,height/4,width/4,height/4);
    ballPos = 8;
  }
  
    if(ellipseX <= width/4 && ellipseX >= 0 && ellipseY <= height/4 * 3 && ellipseY >= height/2)
  {
    rect(0,height/2,width/4,height/4);
    ballPos = 9;
  }
  
    if(ellipseX <= width/2 && ellipseX >= width/4 && ellipseY <= height/4 * 3 && ellipseY >= height/2)
  {
    rect(width/4,height/2,width/4,height/4);
    ballPos = 10;
  }
  
    if(ellipseX <= width/4 * 3 && ellipseX >= width/2 && ellipseY <= height/4 * 3 && ellipseY >= height/2)
  {
    rect(width/2,height/2,width/4,height/4);
    ballPos = 11;
  }
  
    if(ellipseX <= width && ellipseX >= width/4 * 3 && ellipseY <= height/4 * 3 && ellipseY >= height/2)
  {
    rect(width/4 * 3,height/2,width/4,height/4);
    ballPos = 12;
  }
  
    if(ellipseX <= width/4 && ellipseX >= 0 && ellipseY <= height && ellipseY >= height/4 * 3)
  {
    rect(0,height/4 * 3,width/4,height/4);
    ballPos = 13;
  }
  
    if(ellipseX <= width/2 && ellipseX >= width/4 && ellipseY <= height && ellipseY >= height/4 * 3)
  {
    rect(width/4,height/4 * 3,width/4,height/4);
    ballPos = 14;
  }
  
    if(ellipseX <= width/4 * 3 && ellipseX >= width/2 && ellipseY <= height && ellipseY >= height/4 * 3)
  {
    rect(width/2,height/4 * 3,width/4,height/4);
    ballPos = 15;
  }
  
    if(ellipseX <= width && ellipseX >= width/4 * 3 && ellipseY <= height && ellipseY >= height/4 * 3)
  {
    rect(width/4 * 3,height/4 * 3,width/4,height/4);
    ballPos = 16;
  }
    if(ballPos == 1 && change != 1) // Each time the ball enters a new segment ballPos takes the value of the segment.This will be different to change until the code loops again allowing this to run for 1 frame 
    {
      randoms(); // Calls randoms function that generates random values.I call in here so it will only run for 1 frame instead of constantly creating numbers that aren't needed
      note.playNote(pitch,75,1); // Plays a soundCipher note with a random pitch generated by randoms()
      noteArray[0] = pitch; // Puts the random note value into the array at a position assigned to the segment
      oddCount++;
    }
    if(ballPos == 2 && change != 2)
    {
      note.playNote((ballPos * 5),75,1);
      noteArray[1] = ballPos * 5; 
    }
    if(ballPos == 3 && change != 3)
    {
      randoms();
      note.playNote(pitch,75,1);
      noteArray[2] = pitch;
      oddCount++;
    }
    if(ballPos == 4 && change != 4)
    {
      note.playNote((ballPos * 5),75,1);
      noteArray[3] = ballPos * 5; 
    }
    if(ballPos == 5 && change != 5)
    {
      randoms();
      note.playNote(pitch,75,1);
      noteArray[4] = pitch;
      oddCount++;
    }
    if(ballPos == 6 && change != 6)
    {
      note.playNote((ballPos * 5),75,1);
      noteArray[5] = ballPos * 5;
    }
      if(ballPos == 7 && change != 7)
    {
      randoms();
      note.playNote(pitch,75,1);
      noteArray[6] = pitch;
      oddCount++;
    }
    if(ballPos == 8 && change != 8)
    {
      note.playNote((ballPos * 5),75,1);
      noteArray[7] = ballPos * 5; 
    }
    if(ballPos == 9 && change != 9)
    {
      randoms();
      note.playNote(pitch,75,1);
      noteArray[8] = pitch;
      oddCount++;
    }
    if(ballPos == 10 && change != 10)
    {
      note.playNote((ballPos * 5),75,1);
      noteArray[9] = ballPos * 5; 
    }
    if(ballPos == 11 && change != 11)
    {
      randoms();
      note.playNote(pitch,75,1);
      noteArray[10] = pitch;
      oddCount++;
    }
    if(ballPos == 12 && change != 12)
    {
      note.playNote((ballPos * 5),75,1);
      noteArray[11] = ballPos * 5; 
    }
    if(ballPos == 13 && change != 13)
    {
      randoms();
      note.playNote(pitch,75,1);
      noteArray[12] = pitch;
      oddCount++;
    }
    if(ballPos == 14 && change != 14)
    {
      note.playNote((ballPos * 5),75,1);
      noteArray[13] = ballPos * 5; 
      cam.read(); // Reads video from webcam
      image(cam, 0, 0); // Displays webcam image on screen  
      saveFrame("selfie" + self + ".jpg"); // A jpg is created of the current frame with the webcam displayed (takes photo of you).Pics are named using same method as screen shots
      camSound.play();
      camSound.rewind();
      self++;
      self2 = self -1; // Holds the value of the most recent picture taken so it can loaded later
      selfieTaken = true; // Used so the program won't try use camera pic before one is taken
    }
    if(ballPos == 15 && change != 15)
    {
      randoms();
      note.playNote(pitch,75,1);
      noteArray[14] = pitch;
      oddCount++;
    }
    if(ballPos == 16 && change != 16)
    {
      note.playNote((ballPos * 5),75,1);
      noteArray[15] = ballPos * 5; 
    }
    
    if(ballPos % 2 != 0) // When in odd segment
    {
      if(selfieTaken == false)// If no camera picture has been taken yet                                                                                                             
        {                                                                                                                                     
        target = loadImage(targetPic[i3]+".jpg"); // Picks random name from targetPic string and adds .jpg to select random inage
        } 
        if(selfieTaken == true) //If a camera picture has been taken
        {
          if(picSelect == 0) // A random between 0 and 8 is generated giving 9 possible values.There are 8 pic names in the string array + one camera pic.This gives an equal 1 in 9 odds of it using the camera pic or one of the original target pics 
            target = loadImage("C:/C.H/Collage/Processing/Hamilton_12062774_ENDTERM/selfie" + self2 + ".jpg"); // The path to the file is needed as the pictures are stored in the main directory not the data folder
          else
            target = loadImage(targetPic[i3]+".jpg"); // Loads image using string array
        }
      image(target,picX[i],picY[i2],width/4,height/4); // Puts image in random segment
      target(); // Calls function to display a target at mouse position    
    }
}

void mousePressed()
{
  if(mouseX >= picX[i] && mouseX <= picX[i] + width/4 && mouseY >= picY[i2] && mouseY <= picY[i2] + height/4 && move == 1 && ballPos % 2 != 0) // if mouse is pressed in the same area as the target picture && game isn't paused(no cheating)
      {                                                                                                                                        // && ball has to be in odd segment as the i values(pic position) don't change until ball
        gun.play();                                                                                                                            // enters another odd segment so without this if the ball went from odd to even you could
        gun.rewind();                                                                                                                          // still score from shooting where the pic was.(again no cheating!)
        image(blood,picX[i],picY[i2],width/4,height/4); // Displays a flash of blood if target pic is hit                                      
        shotCount++; // Counts how many targets have been shot                                                                                 
      }                                                                                                                                        
}

void target() // Draws a target centered at mouse position
{ 
  stroke(255,0,0);
  noFill();
  line(mouseX - 20, mouseY,mouseX + 20, mouseY);
  line(mouseX, mouseY - 20,mouseX, mouseY + 20);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, 30, 30); 
}

void randoms() // Creates random values when needed
{
  i = (int) random(picX.length);
  i2 = (int) random(picY.length);
  i3 = (int) random(targetPic.length);
  pitch = (int) random(20,100);
  picNo=random(1,15); // Picks a random float valve between 1 and 14
  picNo2 = int (picNo); // Converts float value to int (whole number)
  picSelect = (int)random (9);
}







