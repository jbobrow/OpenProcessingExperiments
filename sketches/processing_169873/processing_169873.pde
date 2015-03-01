
/* @pjs preload = "west.jpg"; */
/* @pjs preload = "skeleton.png"; */

int time;

PImage unicorn;
PImage skeleton;
PImage zombie;
PImage chomp;
PImage west;

//unicorn numbers
float uniX = 0;
float uniY = 0;
float unispeed = 2;
int unidirectionX = 1;
int unidirectionY = 1;

//chomp numbers
float chompX = 0;
float chompY = 0;
float chompspeed = 2.5;
int chompdirectionX = 1;
int chompdirectionY = 1;

//skeleton numbers
float skelX = 50;
float skelY = 200;
float skelXspeed = 2.8;
float skelYspeed = 2.2;
int skelXdirection = 1;
int skelYdirection = 1;
 
 //zombie numbers
float zombX = 200;
float zombY = 200;
float zombspeed = 2.2;
int zombXdirection = 1;
int zombYdirection = 1;


void setup(){
  size(855, 500);
  unicorn=loadImage("unicorn.png");
  skeleton=loadImage("skeleton.png");
  zombie=loadImage("zombie.png");
  chomp=loadImage("chomp.png");
  west=loadImage("west.jpg");

}
 
void draw(){
  background(west);
  time = millis()/1000;

//skeleton
if(time>0)
{
  if(time<4.5)
  {
  skelX = skelX + (skelXspeed * skelXdirection);
  skelY = skelY + (skelYspeed * skelYdirection);
   
  if(skelX > width-50 || skelX < 0)
  {
    skelXdirection *= -1;
  }
  if(skelY > height-50 || skelY < 0)
  {
    skelYdirection *= -1;
  }
   
  skeleton.resize(150, 150);
  image(skeleton, skelX, skelY);
}
}
 
//unicorn
if(time>8)
{
  uniX = uniX + unispeed;
  image(unicorn, uniX , 300);
}
 
//zombie
if(time > 12)
{
  if(time < 24)
  {
    zombX = zombX + (zombspeed * zombXdirection);
    zombY = zombY + (zombspeed * zombYdirection);
     
    if(zombY > height-60 || zombY <-5)
    {
      zombYdirection *= -1;
    }
    else if(zombX<- 40)
    {
      zombY= 640;
    }
    zombie.resize(100, 100);
    image(zombie, zombX, zombY);
  }
}
 
//chomp
if(time > 10)
{
  chompX = chompX + chompspeed;
  image(chomp, chompX, 300);
}
}
 




