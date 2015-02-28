
import arb.soundcipher.*;
import arb.soundcipher.constants.*;

//Feature 1 = Displaying of notes on each segment.
//Feature 2 = Notes played in pause screen when clicked on.
//Feature 3 = Ability to play score from pause screen by clicking on the play score button.
//Feature 4 = Mute Button in preview screen which mutes the background notes so you can hear the notes when you click on themin the preview screen easier to hear.
//Feature 5 = Can click on notes in preview and they play.


  //I would suggest to open this to full screen because the comments
  // trail much farther that the code, im sorry about this.

import arb.soundcipher.*;      //With this code I am importing the soundcipher library for use in the program
import arb.soundcipher.constants.*;

PFont font1;                  //Loading in a font

String input1;                //Creating string which will contain the info needed to show what notes have been played

SCScore myScore = new SCScore();    //Creating score for programm
SoundCipher notai = new SoundCipher(this);    //Loading soundcipher so the individual notes can be played

double [] noteArray = new double[16];    //Array in which the note pitch is saved and stored
String [] stringArray = {"-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-"};    //Array which stores the note sign for each segment, had to be written this way instead of the previous way
                                                                                              //because all the seperate postions had to initialised for the code to r
double  note;      //initialising variable which will be used to store the values for each note played and in the score                                                        
double rdur;        //initialising the variable i will use for the random durations between notes in the score
double mvelocity = 100;  //Initialising the variable i will use to determine the valure of the velocity of each note
int diam = 25;        //initialising the value for the diameter of the ball 

int xp, yp;          //parameters for the movement of the ball

int speed = 2;          //{
int velocityX = ballSpeed(speed);                                
int velocityY = ballSpeed(speed);    //Initialising the values which i shall use to control the movement and speed of the ball
int xdirection = 1;
int ydirection = 1;     //}

int rpX = 585;    //{ Initialising values used to draw the right paddle
int rpY = yp;     //}

int value = 1;    //{ Initialising values which will be used in order for the programm to know when the ball has moved from segment to the next
int change = 0;    //}

int counter = 0;    //Initialising counter used to change instruments

boolean paused = false;    //{
boolean preview = false;      //Initialising boolean variables which will be used to pause the game in certain ways }
boolean mute = false;
int recti = 255, balli = 255;    //Variables used in toning down the aplha of the shapes when the game is paused

int notesp = 0;      //Initialising variable which will be used as a counter which will count the amount of notes played in the duration the program has ran


void setup()
{
  size(600, 600);      //I wanted to have a nice large screen to play around with plus its a lot easier to see things on it
  smooth();            // Just to make the output look nicer and more appeasing to the eye
  stroke(255);        //I chose to have a white outline as I liked the simplistic look the programm had and I also think that it went well with the font i used
  rectMode(CENTER);    //I personally prefer to use the center mode as I am more comfortable with it
  ellipseMode(CENTER);    //^^Same as above^^
  xp = width/2;    //{ Giving values to the center of the ball, the center of the screen
  yp = height/2;    //}
  font1 = loadFont("EurostileRegular-48.vlw");    //Loading in the font which i will use for the programm
}

void draw()
{
  background(190);      //I liked the light grey of the background because oi though it gave the programm a very nice look
  gridDivision(xp, yp);    //The function which i used to divide up the grid and also the actions when the ball moves into each segment
  ballSpeed(speed);        //This function is used to dictate the speed of the moving ball
  ballBounce();            //This function is used to bounce the ball off the paddles and the walls
  paddles();               //This function draws and controls the movement of the paddles
  paused();                //This function determines when the game is paused
  preview();               //This function contains the code used for the secret score preview page!
  mute();
}

void ballBounce()      //Function for bouncing the ball off objects and walls
{

  stroke(ballColour(notesp), ballColour(notesp), 0, balli);            //{
  fill(ballColour(notesp), 0, ballColour(notesp), balli);                  //Code for the flight of the ball and its color and alpha which involves a seperate function
  xp = xp + (velocityX * xdirection);               
  yp = yp + (velocityY * ydirection);                                  //}

  if (yp > height - diam/2 || yp < diam/2)        //ball bouncing off top and bottom of screen
     ydirection = ydirection * -1;

  if (xp <= 35 || xp >= 565)                      //Ball bouncing of paddles
     xdirection = xdirection * -1;
  
  ellipse(xp, yp, diam, diam);            //The final drawing of the ball which finishes the function
}

