
//Extra features include: Automatic Shutdown Timer, which closes the program after roughly three minutes. This makes use of the exit() and second() functions. 
//                        Roughly every 3 second a variable takes away one from the timer and when the timer reaches 0, the exit() function is activated and 
//                        closes the program

//                        Volume Control, which allows the user to increase and decrease the velocity of the notes. The velocity is controlled using the 'UP' 
//                        and 'DOWN' keys. If 'UP' is pressed the velocity is increased, and if 'DOWN' is pressed, the velocity is decreased

//                        Hidden Cursor, that stop the cursor from being viewed in front of the program. This is a novelty feature as it only stops the cursor 
//                        getting in the way of the program

//                        Instructions, so that the users understand how to use the program. It includes the values of the notes contained in each segment, 
//                        when the program will shut down, how to increase/decrease the volume and the speed of the ball and how to save the MIDI note properly 





import arb.soundcipher.*;//importing the soundcipher library
import arb.soundcipher.constants.*;

SCScore score = new SCScore();//adding a new score

SoundCipher aSample = new SoundCipher(this);//adding sound samples

int [] notes = {50, 37, 11, 98, 42, 76, 9, 14, 110, 66, 87, 39, 82, 47, 78, 124};//an array containing notes which will be played as the ball enters diffent segments

int velocity;//variable for velocity of notes
float duration;//variable for duration of notes
float noteDuration;//variable for duration of notes in the score
float beat;//variable for which beat a note plays

boolean pause = false;//variables used to determine whether or not the programme should be paused
int determinePause = 1;
int g = 1;

float timeCount;//variable used to determine when the program shuts down automatically

int fiveTimeOdd;//variable used to determine whether the instrument should be changed

int x, y;//variables relating to the ball, it's direction and the paddles
int a, b;
int velX, velY;

int ballSpeed;//variables which determine the speed of the ball
int currentSpeed;

int red1, green1, blue1;//variables that determine the color of the ball, paddles and the background
int red2, green2, blue2;





void setup()//code to setup the program screen and give the variables values
{
  frameRate(60);
  background(red2, green2, blue2);
  size(500, 350);  
  red1 = 255;
  green1 = 255;
  blue1 = 255;
  red2 = 101;
  green2 = 206;
  blue2 = 216;
  a = 10;
  x = width/2;
  y = 30;
  fiveTimeOdd = 1;
  velX = 2;
  velY = 2;
  currentSpeed = 1;
  velocity = 75;
  duration = 0.1;
  noteDuration = 1;
  beat = 0;
  timeCount = 1;
}





void draw()//code to draw the program
{
    background(red2, green2, blue2);
    gridDivision();
    ball();
    ballBounce();
    drawPaddles();
    cursorHidden();
    questionFourA();
    questionFourB();
    questionFourC();
    questionFourD();
    println("segment 1 note equals:" + "\t" + notes[0]);//shows the values of the odd segments' notes
    println("segment 2 note equals:" + "\t" + notes[1]);
    println("segment 3 note equals:" + "\t" + notes[2]);
    println("segment 4 note equals:" + "\t" + notes[3]);
    println("segment 5 note equals:" + "\t" + notes[4]);
    println("segment 6 note equals:" + "\t" + notes[5]);
    println("segment 7 note equals:" + "\t" + notes[6]);
    println("segment 8 note equals:" + "\t" + notes[7]);
    println("segment 9 note equals:" + "\t" + notes[8]);
    println("segment 10 note equals:" + "\t" + notes[9]);
    println("segment 11 note equals:" + "\t" + notes[10]);
    println("segment 12 note equals:" + "\t" + notes[11]);
    println("segment 13 note equals:" + "\t" + notes[12]);
    println("segment 14 note equals:" + "\t" + notes[13]);
    println("segment 15 note equals:" + "\t" + notes[14]);
    println("segment 16 note equals:" + "\t" + notes[15]);
    println("");
    timer();//when this reaches the value of 120 the program will close
    println("");
    println("Press 'RIGHT' to increase the ball's speed" + "\t" + "Press 'LEFT' to decrease the ball's speed");
    ballSpeed();//shows the value of the ball's speed (which it's values range from 1 to 5)
    println("");
    println("Press 'UP' to increase the volume" + "\t" + "Press 'DOWN' to decrease the volume");
    println("Volume Level:" + "\t" + velocity + "/127");//shows the value of the velocity (which it's values range from 1 to 127)
    println("");
    println("<please ensure to press the 'w' key before pressing the 'Esc' key!>");
    println("");
    println("<user indtructions above>");//warning to the user so that 
    println("");
}





