
/* FINAL PROJECT- Jack O Sullivan 12142905 On your advice I tried to make the code a bit tidier. */
/* INSTRUCTIONS. KEYS S = PAUSE/UNPAUSE
                      A = SAVES ARRAY TO SCORE
                      ESC = SAVES SCORE TO LOCATION ON HARDDRIVE 
                      B = INVERTS THE NOTE ARRAY
                      C = WHEN GAME IS PAUSED. PRESS C TO PAINT A COLOR REPRESENTATION OF THE NOTE ARRAY ON THE SCREEN 
                      WHEN THE MOUSE IS WITHIN 50 OF THE BALL CENTRE THE FUNCTION HOVER ACTIVATES 
                      THE RIGHT AND LEFT ARROWS CONTROL THE BALL SPEED. THOUGH RETURN FUNCTION ballSpeed(int) 5 SPEEDS */
/* EXTRA FEATURES   1. HOVER- WHEN THE MOUSE IS WITHIN A PERFECT CIRCLE OF THE BALL CENTRE
                       A. THIS WAS COMPLETED USING THE DISTANCE FORMULA
                       B. THE BALL CHANGES COLOR RANDOMLY
                       C. A HOVERING NOISE SOUNDS
                    2. VISUAL REPRESENTATION OF THE PITCHES IN THE NOTE ARRAY
                       A. WHEN THE GAME IS PAUSED PRESS C
                       B. A SERIES OF 16 RECTANGLES APPEARS VARYING IN COLOR DEPENDING ON THE ARRAY PITCHES
                       C. PRESS S TO RESUME THE GAME.
                    3. NOTE ARRAY INVERSION
                       A. THE NOTE ARRAY PITCHES ARE INVERTED WHEN THE KEY B IS PRESSED
                       B. EXAMPLE IF THE NOTE ARRAY WAS {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16}
                          IT BECOMES {16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1}
                       C. THE NOTE ARRAY BEFORE AND AFTER DISPLAYS IN THE TEXT WINDOW
                    4. WHEN THE MOUSE IS PRESSED
                       A. A CHORD SOUNDS WHICH REPRESENTS THE MOUSEX AND MOUSEY POSITIONS
                       B. A RECTANGLE IN THE BOTTOM RIGHT HAND CORNER OF THE SCREEN ALSO REPRESENTS THE CHORD/MOUSE POSITIONS IN COLOR FORM */
 /* SEGMENT 14      THE COLOR OF THE SCREEN INVERTS. THIS WAS ACHEIVED USING A RETURN FUNCTION colorValue(int); */
                       

import arb.soundcipher.*;
import arb.soundcipher.constants.*; /* importing soundcipher library*/

SoundCipher mysample = new SoundCipher(this); /* used for playing notes when ball changes segments */
SoundCipher mynote = new SoundCipher(this);   /* used for playing notes in the function hover() */
SCScore myScore = new SCScore();  /* score for the project */
SoundCipher mouseNote = new SoundCipher(this);   /* used for playing notes in void mousePressed() */

int x=20,y=20, /* variables for ball centre */
directionX=1, directionY=1, /* variables for ball direction */
q=175, /* variable for top corner of paddles */
a=0, /* this variable is being used in the pausing of the game */
c=0, d=0; /* these are being used to hold the direction that the ball was travelling in before the game was paused */
int[] noteArray = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}; /* this is the note array for segments 1 - 16 */
int o=0; /* this is counting the ammount of times the ball enters an odd segment */

boolean pause = false; /* this boolean is testing if the game is paused */

int value=1, change=1; /* these are used to test if the ball has entered a new segment */

boolean inverted = false; /* this boolean is used in controlling the event for segment 14. Inverting the colour of the whole screen. */

int beatPos = 0; /* this is used to add notes from noteArray to score one after another in myScore */

int redBall=255, greenBall=255, blueBall=0; /* these are variables used for controlling ball colour. used in function hover. */

int ballspeed=1; /* this is used as the initial ballspeed in conjunction to the function int ballSpeed(int) can hold values from 1 - 5. */

int speedX=1; /* this is used to determine whether the ball is moving in a positive or negative x direction */
int speedY=1; /* this is used to determine whether the ball is moving in a positive or negative y direction */

boolean colours = false; /* this is used in the function noteArray colours */