void paddles()        //Function which draws the paddles
{
  float lpX = 15;       //{
  float rpY = yp;            //Initialising paddle co-ordinates
  float lpY = yp;      //{
  if(yp > 40 || yp < height - 40)    //Paddle follows the ball for a certain space in the game screen
       lpY = rpY = yp; 
  if(yp < 40)                        //Paddle stops when ball goes too far up so it dosnt go off the screen
    {lpY = 30; rpY = 30;}
  if(yp > height - 40)              //Paddle stops when the ball goes too far down so it dosnt go off the edge of the screen
  {lpY = 560; rpY = 560;}
    
  stroke(ballColour(notesp), ballColour(notesp), 0, balli);       //Changing the colour of the paddles in relation to the number of notes played       
  fill(255, 0, ballColour(notesp), balli);                       // "
  rect(rpX, rpY, 15, 70);                                        //Drawing right paddle
  rect(lpX, lpY, 15, 70);                                        //Drawing left paddle      
}

void gridDivision(int ellipseX, int ellipseY)    //Function for dividing up the grid and also the actions which happen when the ball moves into each segment of the grid
{
  int inst = (int) random(30);    //Initialising value which will be chosen at random - determing what instrument will play
  
  stroke(255);      //colour of the lines which make the grid
  line(width/4, 0, width/4, height);        //{
  line(width/2, 0, width/2, height);
  line(width/4*3, 0, width/4*3, height);          //Code for drawing the lines recquired to draw the grid
  line(0, height/4, width, height/4);
  line(0, height/2, width, height/2);
  line(0, height/4*3, width, height/4*3);    //}
  
  change = value;        //By setting them the same I will be able to expoit the differnece in them to recognise when the ball changes into the next segment
  
  if ( ellipseX < width/4 && ellipseY < height/4)                                //Setting the limits for the first segment, this done over the next 30 lines of code to seperate all the segments
    {
      value = 1;                                       //Setting the value for this segment
      noteValues(note, width/8 - 20, height/8, 0);    //Code so that everytime the ball goes in a segment the note that has been played in that segment will appear on it 
  }
  else if (ellipseX > width/4 && ellipseX < width/2 && ellipseY < height/4)      //Same as above, the rest of these pieces of code until i comment again
    {
      value = 2;
      noteValues(note, width/8*3 - 20, height/8, 1);
    }
  else if (ellipseX > width/2 && ellipseX < (width/4)*3 && ellipseY < height/4)
    {
      value = 3;
      noteValues(note, width/8*5 - 20, height/8, 2);
    }
  else if (ellipseX > (width/4)*3 && ellipseX < width && ellipseY < height/4)
    {
      value = 4;
      noteValues(note, width/8*7 - 20, height/8, 3);
    }
  if ( ellipseX < width/4 && ellipseY > height/4 && ellipseY < height/2)
    {
      value = 5;
      noteValues(note, width/8 - 20, height/8*3, 4);
    }
  else if (ellipseX > width/4 && ellipseX < width/2 && ellipseY > height/4 && ellipseY < height/2)
    {
      value = 6;
      noteValues(note, width/8*3 - 20, height/8*3, 5);
    }
  else if (ellipseX > width/2 && ellipseX < (width/4)*3 && ellipseY > height/4 && ellipseY < height/2)
    {
      value = 7;
      noteValues(note, width/8*5 - 20, height/8*3, 6);
    }
  else if (ellipseX > (width/4)*3 && ellipseX < width && ellipseY > height/4 && ellipseY < height/2)
    {
      value = 8;
      noteValues(note, width/8*7 - 20, height/8*3, 7);
    }
  else if ( ellipseX < width/4 && ellipseY > height/2 && ellipseY < (height/4)*3)
    {
      value = 9;
      noteValues(note, width/8 - 20, height/8*5, 8);
    }
  else if (ellipseX > width/4 && ellipseX < width/2 && ellipseY > height/2 && ellipseY < (height/4)*3)
    {
      value = 10;
      noteValues(note, width/8*3 - 20, height/8*5, 9);
    }
  else if (ellipseX > width/2 && ellipseX < (width/4)*3 && ellipseY > height/2 && ellipseY < (height/4)*3)
    {
      value = 11;
      noteValues(note, width/8*5 - 20, height/8*5, 10);
    }
  else if (ellipseX > (width/4)*3 && ellipseX < width && ellipseY > height/2 && ellipseY < (height/4)*3)
    {
      value = 12;
      noteValues(note, width/8*7 - 20, height/8*5, 11);
    }
  if (ellipseX < width/4 && ellipseY > height/4 && ellipseY > (height/4)*3 && ellipseY < height)
    {
      value = 13;
      noteValues(note, width/8 - 20, height/8*7, 12);
    }
  else if (ellipseX > width/4 && ellipseX < width/2 && ellipseY > (height/4)*3 && ellipseY < height)
    {
      box14();                                                              //function which begins the trail to finding the secret score preview page
      value = 14;
      noteValues(note, width/8*3 - 20, height/8*7, 13);
    }
  else if (ellipseX > width/2 && ellipseX < (width/4)*3 &&  ellipseY > (height/4)*3 && ellipseY < height)
    {
      value = 15;
      noteValues(note, width/8*5 - 20, height/8*7, 14);
    }
  else if (ellipseX > (width/4)*3 && ellipseX < width &&  ellipseY > (height/4)*3 && ellipseY < height)
    {
      value = 16;
      noteValues(note, width/8*7 - 20, height/8*7, 15);
    }

  if (value == 1 && change != 1)      //These if statements section off the segments so i can choose what i want the programme to do when it goes into each segment
  {                                    //Every second one of these sections of code are also the same

    note = (double) random(127);    // Code which pick the random note to be played and stored
    notai.playNote(note, mvelocity, 1);    //Code which plays the note
    noteArray[0] = note;              //Storing the note information into the note array
    counter++;                       //Increasing the counter
    if (counter % 5 == 0)        //Code for changing the instrument every 5 times it enters an odd numbered segment
    {
      notai.instrument(inst);      //changung the instrument
    }
    notesp ++;    //Progressing the counter for the amount of notes played during the running of the program
  }

  if (value == 2 && change != 2)
  {
    note = value*5;    //Code for playing the note at 5 times the value of the current segment
    if (note > 127)  note = 127;    //Setting the upper limit for the note as the highest it can go is 127
    notai.playNote(note, mvelocity, 1);    //Playing the random note
    noteArray[1] = note;                  //Adding the note to the note array
    notesp ++;                            //The counter for the number of notes played increases
  }

  if (value == 3 && change != 3)
  {
    note = (double) random(127);
    notai.playNote(note, mvelocity, 1);
    noteArray[2] = note;
    counter = counter + 1;
    if (counter % 5 == 0)
      notai.instrument(inst);
    notesp ++;
  }

  if (value == 4 && change != 4)
  {
    note = value*5;
    if (note > 127)  note = 127;
    notai.playNote(note, mvelocity, 1);
    noteArray[3] = note;
    notesp ++;
  }

  if (value == 5 && change != 5)
  {
    note = (double) random(127);
    notai.playNote(note, mvelocity, 1);
    noteArray[4] = note;
    counter++;
    if (counter % 5 == 0)
      notai.instrument(inst);
    notesp ++;
  }

  if (value == 6 && change != 6)
  {
    note = value*5;
    if (note > 127)  note = 127;
    notai.playNote(note, mvelocity, 1);
    noteArray[5] = note;
    notesp ++;
  }

  if (value == 7 && change != 7)
  {
    note = (double) random(127);
    notai.playNote(note, mvelocity, 1);
    noteArray[6] = note;
    counter++;
    if (counter % 5 == 0)
      notai.instrument(inst);
    notesp ++;
  }

  if (value == 8 && change != 8)
  {
    note = value*5;
    if (note > 127)  note = 127;
    notai.playNote(note, mvelocity, 1);
    noteArray[7] = note;
    notesp ++;
  }

  if (value == 9 && change != 9)
  {
    note = (double) random(127);
    notai.playNote(note, mvelocity, 1);
    noteArray[8] = note;
    counter++;
    if (counter % 5 == 0)
      notai.instrument(inst);
    notesp ++;
  }

  if (value == 10 && change != 10)
  {
    note = value*5;
    if (note > 127)  note = 127;
    notai.playNote(note, mvelocity, 1);
    noteArray[9] = note;
    notesp ++;
  }

  if (value == 11 && change != 11)
  {
    note = (double) random(127);
    notai.playNote(note, mvelocity, 1);
    noteArray[10] = note;
    counter++;
    if (counter % 5 == 0)
      notai.instrument(inst);
    notesp ++;
  }

  if (value == 12 && change != 12)
  {
    note = value*5;
    if (note > 127)  note = 127;
    notai.playNote(note, mvelocity, 1);
    noteArray[11] = note;
    notesp ++;
  }

  if (value == 13 && change != 13)
  {
    note = (double) random(127);
    notai.playNote(note, mvelocity, 1);
    noteArray[12] = note;
    counter++;
    if (counter % 5 == 0)
      notai.instrument(inst);
    notesp ++;
  }

  if (value == 14 && change != 14)
  {
    note = value*5;
    if (note > 127)  note = 127;
    notai.playNote(note, mvelocity, 1);
    noteArray[13] = note;
    notesp ++;
  }

  if (value == 15 && change != 15)
  {
    note = (double) random(127);
    notai.playNote(note, mvelocity, 1);
    noteArray[14] = note;
    counter++;
    if (counter % 5 == 0)
      notai.instrument(inst);
    notesp ++;
  }

  if (value == 16 && change != 16)
  {
    note = value*5;
    if (note > 127)  note = 127;
    notai.playNote(note, mvelocity, 1);
    noteArray[15] = note;
    notesp ++;
  }
}