void gridDivision()//code to draw the lines that divide the screen
{
  stroke(1);
  fill(0);
  
  line(width/4, 0, width/4, height);
  line(width/2, 0, width/2, height);
  line(width/4 * 3, 0, width/4 * 3, height);
  
  line(0, height/4, width, height/4);
  line(0, height/2, width, height/2);
  line(0, height/4 * 3, width, height/4 * 3);
}





void ball()//code to draw the ball
{
  fill(red1, green1, blue1);//colour
  ellipse(x, y, 30, 30);//size
  
  x = x + velX;//allows the ball to move
  y = y + velY;
    
  if(x > width + 15)//resets the ball if it exceeds the width of the screen
  {
    x = width/2;
    y = height/2;
    velX = velX * -1;
  }
  
  if(x < -15)
  {
    x = width/2;
    y = height/2;
    velX = velX * -1;
  }
}





void ballBounce()//code for the ball's bouncing direction
{
  if(y > height - 15 || y < 15)//allows the ball to bounce off the bottom and top of the screen
  {
    velY = velY * -1;
  }

  if(x < 35 && y > b - 55 && y < b - 32.5)//gives the ball a different direction to it's bounce depending on where it hits the paddle
  {
    if(velY > 0)//determining factor
        {
          velY = velY * -1;
          velX = velX * -1;
        }
        
    else 
        {
          velX = velX * -1;
        }
   }    
    
  if(x < 35 && y > b - 32.5 && y < b)//gives the ball a different direction to it's bounce depending on where it hits the paddle
        {
          velX = velX * -1;
        }

  if(x < 35 && y > b && y < b + 32.5)//gives the ball a different direction to it's bounce depending on where it hits the paddle
        {
          velX = velX * -1;
        }

  if(x < 35 && y > b + 32.5 && y < b + 55)//gives the ball a different direction to it's bounce depending on where it hits the paddle
      {
        
        if(velY < 0)//determining factor
          {
            velY = velY * -1;
            velX = velX * -1;
          }
        
        else
          {
            velX = velX * -1;
          }
      }
    
  if(x > width - 35 && y > b - 55 && y < b - 32.5)//gives the ball a different direction to it's bounce depending on where it hits the paddle
    {
      if(velY > 0)//determining factor
        {
          velY = velY * -1;
          velX = velX * -1;
        }
      else 
        {
          velX = velX * -1;
        }
    }    
    
  if(x > width - 35 && y > b - 32.5 && y < b) //gives the ball a different direction to it's bounce depending on where it hits the paddle 
    {
      velX = velX * -1;
    }

  if(x > width - 35 && y > b - 1 && y < b + 32.5)//gives the ball a different direction to it's bounce depending on where it hits the paddle
    {
      velX = velX * -1;
    }

  if(x > width - 35 && y > b + 32.5 && y < b + 55)//gives the ball a different direction to it's bounce depending on where it hits the paddle
    {
      if(velY < 0)//determining factor
        {
          velY = velY * -1;
          velX = velX * -1;
        }
      
      else
        {
          velX = velX * -1;
        }
    }    
}





void drawPaddles()//code to draw the paddles
{
  fill(red1, green1, blue1);//colour
  rectMode(CENTER);
  rect(a, b, 20, 80);//size
  
  if(b > height - 40)//this stops the paddle from leaving the screen
  {
    b = height - 40;
  }
  
  if(b < 40)
  {
    b = 40;
  }
  
  fill(red1, green1, blue1);//colour
  rectMode(CENTER);
  rect(width - 10, b, 20, 80);//size
  
  if(b > height - 40)//this stops the paddle from leaving the screen
  {
    b = height - 40;
  }
  
  if(b < 40)
  {
    b = 40;
  }
  
  if(y > b)//this causes the paddles to follow the ball's current location
  {
    b = b + 1;
  }
  
  if(y < b)
  {
    b = b - 1;
  }  
}





//to hide the cursor from the screen
void cursorHidden()
{
  if(mousePressed == false)
  {
    noCursor();
  }
  else
  {
    cursor(HAND);
  }
}