boolean backwards = false; /* this is used in the function noteArray manipulation */

float redMouse = 0, greenMouse=0; /* used in void rectangle */







void setup()
{
  frameRate(120); 
  size(600, 450);
  background(colourValue(2), colourValue(3), colourValue(41));   /* colourValue is a return function which determines if the colours are inverted or not */ 
}







void draw()
{
speedValues();
background(colourValue(2), colourValue(3), colourValue(41));
gridDivision(); /* divides screen into segments, determines what segments the ball is in and what happens when the ball enters a new segment */
centreLine(); /* draws cenreline */
stroke(colourValue(0));
paddles(); /* draws and moves paddles, reflects ball */
ball(); /* draws and moves ball, bounces ball off walls */
pause(); /* pauses game when s is pressed in void keyPressed() */
instrument(); /* changes instrument every five times the ball enters a new odd segment */
inversion(); /* used for inverting the colour of the whole screen when the ball is in segement 14 */
hover(); /* when the mouse the is within 50 pixels from the centre of the ball the ball colour will change randomly and a noise sounds */
noteArrayColours(); /* used to paint a colour representation of the noteArray pitches and play them aloud */
arrayManipulation(); /* used to turn the noteArray values back to front */
rectangle();
}







void ball()
{
  fill(colourValue(redBall), colourValue(greenBall), colourValue(blueBall)); /* variables used so that ball colour can be changed in function hover() */
  ellipse(x, y, 18, 18); /* ball position */
  x=x+directionX; /* changes ball direction horizontally*/ 
  y=y+directionY; /* changes ball direction vertically */
  if(y>height-9 || y<9) /* if the ball hits the top or bottom walls the direction vertically changes */
  directionY=directionY*-1;
  if(x<19) /* if the ball hits left paddle. as the paddles follow the balls position there is no need to test if the ball hit the paddle. it always does */
  {
   directionX=directionX*-1; /* the direction of the ball horizontally changes */
 }

   if(x>581) /* if the ball hits the right paddle */
  {
   directionX=directionX*-1; /* the direction of the ball horizontally changes */
 }
}







void paddles() 
{
  if(y<426 && y>25) /* so that the paddle will stay on the screen */
  q=y-25; /* the centre of the paddle is equal to the y position of the ball */
  fill(colourValue(252), colourValue(84), colourValue(5));
  rect(0, q, 10, 50); /* left paddle */
  rect(590, q, 10, 50); /* right paddle */
}







void keyPressed() /* test if a key has been pressed */
{
  if (key=='s') /* if s is pressed */
    a=a+1; /* a increases by one. this is then used to pause and unpause the game */
  if (key=='a') /* if a is pressed the values in noteArray are added to the score */
  { 
  for (int i = 0; i<16; i++)
  {
  float randomDuration = random(.5, 2); /* notes can be a random duration between .5 and two seconds */
  myScore.addNote(beatPos, noteArray[i], 100, randomDuration); 
  beatPos = beatPos + 1; /* beatPos increases so that the notes are added to the score one after another */
  }
  }
  if (key=='c') /* if c is pressed */
  {
    if (pause==true) /* the game must be paused for anything to happen */
    colours=true; /* colours is true, this then is used to draw an animation of the note array and play it */
  }
  if (key == ESC) /* if escape is pressed the score is written to the location below */
  myScore.writeMidiFile("/Users/p12142905/My Documents/Processing/scores/mid.mid");
  if (key == 'b') /* if b is pressed */
    backwards=true;    /* backwards is true. this is then used to control the function noteArrayManipulation */
  if (key == CODED) /* if a coded key is pressed */
  {
  if (keyCode==RIGHT) /* if it is the right arrow */
 {
  if (ballspeed<5) /* ballspeed integer must be less than five */
 { 
   ballspeed=ballspeed+1; /* ballspeed is increased */
   ballSpeed(ballspeed); /* it is then inputed into the function ballspeed, which increases the speed of the ball */
 }
 }
 if (keyCode==LEFT) /* if it is left */
 {
   if (ballspeed>1)  /*ballspeed integer must be greater than 1 */
   {
     ballspeed=ballspeed-1;  /* ballspeed is increased */
     ballSpeed(ballspeed); /* it is then inputed into the function ballspeed, which decreases the speed of the ball */
   }
 }
  }
}







