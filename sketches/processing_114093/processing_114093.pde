
//image
PImage image1;
PImage image2;
PImage image3;
PImage image4;
PImage image5;


//note
import arb.soundcipher.*;
import arb.soundcipher.constants.*;
SoundCipher myNote = new SoundCipher();
double velocity;
double duration;
int [] note = { 20,40,60,80,100,120};

//chord
SoundCipher myChord=new SoundCipher();
float[]pitches={80,10,40};
double dynamic;
double duration2;

//Score
SCScore myScore = new SCScore();
float beatPos;


//globals for paddles
int paddle1x, paddle1y;
int paddle2x, paddle2y;
int sizeAcross = 10, sizeDown = 60;
 
//globals for ellipses
int ellipseX, ellipseY;
int speedX = 3, speedY = 2;
int ellipseSize = 10;
 
//globals for line spacings
int lineX, spacing = 10;

//globals for division
int change , value ;
int change2 , value2;

//pausing
boolean Pause = false;

//grid14
float r,g,b;


void setup()
{
  size(400, 400);
  paddle1x = 0;
  paddle2x = width - sizeAcross;
  ellipseX = width/2;
  ellipseY = height/2;
  lineX = width/2;
  velocity=100;
  duration = 0.1;
  myNote.tempo(60);
  velocity = 100;
  beatPos=10;
  dynamic=100;
  duration2=1.0;
  image1=loadImage("/Users/Kenneth/Pictures/bg.jpg");
  image2=loadImage("/Users/Kenneth/Pictures/Face.png");
  image3=loadImage("/Users/Kenneth/Pictures/Face 2.png");
}
 
void draw()
{
 
  //redrawing the background each time
  background(image1);
  stroke(255);
  for (int i = 0; i < height; i = i + spacing)
  line(lineX, i, lineX, i + 5);
  //draw the grids
  gridDivision();
  //draw the paddles
  drawPaddles();
  //draw circle
  drawEllipses();
  gridFourthteen();
  ballSpeed();
  //1st Feature
  picture();
  //2nd Feature
  chords();
  
  //score
  myScore.addNote(beatPos, note[(int)random(note.length)], velocity, duration);
  beatPos += duration;
}



void drawPaddles()
{
  stroke(255);
  paddle1y =ellipseY-25;
    if (paddle1y < 0) //ensure the paddle doesn't go off the top of the screen
       paddle1y = 0;
    else if (paddle1y > height - sizeDown) // ensure the paddle doesn't go off the bottom of the screen
       paddle1y = height - sizeDown;
  
  
    paddle2y =ellipseY-25;
    if (paddle2y < 0) //ensure the paddle doesn't go off the top of the screen
       paddle2y = 0;
    else if (paddle2y > height - sizeDown) // ensure the paddle doesn't go off the bottom of the screen
       paddle2y = height - sizeDown;
  //draw the paddles
  rect(paddle1x, paddle1y, sizeAcross, sizeDown);
  rect(paddle2x, paddle2y, sizeAcross, sizeDown);
}

void drawEllipses()
{
  stroke(255);
  ellipseX = ellipseX + speedX; //Move the ball along the x axis
  ellipseY = ellipseY + speedY; //Move the ball along the y axis
  
  if ((ellipseY > paddle2y && ellipseY < paddle2y + sizeDown) && ellipseX + ellipseSize/2 > paddle2x) // if the ellipse hits within the bounds of the paddle on the right
      speedX =  speedX * - 1; //flip direction
      
  if (ellipseX > width)  //if the ellipse goes off the right of the screen. Note there is a nested if here.
  {
     speedX = -3; //set the speed to a negative number so it aims for the left hand paddle
     ellipseX = width/2; //reset the ellipse to the centre of the screen
     ellipseY = height/2;
  }
  
  if ((ellipseY > paddle1y && ellipseY < paddle1y + sizeDown) && ellipseX - ellipseSize/2 < paddle1x + sizeAcross) //if the ellipse hits within the bounds of the paddle on the left
      speedX = speedX * - 1;
      
  if (ellipseX  < 0) //if the ellipse goes off the left of the screen. Note there is a nested if here.
  {
    speedX = 3; //set the speed so it aims for the player on the right
    ellipseX = width/2; //reset the ellipse to the center of the screen
    ellipseY = height/2;
  }
  
  //if the ellipse goes off the bottom of the screen
  if (ellipseY > height - ellipseSize/2)
    speedY = speedY * - 1;
    
  //if the ellipse goes off the top of teh screen
  else if (ellipseY < ellipseSize/2)
    speedY = speedY * - 1;
  
  //draw ball
  ellipse(ellipseX, ellipseY, ellipseSize, ellipseSize);
}


void keyPressed()
{
  
    {
      if (key == 's'||key == 'S' )
      {
       Pause = true;
      }
    }
    
    if (Pause==true)
    {
      noLoop();
    }
    
   
    //Saving Score
      if(key==ESC)
      {
       myScore.writeMidiFile("/Users/Kenneth/Desktop/FinalProject.mid");
      }
    

}
   
void keyReleased()
 {
   if (key == 's'||key == 'S' )
      {
       Pause = false;
      }
    
    
    if (Pause==false)
    {
      loop();
    }
}