//if the ball is in an odd numbered segment, a random note message is sent to the java sound synthesizer and it's value is stored in the "notes" array
void questionFourA()
{
  if(x < width/4 && y < height/4)//Segment 1
  {
    if(frameCount % 20 == 0)//roughly every 3 seconds the ball is within the segment
    {
     aSample.playNote(notes[0], velocity, duration);//plays note
     notes[0] = (int) random(127);//changes current note to a random one
     fiveTimeOdd += 1;//adds 1 to the current fiveTimeOdd value
    }
  }

  if(x < width/4 && y < height/2 && y > height/4)//Segment 5
  {
    if(frameCount % 20 == 0)
    {
     aSample.playNote(notes[4], velocity, duration);//plays note 
     notes[4] = (int) random(127);//changes current note to a random one
     fiveTimeOdd += 1;//adds 1 to the current fiveTimeOdd value
    }
  }

  if(x < width/4 && y > height/2 && y < height/4*3)//Segment 9
  {
    if(frameCount % 20 == 0)
    {
     aSample.playNote(notes[8], velocity, duration);//plays note 
     notes[8] = (int) random(127);//changes current note to a random one
     fiveTimeOdd += 1;//adds 1 to the current fiveTimeOdd value
    }
  }
  
  if(x < width/4 && y > height/4*2) //Segment 13
 {
   if(frameCount % 20 == 0)
   {
     aSample.playNote(notes[12], velocity, duration);//plays note
     notes[12] = (int) random(127);//changes current note to a random one
     fiveTimeOdd += 1;//adds 1 to the current fiveTimeOdd value
   }
 } 


  if(x > width/2 && x < width/4 * 3 && y < height/4)//Segment 3
  {
    if(frameCount % 20 == 0)
    {
       aSample.playNote(notes[2], velocity, duration);//plays note 
       notes[2] = (int) random(127);//changes current note to a random one
       fiveTimeOdd += 1;//adds 1 to the current fiveTimeOdd value
    }
  }

  if(x > width/2 && x < width/4*3 && y < height/2 && y > height/4)//Segment 7
  {
      if(frameCount % 20 == 0)
   {
     aSample.playNote(notes[6], velocity, duration);//plays note
     notes[6] = (int) random(127);//changes current note to a random one
     fiveTimeOdd += 1;//adds 1 to the current fiveTimeOdd value 
   }
  }

  if(x > width/2 && x < width/4*3 && y > height/2 && y < height/4*3)//Segment 11
  {
    if(frameCount % 20 == 0)
    {
     aSample.playNote(notes[10], velocity, duration);//plays note 
     notes[10] = (int) random(127);//changes current note to a random one
     fiveTimeOdd += 1;//adds 1 to the current fiveTimeOdd value
    }
  }

  if(x > width/2 && x < width/4*3 && y > height/4*3)//Segment 15
  {
    if(frameCount % 20 == 0)
    {
     aSample.playNote(notes[14], velocity, duration);//plays note 
     notes[14] = (int) random(127);//changes current note to a random one
     fiveTimeOdd += 1;//adds 1 to the current fiveTimeOdd value
    }
  } 
}





//every five times the ellipse enters an odd segment, the instrument changes
void questionFourB()
{
  if(fiveTimeOdd == 5)//if the ellipse enters an odd segment for the fifth time, the instrument changes
  {
    aSample.instrument(random(127));
  }
  
  if(fiveTimeOdd > 5)//once the counter reaches 5, it reverts back to it's original value of 1 
  {
    fiveTimeOdd = 1;
  }
}





//when the ball is in an even numbered segment, a note message of five times the segment's value is sent to the java sound synthesizer, and the note is stored in the "notes" array at that position
void questionFourC()
{
  if(x > width/4 && x < width/2 && y < height/4)//Segment2
  {
    if(frameCount % 20 == 0)//roughly every 3 seconds
    {
      notes[1] = 10;
      aSample.playNote(notes[1], velocity, 1);//plays note 
    }
  }
  
  if(x > width /4 && x < width/2 && y > height/4 && y < height/2)//Segment 6
  {
    if(frameCount % 20 == 0)
    {
      notes[5] = 30;
      aSample.playNote(notes[5], velocity, 2);//plays note 
    }
  }
  
  if(x > width/4 && x < width/2 && y > height/2 && y < height/4*3)//Segment 10
  {
    if(frameCount % 20 == 0)
    {
      notes[9] = 50;
      aSample.playNote(notes[9], velocity, 0.5);//plays note 
    }
  }
  
  if(x > width/4 && x < width/2 && y > height/4*3)//Segment 14
  {
    if(frameCount % 20 == 0)
    {
      notes[13] = 70;
      aSample.playNote(notes[13], velocity, 1);//plays note 
    }
  }
  
  if(x > width/4*3 && y < height/4)//Segment 4
  {
    if(frameCount % 20 == 0)
    {
      notes[3] = 20;
      aSample.playNote(notes[3], velocity, 1);//plays note 
    }
  }
  
  if(x > width/4*3 && y > height/4 && y < height/2)//Segment 8
  {
    if(frameCount % 20 == 0)
    {
      notes[7] = 40;
      aSample.playNote(notes[7], velocity, 1);//plays note 
    }
  }
  
  if(x > width/4*3 && y > height/2 && y < height/4*3)//Segment 12
  {
    if(frameCount % 20 == 0)
    {
      notes[11] = 60;
      aSample.playNote(notes[11], velocity, 2);//plays note 
    }
  }
  
  if(x > width/4*3 && y > height/4*3)//Segment 16
  {
    if(frameCount % 20 == 0)
    {
      notes[15] = 80;
      aSample.playNote(notes[15], velocity, 2);//plays note
    }
  }
}