void pause()
{
  if (directionX!=0) /* if directionX is 0 so is directionY. If directionX doesnt = 0. ie. it isnt paused. c=directionX. d=directionY. 
                    This maps the direction of the ball before the pause so it can resume in the right direction when s is pressed again. */
  {c=directionX; d=directionY;}
  if(a%2==1) /* if a is odd pause is true */
  pause=true;
  if(a%2==0) /* if a is even pause is false */
  pause=false;
  if (pause==true) /* if pause is true the ball doesn't move */
  {directionX=0; directionY=0;}
  if (pause==false) /* if pause is false directionX and directionY are reassigned to their previous values which were held in c and d */
  {
    directionX=c;
    directionY=d;
    colours=false;
  }
}







  /* note: in following function I did comment every part which test ball position  as the same things happen in all the odd segments. nothing happens in even functions so far */
  void gridDivision()
  {   
   int randNote = (int)random(127); /* integer for a random note pitch */
   change = value; /* change = value when loop starts but value can change without change changing to let the program know the ball has entered new segment */ 
   for(int i=1; i<4; i++) /* for loop for the grid division lines */
  {
    stroke(colourValue(43), colourValue(151), colourValue(203));
    line((width/4)*i, 0, (width/4)*i, height);
    line(0, (height/4)*i, width, (height/4)*i);
  }
  if(x<width/4 &&y<height/4) /* if ball is in segment one */
  value=1; /* value equals one but if the ball has just moved into the segment change will not equal one */
  if(value==1 && change!=1) /* if the ball has just moved into the segment */
  {
    mysample.playNote(randNote, 80, .5); /* as it is an odd quadrant a random note is played */
    noteArray[0] = randNote; /* the pitch of the note is assigned to the first position in the not array */
    o=o+1; /* the integer used to count the number of times the ball has entered an odd segment. this integer is then used to determine when the instrument changes */
  }
  if(x<width/4 && y>height/4 && y<height/2) /* segment 5 */
  value=5;
  if(value==5 && change!=5)
  {
    mysample.playNote(randNote, 80, .5);
    noteArray[4] = randNote;
    o=o+1;
  }
  if(x<width/4 && y>height/2 && y<height/4*3) /* segment 9 */
  value=9;
  if(value==9 && change!=9)
  {
    mysample.playNote(randNote, 80, .5);
    noteArray[8] = randNote;
    o=o+1;
  }
  if(x<width/4 &&y>height/4*3)   /* segment 13 */
  value=13;
  if(value==13 && change!=13)
  {
    mysample.playNote(randNote, 80, .5);
    noteArray[12] = randNote;
    o=o+1;
  }
  if(x>width/4 && x<width/2 && y<height/4) /* segment 2 */
  value=2;
  if(value==2 && change!=2)
  {
   mysample.playNote(5*2, 80, .5); /* a note is played that is 5 times the pitch of the segment value. same for all even functions */
   noteArray[1] = 5*2; /* this value is inputed into the note array at the segment position */
  }
  if(x>width/4 && x<width/2 && y>height/4 && y<height/2) /* segment 6 */
  value=6;
  if(value==6 && change!=6)
  {
    mysample.playNote(5*6, 80, .5);
    noteArray[5] = 5*6;
  }
  if(x>width/4 && x<width/2 && y>height/2 &&y<height/4*3) /* segment 10 */
  value=10;
  if(value==10 && change!=10)
  {
    mysample.playNote(5*10, 80, .5);
    noteArray[9] = 5*10;
  }
  if(x>width/4 && x<width/2 &&y>height/4*3) /* segment 14 */
  value=14;
  if(value==14 && change!=14)
  {
    mysample.playNote(5*14, 80, .5);
    noteArray[13] = 5*14;
  }
  if(x>width/2 &&x<width/4*3 && y<height/4) /* segment 3 */
  value=3;
  if(value==3 && change!=3)
  {
    mysample.playNote(randNote, 80, .5);
    noteArray[2] = randNote;
    o=o+1;
  }
  if(x>width/2 &&x<width/4*3 && y>height/4 && y<height/2) /* segment 7 */
  value=7;
  if(value==7 && change!=7)
  {
    mysample.playNote(randNote, 80, .5);
    noteArray[6] = randNote;
    o=o+1;
  }
  if(x>width/2 &&x<width/4*3 && y>height/2 && y<height/4*3) /* segment 11 */
  value=11;
  if(value==11 && change!=11)
  {
    mysample.playNote(randNote, 80, .5);
    noteArray[10] = randNote;
    o=o+1;
  }
  if(x>width/2 &&x<width/4*3 && y>height/4*3) /* segment 15 */
  value=15;
  if(value==15 && change!=15)
  {
    mysample.playNote(randNote, 80, .5);
    noteArray[14] = randNote;
    o=o+1;
  }
  if(x>width/4*3 &&y<height/4) /* segment 4 */
  value=4;
  if(value==4 && change!=4)
  {
    mysample.playNote(5*4, 80, .5);
    noteArray[3] = 5*4;
  }
  if(x>width/4*3 &&y>height/4 && y<height/2) /* segment 8 */
  value=8;
  if(value==8 && change!=8)
  {
    mysample.playNote(5*8, 80, .5);
    noteArray[7] = 5*8;
  }
  if(x>width/4*3 &&y>height/2 && y<height/4*3) /* segment 12 */
  value=12;
  if(value==12 && change!=12)
  {
    mysample.playNote(5*12, 80, .5);
    noteArray[11] = 5*12;
  }
  if(x>width/4*3 &&y>height/4*3) /* segment 16 */
  value=16;
  if(value==16 && change!=16)
  {
    mysample.playNote(5*16, 80, .5);
    noteArray[15] = 5*16;
  }
  }
  
  
  
  
  
  
  
  
  
