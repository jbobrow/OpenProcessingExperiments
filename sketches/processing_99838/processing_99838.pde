
/*Michelle Li
 May 21, 2013
 Final Project*/


import ddf.minim.*;

AudioPlayer player;
Minim minim;//audio context

Textbox myTextbox;
//Click myClick;
int x = 0;
int start =0;
int changeFrames = 19;
int numFrames=19;
int frame = 0;
String [] TYPE = new String[changeFrames];
PImage [] images = new PImage [numFrames];

PFont f;

void setup()
{ //music player
   minim = new Minim(this);
   player = minim.loadFile("07.mp3", 2048);
   player.play();
   
  //text and images

  myTextbox=new Textbox();
//  myClick=new Click();
  f = createFont("Arial", 20, true);
  size(700, 700);
  frameRate(11);
  TYPE[0] = "Oh hello there...!";
  TYPE[1] = "I don't believe we've met before.";
  TYPE[2] = "Were you expecting a game of some sort?";
  TYPE[3] = "Maybe you'll get one if you keep clicking!";
  TYPE[4] = "Go on... click again!";
  TYPE[5] = "Hmm hmm hmm *humming a song* ♪~ ";
  TYPE[6] = "Ahahaha, are you still clicking?";
  TYPE[7] = "Sorry, there's no real game here.";
  TYPE[8] = "Oopsies! That wasn't a very appropriate face to show!";
  TYPE[9] = "There's no actual game here.";
  TYPE[10] = "Boo hoo, right? *animu girl tears*";
  TYPE[11] = "I was suppose to be the main star of it, too!";
  TYPE[12] = "Wait... What do you mean that wasn't part of the potential plan?";
  TYPE[13] = "Boo, no wonder the original version didn't happen! It didn't have ME in it!";
  TYPE[14] = "Well, maybe in the future that can all change.";
  TYPE[15] = "And it can be all about me!";
  TYPE[16] = "Don't you think I'd be the great for the role as the protagonist?";
  TYPE[17] = "*TURNS ON MAX KAWAII-DESU*";
  TYPE[18] = "Do I have to repeat it all over again?";

  images[0] = loadImage("default.png");
  images[1] = loadImage("default.png");
  images[2] = loadImage("kawaii.png");
  images[3] = loadImage("happy.png");
  images[4] = loadImage("happy.png");
  images[5] = loadImage("kawaii.png");
  images[6] = loadImage("happy.png");
  images[7] = loadImage("troll.png");
  images[8] = loadImage("sad.png");
  images[9] = loadImage("sad.png");
  images[10] = loadImage("tear.png");
  images[11] = loadImage("tear.png");
  images[12] = loadImage("default.png");
  images[13] = loadImage("angry.png");
  images[14] = loadImage("default.png");
  images[15] = loadImage("happy.png");
  images[16] = loadImage("happy.png");
  images[17] = loadImage("maxkawaii.png");
  images[18] = loadImage("kawaii.png");
}
void draw()
{
  background(255);

  if (mousePressed == true)
  {
    frame= frame +1;
  }
  if (mousePressed)
  {
    start = start +1;

    //allows text and images to go to the next
  }

  //sets the loop for images and text

  if (start >=changeFrames)
  {
    start = 0;
  }

  if (frame >=  numFrames)
  {
    frame = 0;
  }

  //Sets the image in place
  image(images[frame], 50, 0);
  noStroke();

  if (x > 1)
  {
    fill(255);
  }
  if (x > 3)
  {
    fill(20);
  }

  if (x >5)
  {
    x= 0;
  }
  rect(10, 95, 2, 25);


//myClick.nextClick();
//THIS IS THE TEXT BOX
  myTextbox.display();


  if (mousePressed == false)
  {
    fill(255);
    text(TYPE[start], 12, 650);  //Sets the text's position
  }
}
void stop()
 {
 player.close();
 minim.stop();
 super.stop();}
class Click {
  int x;
  int start;
  int changeFrames;
  int numFrames;
  int frame;
  
  Click() {
    x=0;
    start=0;
    changeFrames=19;
    numFrames=19;
    frame=0;
  }
  
  void nextClick(){
 if (mousePressed == true)
  {
    frame= frame +1;
  }
  if (mousePressed)
  {
    start = start +1;

    //allows text and images to go to the next
  }

  //sets the loop for images and text

  if (start >=changeFrames)
  {
    start = 0;
  }

  if (frame >=  numFrames)
  {
    frame = 0;
  }

  //Sets the image in place
  image(images[frame], 50, 0);
  noStroke();

  if (x > 1)
  {
    fill(255);
  }
  if (x > 3)
  {
    fill(20);
  }

  if (x >5)
  {
    x= 0;
  }
  rect(10, 95, 2, 25);
if (mousePressed == false)
  {
    fill(255);
    text(TYPE[start], 12, 650);  //Sets the text's position
  }
  }
}

class Textbox {
  
  int x=0;
  int y=600;
  int w=800;
  int l=700;


  void display() {
    fill(30, 30, 30, 200);
    rect(0, 600, 800, 700);
  }
}