void keyPressed()    //I used keyPressed to determine when two of my functions would be visible on the screen and also for the recquirements for the project, I felt this was better than using loopin() to pause the game as i could play around with this way more
{
  if ( key == 's')      //Initial pressing of the s key to use the function i have made to pause the game
  {
    if (paused)
     paused = false;    //If it is already paused - unpause the programm
    else
      paused = true;    //If the program is not paused - pause it
  }

  if ( key == 'p')    //Using the s key to determine when the preview function is being called
  {
    if (preview)    //Same idea as code above for showing and unshowing the preview screen
      preview = false;
    else
      preview = true;
  }
  
  if (key == ESC)      //Using the 'ESC' button to save the midi file to a specified folder
  {
    myScore.writeMidiFile("/Users/kevinmurphy/Desktop/FinalAssignment/Assignment.mid");    //Writing the code to the folder
    println("Saved");          //Printing saved so the user knows the file has been saved
  }

  if (key == 'f')      //Using the 'f' key to add the current notes stored in the array into the score
  {
    for (int q = 0; q < noteArray.length - 1; q++)       //for loop which selects all the notes in the array
    {
      rdur = (double) random(1, 3);          //creating random durations for between each note
      myScore.addNote(q + rdur, noteArray[q], mvelocity, rdur);      //the code used to add each note to the score in such a way that there is a space in between each one
    }
  }
}

