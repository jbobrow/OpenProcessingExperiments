
PFont font; 
int score=0; 
int timer=10; 
float player1=0; 
float player2=0; 
float moveLeft=0;
float moveRight=0;
float moveUp=0;
float moveDown=0;
float health=1;
float i=0;
float k=0;
float wall1mgive=30;
float wall1wgive=260;
float wall1M=1300;
float wall1W=500;
float scoreH=700;
int give = 45; 
int timeLast = 0;  
PImage img;
 
 
void setup()
{
  
  img = loadImage("background.jpg");
  noStroke();
  frameRate(170);
  smooth();
  size(1280, 720); 
  smooth(); 
  timeLast=second(); 
  player1=0;
  player2=550;
  font = loadFont("Bauhaus93-48.vlw"); 
  textFont(font, 32); 
}
  
void draw()
{
  if (timer>0)
  {
    game();
  }
}
  
void game()
{ 
  background(img);
  fill(0,0,255);
  ellipse(1160,415,150,800);
  if(score==1)
  {
    scoreH=1120;
  }
  fill(255,116,3);
  ellipse(scoreH,300,5,900);
  if (second()!=timeLast)
  { 
    timeLast=second(); 
    timer-=1; 
  }
  wall1M=wall1M-20;
  if(wall1M<0)
  {
    wall1M=1200;
    wall1W=-100+random(800);
  }
  if(health==1)
  {
    i++;
    fill(100,0,0,100-i*5);
    rect(0,0,1280,720);
  }
  if(score==1)
  {
    k++;
    fill(0,100,0,100-k*5);
    rect(0,0,1280,720);
  }
  if(health==0)
  {
    timer=0;
  }
  fill(random(255),random(255),random(255));
  rect(0,0,1280,80);
  fill(0);
  scale(1.3);
  text("Isaac Escape Quickly!", 250, 60); 
  text("Timer: "+timer, 700, 60); 
  scale(1/1.3);
  fill(255,142,3);
  ellipse(player1,player2, give, give); //suppose to be image of Isaac Clark
  if(moveRight==1)
  {
    player1=player1+10;
  }
  else if(moveLeft==1)
  {
    player1=player1-10;
  }
  if(moveUp==1)
  {
    player2=player2-10;
  }
  else if(moveDown==1)
  {
    player2=player2+10;
  }
  else if(keyPressed=false)
  {
    player1=player1;
  }
  fill(0,255,223);//Necromorph image
  ellipse(wall1M,wall1W,wall1mgive,wall1wgive);
  if (player1<wall1M+give-10 && player1>wall1M-give+10)
  {
    if (player2<wall1W+125 && player2>wall1W-125)
    { 
      health=health-1; 
      wall1M=1200; 
      wall1W=random(600); 
    }
  }
  if(player1==scoreH)
  {
    score++;
  }
  if(timer==0)//lights up red when you die
  { 
    fill(170,5,8);
    rect(0,0,1280,720);
    //text("You Died")
  }
  if(score==2)//lights up when you accomplish goal
  {
    fill(0,255,0);
    rect(0,0,1280,720);
    //text("You Survived")
    timer=0;
  }
}
 
void keyPressed()
{
  if (key == 'a')
    {
      moveLeft=1;
      moveRight=0;
    }
    if (key == 'd')
    {
      moveRight=1;
      moveLeft=0;
    }
    if (key == 'w')
    {
      moveUp=1;
      moveDown=0;
    }
    if (key == 's')
    {
      moveUp=0;
      moveDown=1;
    }
    if (key == 'b')
    {
      score++;
    }
}
void keyReleased()
{
  if (key == 'a')
  {
    moveLeft=0;
  }
  if (key == 'd')
  {
    moveRight=0;
  }
  if (key == 'w')
  {
    moveUp=0;
  }
  if (key == 's')
  {
    moveDown=0;
  }
}
//I Tried uploading this image ("Isaac #2".png) for the player
//but it would not load so represented "isaac" with a shape
//Then also for the objects coming at "isaac" they are suppose to be Necromorphs
//but i couldnt get the image to work with the motion for someone reason
// so i also rpresetned tho=em with shapes.Same goes for the exit.
//I put the image in the data file but it dont work. 
//So picture the character you play as, as Isaac from Dead Space and your dodging Aliens and trying to get to the extraction