void instrument() /* this funtion controls instrument changing */
{ 
  int randInst = (int)random(100); /* instrument is picked from a random selection of the first 100 */
  if (o%5==0) /* if the ammount of times the ball has entered an odd segment is divisable by 5 without a remainder. ie. every five times the ball enters an odd segment */ 
  mysample.instrument(randInst); /* the instrument changes */
}







void centreLine() /* contains for loop which draws centreline */
{
for(int j = 0; j<height/10; j=j+2) 
{
stroke(colourValue(255));
line(width/2, j*10, width/2, (j*10)+10);
}
}








int colourValue(int r) /* a return function which accepts the r, g and b values of the colour and inverts them */
{ 
  int colour = 0; /* the integer that will return the colour value */
  if (inverted==false) /* if inverted is false. ie. the ball is not in segment 14 */ 
  colour = 0+r; /* the origional color value is returned */
  if (inverted ==true) /* if inverted is true. ie the ball is in segment 14 */
  colour = 255 - r; /* the color is inverted */
  return colour;
}







void inversion() /* this is used to test if the ball is in segment fourteen. it works for the entire duration the ball is in segment 14 */
{
  if (value == 14)  /* if value is 14 then the ball is in segment 14 */
  inverted=true; /* inverted is true and the screen will invert color */
  else
  inverted=false; /* otherwise it is false and the screen will stay its origional color */
}










void hover()
{
  float distance = sqrt(((mouseX-x)*(mouseX-x))+((mouseY-y)*(mouseY-y))); /* this float tests the distance between the ball centre and the mouse pointer. 
                                                                            it uses the distance formula so that the function works within a perfect circle 
                                                                            rather than a square */
  if (distance<50&&pause==false) /* if the distance between the mouse and the ball centre is less than 50 */
{
  mynote.instrument(20); /* the my note soundcipher variable is used so the instrument will not be changing */
  if (frameCount % 20 == 0) /* this is so the individual color changes can be seen */
  {
  redBall=(int)random(255); /* red value is a random value in the balls color */
  greenBall=(int)random(255); /* green value is a random value in the balls color */
  blueBall=(int)random(255); /* blue value is a random value in the balls color */
  }
  if (frameCount % 10 == 0) /* so that there arent too many notes being played */
  mynote.playNote(75, 100, .3); /* this note sounds */
}
else /*otherwise the ball is yellow */
{
  redBall=255;
  greenBall=255;
  blueBall=0;
}
}