void mousePressed()                //Function that I use for any functions I use which recquires a mouse pressed - mute function
{
  if(preview == true)
  {
  if(mouseX > 25 && mouseX < 125)              //The following nested if statements control when the user click inside the mute button the mute function will run / not run
      {
        if(mouseY > 10 && mouseY < 150)
        {
          if (mute)
           mute = false;    //If it is already muted - unmute the programm
          else
           mute = true;       //if it isnt already muted - mute it
        }
      } 
  } 
}

void paused()      //this is the function i used to control what happens when i pause/unpause the game
{
  if (paused == true)      //what to do if the game is paused
  {
    balli = 80;        //{ decreasing the alpha value of the shapes causes them to appear to fade away 
    recti = 80;        //}
    velocityX = 0;    //{ Code which stops the ball so to create the illusion that the programme has stopped
    velocityY = 0;      //}

    fill(29, 27, 219);    //{The following lines are the code is used to show the text for whaen the game is paused
    textFont(font1, 100);
    text("Paused", 130, 100);
    textFont(font1, 60);
    text("Please press 's'", 100, 200);
    text("to", 280, 280);
    text("continue with you score", 10, 370);
    textFont(font1, 30);
    text("Notes played total: " + notesp, 10, 550);    //Code to show the user how many notes have played since the program has started running }
    fill(0);                                          //{ Code for rectangle which can be clicked to play the score
    rect(300, 450, 450, 100);
    fill(255);
    textFont(font1, 80);
    text("Play Score", 135, 480);        
    if(mousePressed)                        //I used mousePressed() to know when the rectangle has been clicked on
    {
      if(mouseX > 75 && mouseX< 525)          //setting the limits that the user has to click between 
      {
        if(mouseY < 500 && mouseY > 400)
        {
          for (int z = 0; z < noteArray.length - 1; z++)      //for loop to enter all segments of the nite array
            {
                fill(255, 0, 0);
                text("Play Score", 135, 480);
                rdur = (double) random(1, 3);                //code for random durations between notes as recquired
                myScore.addNote(z + rdur, noteArray[z], mvelocity, rdur);        //adding the notes from the array to the score
            }
          myScore.play();                                //playing the score
        }
      }
    }
  }

  else          //code of what to do when the user decides to unpause the game
  {
    balli = recti = 255;      //resetting the alpha of the shapes back to normal
    velocityX = ballSpeed(speed);         //also resetting the speed of the balls to normal
    velocityY = ballSpeed(speed);
  }
}