void gridDivision()
{
  //splits up into 4x4 segments
  stroke(255,0,0);
  line (width/4,0,width/4,height);
  line (3*width/4,0,3*width/4,height);
  line (0,height/4,width,height/4);
  line (0,height/2,width,height/2);
  line (0,3*height/4,width,3*height/4);
  
  //value and change for note
  change=value;
  
  if (ellipseX<=width/4 && ellipseY<height/4)
  {
    value=1;
  }
  else if (ellipseX>=width/4 && ellipseX<=width/2 && ellipseY<height/4)
  {
     value=2;
  }
  else if (ellipseX>=width/2 && ellipseX<=3*width/4 && ellipseY<height/4)
  {
     value=3;
  }
  else if (ellipseX>=3*width/4 && ellipseY<height/4)
  {
    value=4;
  }
  else if (ellipseX<=width/4 && ellipseY>height/4 && ellipseY<height/2)
  {
   value=5;
  }
  else if (ellipseX>=width/4 && ellipseX<=width/2 && ellipseY>=height/4 && ellipseY<height/2)
  {
   value=6;
  }
  else if (ellipseX>=width/2 && ellipseX<=3*width/4 && ellipseY>=height/4 && ellipseY<height/2)
  {
   value=7;
  }
  else if (ellipseX>=3*width/4 && ellipseY>=height/4 && ellipseY<height/2)
  {
   value=8;
  }
   else if (ellipseX<=width/4 && ellipseY<=3*height/4 && ellipseY>height/2)
  {
    value=9;
  }
  else if (ellipseX>=width/4 && ellipseX<=width/2 && ellipseY<=3*height/4 && ellipseY>height/2)
  {
    value=10;
  }
  else if (ellipseX>=width/2 && ellipseX<=3*width/4 && ellipseY<=3*height/4 && ellipseY>height/2)
  {
    value=11;
  }
  else if (ellipseX>=3*width/4 && ellipseY<=3*height/4 && ellipseY>height/2)
  {
    value=12;
  }
  else if (ellipseX<=width/4 && ellipseY >=3*height/4 )
  {
    value=13;
  }
  else if (ellipseX>=width/4 && ellipseX<=width/2 && ellipseY >=3*height/4 )
  {
   value=14;
  }
  else if (ellipseX>=width/2 && ellipseX<=3*width/4 && ellipseY >=3*height/4 )
  {
    value=15;
  }
  else if (ellipseX>=3*width/4 && ellipseY >=3*height/4 )
  {
    value=16;
  }

  //play note
 if (value==1 && change!=1)
 {
   myNote.playNote(note[(int)random(note.length)], velocity, duration);
 }
 if (value==2 && change!=2)
 {
    myNote.playNote(note[(int)random(note.length)], velocity, duration);
 }
 if (value==3 && change!=3)
 {
   myNote.playNote(note[(int)random(note.length)], velocity, duration);
 }
 if (value==4 && change!=4)
 {
    myNote.playNote(note[(int)random(note.length)], velocity, duration);
 }
 if (value==5 && change!=5)
 {
    myNote.playNote(note[(int)random(note.length)], velocity, duration);
 }
 if (value==6 && change!=6)
 {
    myNote.playNote(note[(int)random(note.length)], velocity, duration);
 }
 if (value==7 && change!=7)
 {
     myNote.playNote(note[(int)random(note.length)], velocity, duration);
 }
 if (value==8 && change!=8)
 {
     myNote.playNote(note[(int)random(note.length)], velocity, duration);
 }
 if (value==9 && change!=9)
 {
     myNote.playNote(note[(int)random(note.length)], velocity, duration);
 }
 if (value==10 && change!=10)
 {
      myNote.playNote(note[(int)random(note.length)], velocity, duration);
 }
 if (value==11 && change!=11)
 {
    myNote.playNote(note[(int)random(note.length)], velocity, duration);
 }
 if (value==12 && change!=12)
 {
    myNote.playNote(note[(int)random(note.length)], velocity, duration);
 }
 if (value==13 && change!=13)
 {
      myNote.playNote(note[(int)random(note.length)], velocity, duration);
 }
 if (value==14 && change!=14)
 {
     myNote.playNote(note[(int)random(note.length)], velocity, duration);
 }
 if (value==15 && change!=15)
 {
    myNote.playNote(note[(int)random(note.length)], velocity, duration);
 }
 if (value==16 && change!=16)
 {
     myNote.playNote(note[(int)random(note.length)], velocity, duration);
 }
 
}


void gridFourthteen()
{
 if (ellipseX>=width/4 && ellipseX<=width/2 && ellipseY>=3*height/4)
  {
    r=random(255);
    g=random(255);
    b=random(255);
    fill(r,g,b);
    rect(175,175,50,50);
  }
}

void ballSpeed()
{
  if (keyPressed)
  
    {
      speedX=speedX+1;
      speedY=speedY+1;
    }
  
}

void picture()
{
  if (ellipseX<=width/2 && ellipseY<=height/2)
  {
    image(image2,100,100,200,200);
  }
  else if (ellipseX>=width/2 && ellipseY>=height/2)
  {
    image(image3,100,100,200,200);
  }
}

void chords()
{
  change2=value2;
  
  if (ellipseX<=width/2 && ellipseY<=height/2)
  {
    value2=1;
  }
  else if (ellipseX<=width/2 && ellipseY>=height/2)
  {
    value2=2;
  }
  else if (ellipseX>=width/2 && ellipseY<=height/2)
  {
    value2=3;
  }
  else if (ellipseX>=width/2 && ellipseY>=height/2)
  {
    value2=4;
  }
  
   if (value2==1 && change2!=1)
  {
   myChord.playChord(pitches,dynamic,duration2);
  }
   if (value2==2 && change2!=2)
  {
   myChord.playChord(pitches,dynamic,duration2);
  }
   if (value2==3 && change2!=3)
  {
   myChord.playChord(pitches,dynamic,duration2);
  }
   if (value2==4 && change2!=4)
  {
   myChord.playChord(pitches,dynamic,duration2);
  }
  
  
  
}