int ballSpeed(int s) /* this controls ball speed. can contain values one to five */
{
  if (s==5) /* eg. if s is 5, the variable inputed into ballSpeed() */
  {
    directionX=5*speedX; /* the direction of s will be 5 * + or - one depending on the value of speed x which tests if the x direction is positive or negative*/
    directionY=5*speedY; /* similar for directionY. eg if directionX was 1 and direction 5 was -1. now directionX will be 5 and direction Y will be -5.
                            The speed is increased but the ball still travels in the same direction */
  }
    if (s==4)
  {
    directionX=4*speedX;
    directionY=4*speedY;
  }
    if (s==3)
  {
    directionX=3*speedX;
    directionY=3*speedY;
  }
    if (s==2)
  {
    directionX=2*speedX;
    directionY=2*speedY;
  }
    if (s==1)
  {
    directionX=1*speedX;
    directionY=1*speedY;
  }
  return s;
}







void speedValues() /* this is used for setting the values of speedX and speedY to determine whether the ball is moving in a positve or negative x and y direction*/
{
if (directionX<0) /* if directionX is less than 0. then the ball is moving in a negative x direction and speedX will be set to -1. ie. negative. and so on */
speedX=-1;
if (directionX>0)
speedX=1;
if (directionY<0)
speedY=-1;
if (directionY>0)
speedY=1;
}







void noteArrayColours() /* used to create a visual representation of the pitch values in the noteArray and play the noteArray */
{
  if (colours == true && pause == true) /* if the game is paused and the key c is pressed */
  {
    for(int i=0; i<16; i++) /* for loop for drawing the rectangles which represent the pitches of the noteArray */
      {
        float redC = noteArray[i]; /* float redC = noteArray[i] */
        redC = redC/127; /* This is divided by 127 to get the pitch as a fraction ie a decimal between 0 + 1 */
        redC = redC*255; /* this is then converted into color by multiplying by 255. ie a value between 0 + 255 */
        fill(redC, 255, 255); /* then the fill is set to the value obtained to represent the pitch */
        rect(0+(i*width/16), 0, (i+1)*width/16, height); /* a rectangle is drawn */
      }
  }
}











void arrayManipulation() /* used to reverse the values in the noteArray so that the last is the first and so on. this can then be added to the score*/
{
  if (backwards==true) /* if the boolean backwards is true. this is controlled by pressing b */
  {
    print ("before noteArray reversed "); 
    for(int i =0; i<16; i++)
    print (noteArray[i] + ","); /* the noteArray as it stands is displayed in the text window */
    println();
    println("------------------------------------------------------------------------------------------------");
    for (int i = 0; i<8; i++) /* this for loop is used to reverse the values */
    {
      int m = noteArray[i]; /* an integer m holds the i value */
      int n = noteArray[15-i]; /* the integer n holds the last value minus the i value*/
      noteArray[i]=n; /* these integers are then used to reverse the values of the i value in the array */
      noteArray[15-i]=m; /* and the last position minus the i value. When the for loop is complete the whole array is reversed */
    }
    print("after noteArray reversed ");
    for(int i=0; i<16; i++)
    print(noteArray[i] + ","); /* the reversed array is then displayed in the text window */
    backwards=false; /* backwards is set to false so that function can run again */
  }
}
      
      
      
      
      
      
      
  void mousePressed() /* if the mouse is pressed */
  {
    float g=mouseX, h=mouseY; /* g is mouseX. it is then converted to a pitch value between 0 and 127 depending on the mouse X value, similar mor h but for mouseY */
    g=g/width; h=h/height;
    g=g*127; h=h*127;
    float[] chordArray = {g, h}; /* g and h are put in an array the array is then used in a chord to represent the mouse position. the chord is played when the mouse is pressed*/
    double chordvelocity = 100; /* chord velocity */
    double chordduration =1; /* chord duration */
    mouseNote.playChord(chordArray, chordvelocity, chordduration);
    float rmx, rmy; 
    rmx = mouseX; /* rmx is mouseX. It is converted to a color value between 0 + 127 depending on the position of mouseX */
    rmy = mouseY; /* similar for mouseY */
    rmx=rmx/width;
    rmy=rmy/height;
    rmx=rmx*255;
    rmy=rmy*255;
    redMouse=rmx; /* redMouse will be the red color value for the rectangle */
    greenMouse=rmy; /*  greenMouse will be the green color value for the rectangle */
  }
  
  
  
  
  
  
  void rectangle() /* the combination of the redMouse and greenMouse colors represents the chord played when the mouse is pressed */
  {
   fill(redMouse, greenMouse, 0);
   rect( width-20, height- 20, 20, 20);
    
  }