int ballSpeed(int currentspeed)      //this is the function i used to change the speed of the balls
{
  int d;      //initialising the value which i want to be returned at the end of the function
  d = currentspeed;
  if (keyPressed)
  {
    if(key == CODED)
    {
       if (keyCode == RIGHT )      //Code to increase the speed when the Right arrow key is pressed
        {
          d++;
          println(d);
        }
    if (keyCode == LEFT)        //Code to decrease the speed when the Left arrow key is pressed
        {
          d--;
          println(d);
        }
    } 
  } 
    
  return d;            //this line of code return the desired value which will be used to decelerate the ball
}


void noteValues(double values, int box1, int box2, int Apos)      //This function gets the note values from the note that was just played on the grid and displays its musical value and stores this string to be used again
{
  
  int note2 = (int) values;        //This sets this new variable equal to the value of the note which has just been played in the grid

  if (note2 == 0 || note2 == 12 || note2 == 24 || note2 == 36 || note2 == 48 || note2 == 60| note2 == 72 || note2 == 84 || note2 == 96 || note2 == 108 || note2 == 120)        //This long if statement will determine if the note is a "C", I have a if statement for each seperate note in every octave soundcipher uses
  {
    input1 = "C";                      //Sets the value of the note to a musical note sign
    stringArray[Apos] = input1;      //Stores the string "C" into an array for use in the grid and also in the preview screen
  }

  else if (note2 == 1 || note2 == 13 || note2 == 25 || note2 == 37 || note2 == 49 || note2 == 61| note2 == 73 || note2 == 85 || note2 == 97 || note2 == 109 || note2 == 121)
  {
    input1 = "C#";
    stringArray[Apos] = input1;
  } 

  else if (note2 == 2 || note2 == 14 || note2 == 26 || note2 == 38 || note2 == 50 || note2 == 62| note2 == 74 || note2 == 86 || note2 == 98 || note2 == 110 || note2 == 122)
  {
    input1 = "D";
    stringArray[Apos] = input1;
  }

  else if (note2 == 3 || note2 == 15 || note2 == 27 || note2 == 39 || note2 == 51 || note2 == 63| note2 == 75 || note2 == 87 || note2 == 99 || note2 == 111 || note2 == 123)
  {
    input1 = "D#";
    stringArray[Apos] = input1;
  } 

  else if (note2 == 4 || note2 == 16 || note2 == 28 || note2 == 40 || note2 == 52 || note2 == 64| note2 == 76 || note2 == 88 || note2 == 100 || note2 == 112 || note2 == 124)
  {
    input1 = "E";
    stringArray[Apos] = input1;
  } 

  else if (note2 == 5 || note2 == 17 || note2 == 29 || note2 == 41 || note2 == 53 || note2 == 65| note2 == 77 || note2 == 89 || note2 == 101 || note2 == 113 || note2 == 125)
  {
    input1 = "F";
    stringArray[Apos] = input1;
  }

  else if (note2 == 6 || note2 == 18 || note2 == 30 || note2 == 42 || note2 == 54 || note2 == 66| note2 == 78 || note2 == 90 || note2 == 102 || note2 == 114 || note2 == 126)
  {
    input1 = "F#";
    stringArray[Apos] = input1;
  }

  else if (note2 == 7 || note2 == 19 || note2 == 31 || note2 == 43 || note2 == 55 || note2 == 67| note2 == 79 || note2 == 91 || note2 == 103 || note2 == 115 || note2 == 127)
  {
    input1 = "G";
    stringArray[Apos] = input1;
  } 

  else if (note2 == 8 || note2 == 20 || note2 == 32 || note2 == 44 || note2 == 56 || note2 == 68| note2 == 80 || note2 == 92 || note2 == 104 || note2 == 116)
  {
    input1 = "G#";
    stringArray[Apos] = input1;
  }

  else if (note2 == 9 || note2 == 21 || note2 == 33 || note2 == 45 || note2 == 57 || note2 == 69| note2 == 81 || note2 == 93 || note2 == 105 || note2 == 117)
  {
    input1 = "A";
    stringArray[Apos] = input1;
  } 

  else if (note2 == 10 || note2 == 22 || note2 == 34 || note2 == 46 || note2 == 58 || note2 == 70| note2 == 82 || note2 == 94 || note2 == 106 || note2 == 118)
  {
    input1 = "A#";
    stringArray[Apos] = input1;
  }

  else if (note2 == 11 || note2 == 23 || note2 == 35 || note2 == 47 || note2 == 59 || note2 == 71| note2 == 83 || note2 == 95 || note2 == 107 || note2 == 119)
  {
    input1 = "B";
    stringArray[Apos] = input1;
  }

  textFont(font1, 40);        //The text font for the notes as they appera on the screen
  fill(255);              //Filling them in white to go along with the rest of the appearence of the programm
  text(input1, box1, box2);      //The actial text been shown on the grid
}