//if the ball enters segment 14, it causes an action of choice
void questionFourD()
{
  if(x > width/4 && x < width/2 && y > height/4*3)//Segment 14
  {
    if(frameCount % 20 == 0)//roughly every 3 seconds
      {
         red1 = (int) random(255);//causes a random colour change in the ball, paddles and background
         green1 = (int) random(255);
         blue1 = (int) random(255);
        
         red2 = (int) random(255);
         green2 = (int) random(255);
         blue2 = (int) random(255);
      }
  }
}





void timer()
{
  int s = second();
  
  if(s % 3 == 0);
  {
    timeCount = timeCount + 0.01;
  }

  if(timeCount > 120)
  {
    exit();
  }
  
  println("Time Left Before Automatic Shut-Down:" + "\t" + (120 - timeCount));//shows how much time is left
}





//this function allows the user to see the speed of the ball visually
void ballSpeed()
{
  ballSpeed = velX;
  ballSpeed = ballSpeed/2;
  if(ballSpeed < 0)
    {
      ballSpeed = ballSpeed * -1;
    }
  println("Speed of Ball:" + "\t" + ballSpeed + "/5");//shows the value of the speed of the ball between 1-5
}





void keyPressed()
{

  if(key == 's')// pausing/resuming the animation
  {
   g = g * -1;
  }
  
  if(g == 1)
  {
    pause = false;
  }

  if(g == -1)
  {
     pause = true;
  }
        
  if(pause == true)
  {
     noLoop();
  }
  
  else if(pause == false)
  {
     loop();
  }



  //controlling the speed of the of the ball    
  if(keyCode == LEFT)//decreases the speed of the ball
  {
    velX = velX/currentSpeed;
    velY = velY/currentSpeed;
    currentSpeed = currentSpeed - 1;
    if(currentSpeed < 1)//stops the ball from stopping
    {
      currentSpeed = 1;
    }
    velX = velX * currentSpeed;
    velY = velY * currentSpeed;
  }
    
  if(keyCode == RIGHT)//increases the speed of the ball
  {    
    velX = velX/currentSpeed;
    velY = velY/currentSpeed;
    currentSpeed = currentSpeed + 1;
    if(currentSpeed > 4)//stops the ball from moving to quickly
    {
      currentSpeed = 5;
    }
    velX = velX * currentSpeed;
    velY = velY * currentSpeed;
  }



//controlling the volume of the notes
  if(keyCode == UP)//raises the volume
  {
    velocity = velocity + 2;
    if(velocity > 127)
    {
      velocity = 127;
    }
  }
  
  if(keyCode == DOWN)//lowers the volume
  {
    velocity = velocity - 2;
    if(velocity < 1)
    {
      velocity = 1;
    }
  }
    


//pressing the 'ESC' button will cause the program to save the current score that has played  
  if(keyCode == ESC)
  {
    score.writeMidiFile("/Users/p12131989/Desktop/demo.mid");
  }
    
    
        
//in case of the ball glitching or disappearing, the 'r' button resets the ball to the center of the screen    
  if(key == 'r')// resets the ball
  {
    x = width/2;
    y = height/2;
  }  



//pressing the 'w' button will add the current notes from the "notes" array to the score  
  if(key == 'w')
    {
      score.addNote(beat, notes[0], 100, noteDuration);//adds note to score
      beat += noteDuration;//seperates each note
      score.addNote(beat, notes[1], 100, noteDuration);
      beat += noteDuration;
      score.addNote(beat, notes[2], 100, noteDuration);
      beat += noteDuration;
      score.addNote(beat, notes[3], 100, noteDuration);
      beat += noteDuration;
      score.addNote(beat, notes[4], 100, noteDuration);
      beat += noteDuration;
      score.addNote(beat, notes[5], 100, noteDuration);
      beat += noteDuration;
      score.addNote(beat, notes[6], 100, noteDuration);
      beat += noteDuration;
      score.addNote(beat, notes[7], 100, noteDuration);
      beat += noteDuration;
      score.addNote(beat, notes[8], 100, noteDuration);
      beat += noteDuration;
      score.addNote(beat, notes[9], 100, noteDuration);
      beat += noteDuration;
      score.addNote(beat, notes[10], 100, noteDuration);
      beat += noteDuration;
      score.addNote(beat, notes[11], 100, noteDuration);
      beat += noteDuration;
      score.addNote(beat, notes[12], 100, noteDuration);
      beat += noteDuration;
      score.addNote(beat, notes[13], 100, noteDuration);
      beat += noteDuration;
      score.addNote(beat, notes[14], 100, noteDuration);
      beat += noteDuration;
      score.addNote(beat, notes[15], 100, noteDuration);
    }
}

