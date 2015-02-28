
import ddf.minim.*;
    AudioPlayer burp;
    AudioPlayer puke;
    Minim minim;
    
PImage troll;
PImage trollstache;
PImage trollpuke;
float x;                    //Position of the troll on x-axis
float y;                    //Position of the troll on y-axis
float dx;                    //what direction is the troll going on the x-axis?
float dy;                    //what direction is the troll going on the y-axis?
float diam;
int speed=1;                   //How fast is it moving?
int score=0;                   //Inital score
int lives=5;                   //Number of lives you start with
boolean lost=false;            //Have you lost yet?
void setup()                   //Runs once when program launches
{
  troll = loadImage("Troll.png");
  trollstache = loadImage("TrollStache.png");
  frameRate(60);
  size (1280,720);
  smooth();
  x= 100;                
  y= 100;
  dx= 1;
  dy= 1;
  diam= 250;
  textSize(13);
  minim = new Minim(this);
  burp = minim.loadFile("Burp Sound Effect.mp3", 5048);
  puke = minim.loadFile("Throwing Up Sound Effect.mp3", 5048);
}
void draw() {                  //Loops over and over again
  background (0);
  imageMode(CENTER);
  image(troll, x, y, diam, diam);          //Draw the troll
  x+=(speed*dx);                        //update the troll's position
  y+=(speed*dy);
  if (x > width-20 || x<20)                //Did the troll hit the sides?
   {
    dx=-dx;                                  //If it did reverse the direction
  }
  if (y > height-20 || y<20)               //Did the troll hit the top or bottom?
   {
    dy=-dy;                                  //If it did reverse the direction
  } 
 if (score==1)                                   //Start of score accomplishments
 {
  textSize(50);
  text("GREAT! You Win! Now get away from me!",100,675);
 }
 if (score==3)                                   //Start of score accomplishments
 {
  textSize(50);
  text("What the what?! I told you to go away",100,675);
 }
  if (score==6)
 {
  textSize(75);
  text("Are you still playing this game?",60,675);
 }
 if (score==10)
  {
  textSize(50);
  text("Did you seriously think this was going to be fun?",40,675);
 }
  if (score==15)
  {
  textSize(100);
  text("I Hate You",40,675);
 }
  if (score==21)
  {
  textSize(100);
  text("I Hate Me",40,675);
 }
   if (score==28)
  {
  textSize(50);
  text("Don't push any buttons. bad things will happen.",40,275);
 }
   if (score==36)
  {
  textSize(50);
  text("hehehehehyahyahyanyucknyucknyuck",40,275);
 }
   if (score==45)
  {
  textSize(100);
  text("that tickles!",40,275);
 }
  if (score==55)
  {
  textSize(100);
  text("I dont get it!",300,275);
 }
   if (score==66)
  {
  textSize(50);
  text("Are you into tickling old men?",250,525);
 }
  if (score==78)
  {
  textSize(50);
  text("is that something you like to do in your spare time?",10,525);
 }
 if (score==91)
  {
  textSize(50);
  text("...because I enjoy hobbies such as...",200,525);
 }
 if (score==105)
  {
  textSize(50);
  text("Gardening",420,675);

 }
  if (score==120)
  {
  textSize(50);
  text("Housekeeping",415,675);
 }
  if (score==136)
  {
  textSize(50);
  text("Sandpaper",420,675);
 }
  if (score==153)
  {
  textSize(50);
  text("...and my favorite, Night Golfing",300,675);
 }
 if (score>=171)
 {
  textSize(150);
  text("'STACHE TIME!",125,675);
  image(trollstache, x, height/2,250,250);   
 }                                               //End of score accomplishments
  textSize(20);
  text("score = "+score,10,30);                  //Print the score on the screen
  text("lives = "+lives,width-90,30);            //Print remaining lives
  text("Troll: the Game",575,30);
  if (lives<=0)                                  //Check to see if you lost
  {
    textSize(20);
    text("You Lost, Click to Begin Again", 60,100);
    noLoop();                                    //Stop looping at the end of the draw function
    lost=true;
    textSize(13);
  }
}
void mouseReleased()
{
  burp = minim.loadFile("Burp Sound Effect.mp3");
  puke = minim.loadFile("Throwing Up Sound Effect.mp3", 5048);
}
void stop()
{
 // always close Minim audio classes when you are done with them
 burp.close();
 puke.close();
 minim.stop();
 super.stop();
} 

void mousePressed()                              //Runs whenever the mouse is pressed
{
  if (dist(mouseX, mouseY, x, y)<=100)      //Did we hit the target?

  {
    burp.loop(0);
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
    burp.close();
    puke.play();
  }
  if (lost==true)                                //If we lost the game, reset now and start over 

  {
    speed=1;                                     //Reset all variables to initial conditions
    lives=5;
    score=0;
    x=width/2;
    dx=1;
    y=height/2;
    dy=1;
    lost=false;
    loop();                                     //Begin looping draw function again
  }
}  