void box14()      //The function for the hint which tells the user to press p so they can acess a secret preview page
{
  textFont(font1, 100);        //The font for the message which pops up only for a second
  fill(0, 0, 255);              //The colour of the message
  text("Press 'p'", 100, 250);      //The message to press p so the user can acess the secret preview page.
}

void preview()      //This function is a secret page which the user can acess which shows the notes that are stored in the array and also these notes can be played if they are clicked on, 
{                  // there is also a mute button when clicked muted the background noise so the 
                    //notes you click on in the screen are easily heard as there is no interference from the notes being played by the ball moving
  if (preview == true)  //stating when the code should run - when the user presses p
  {
    playingNotes(mouseX, mouseY);      //this line calls the function i have created that plays the notes when they are clicked on
    balli = 80;                        //decreases the alpha value in the colour of the ball so the user can see the screen better
    recti = 80;                        // same as above but affects the paddles and the grid
    fill(60, 7, 108);                  //the colour font i used for a part of the text (is repeated numerous times following this)
    textFont(font1, 68);              //size of the font for the title of the code (is repeated numerous times following this)
    text("Secret Score", 10, 80);      //code for text (is repeated numerous times following this)
    textFont(font1, 68);            
    text("Preview Page", 180, 150);
    textFont(font1, 50);
    fill(152, 45, 45);
    text("Beat(1-4)", 5, 240);
    fill(111, 20, 20);
    text("Beat(5-8)", 5, 320);
    fill(214, 15, 15);
    text("Beat(9-12)", 5, 400);
    fill(85, 18, 18);
    text("Beat(13-16)", 5, 480);
    textFont(font1, 40);
    fill(152, 45, 45);                    //colour for this group of notes
    text(stringArray[0], 300, 240);        //text for note 1 showing musical note
    text(stringArray[4], 300, 320);        //text for note 5 showing musical note
    text(stringArray[8], 300, 400);        //text for note 9 showing musical note
    text(stringArray[12], 300, 480);       //text for note 13 showing musical note   
    fill(111, 20, 20);                    //colour for this group of notes
    text(stringArray[1], 370, 240);      //text for note 2 showing musical note
    text(stringArray[5], 370, 320);      //text for note 6 showing musical note
    text(stringArray[9], 370, 400);      //text for note 10 showing musical note
    text(stringArray[13], 370, 480);      //text for note 12 showing musical note
    fill(214, 15, 15);                  //colour for this group of notes
    text(stringArray[2], 440, 240);      //text for note 3 showing musical note
    text(stringArray[6], 440, 320);      //text for note 7 showing musical note
    text(stringArray[10], 440, 400);      //text for note 11 showing musical note
    text(stringArray[14], 440, 480);      //text for note 15 showing musical note
    fill(85, 18, 18);                    //colour for this group of notes
    text(stringArray[3], 510, 240);      //text for note 4 showing musical note
    text(stringArray[7], 510, 320);      //text for note 8 showing musical note
    text(stringArray[11], 510, 400);      //text for note 12 showing musical note
    text(stringArray[15], 510, 480);      //text for note 16 showing musical note
    textFont(font1, 30);      //font size for additional text
    text("Press 'f' to add to score", 10, 540);        //code telling the user how to store the notes to the Score
    text("Press 'ESC' to save file", 280, 580);        //code to tell the user how to save the current score and close the programme
    fill(0);                //colour of mute button
    rect(75, 125, 100, 50);      //drawing the mute bitton
    textFont(font1, 30);          //text to be put onto the box
    fill(255);                //colour of the font for the text on the button
    text("MUTE", 36, 135);      //text on the button to show to the user that it is a mute button
    
    
    
  }

  else
  {
    balli = recti = 255;     //ressetting the alpha of the shapes when the user exits the prebiew page
  }
}

void playingNotes(int mx, int my)      //this is the function i created so that when you click on the notes on the preview screen they will play
{
  if(mousePressed)
  {
  if(mx > 295 && mx < 345 && my > 190 && my < 250)      //this is the code used setting the limits of where the mouse is clicked the notes will play, this is the same for the next following lines
      notai.playNote(noteArray[0], 100, 1);        //code for playing the note, the following lines are the similar
  if(mx > 365 && mx < 415 && my > 190 && my < 250)
      notai.playNote(noteArray[1], 100, 1);
  if(mx > 435 && mx < 485 && my > 190 && my < 250)          //Group 1 of notes
      notai.playNote(noteArray[2], 100, 1);
  if(mx > 505 && mx < 555 && my > 190 && my < 250)
      notai.playNote(noteArray[3], 100, 1);
      
  if(mx > 295 && mx < 345 && my > 270 && my < 330)
      notai.playNote(noteArray[4], 100, 1);
  if(mx > 365 && mx < 415 && my > 270 && my < 330)      //Group 2 of notes
      notai.playNote(noteArray[5], 100, 1);
  if(mx > 435 && mx < 485 && my > 270 && my < 330)
      notai.playNote(noteArray[6], 100, 1);
  if(mx > 505 && mx < 555 && my > 270 && my < 330)
      notai.playNote(noteArray[7], 100, 1);
      
  if(mx > 295 && mx < 345 && my > 350 && my < 410)
      notai.playNote(noteArray[8], 100, 1);
  if(mx > 365 && mx < 415 && my > 350 && my < 410)      //Group 3 of notes
      notai.playNote(noteArray[9], 100, 1);
  if(mx > 435 && mx < 485 && my > 350 && my < 410)
      notai.playNote(noteArray[10], 100, 1);
  if(mx > 505 && mx < 555 && my > 350 && my < 410)
      notai.playNote(noteArray[11], 100, 1);
      
  if(mx > 295 && mx < 345 && my > 430 && my < 490)
      notai.playNote(noteArray[12], 100, 1);
  if(mx > 365 && mx < 415 && my > 430 && my < 490)      //group 4 of notes
      notai.playNote(noteArray[13], 100, 1);
  if(mx > 435 && mx < 485 && my > 430 && my < 490)
      notai.playNote(noteArray[14], 100, 1);
  if(mx > 505 && mx < 555 && my > 430 && my < 4900)
      notai.playNote(noteArray[15], 100, 1);
  }
}

void mute()
{
  if(mute == true)
    {
      mvelocity = 0;
      fill(255, 0, 0);      //fill for the text on the button to turn red when clicked
      text("MUTE", 36, 135);      //button to be drew again when clicked and the user wants to unmute the programme
    }
  else
    mvelocity = 100;      //return the velocity of the notes to be returned to 100 when the user clicks on the button again
    
}

int ballColour(int num)      //this is my code for a second function which retus a value, this code affects the colour of the paddles and ball in relation to the amount of notes that have been played
{
  int f;      //initialising value which i want to be returned
  f = num * 5;    //setting that f is equal to 5 times the amount of notes that have been played
  if(f > 255)      //if f is greater than the max value a colour can have to reset the value back to 0
    f = f / 5;
    return f;    //returning the value to be used to change the colour
}
