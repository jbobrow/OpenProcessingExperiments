
PFont font;
String poem = "Hij is weer op school begonnen,\ndat vonden Sint en Piet heel cool. \nZe willen hem daar graag bij steunen, \nalles voor het goede doel. \n\nKunst en code zijn orde van de dag in Maastricht, \nSint heeft hier wel wat kaas van gegeten. \nVandaar geeft hij je dit boek, \nom je helemaal mee uit te leven. \n\nAls je hulp nodig hebt hoort Sint graag van je, \nje kunt 'm altijd even vragen, \nEr zijn zo veel gave dingen mogelijk, \ndat zul je wel zien in de bijlage.";
int screenSizeX = 600;
int numberBalls = 100;
int numberSnow = 100;

Ball[] myBalls = new Ball[numberBalls];
Ball[] backsnow = new Ball[numberSnow];


void setup()
{
  size(screenSizeX,450);
  textSize(26);
  
   for(int i = 0; i<numberSnow; i++)
{
   backsnow[i] = new Ball();
   backsnow[i].myDiameter = 2;
   backsnow[i].posX = random(0, width);
   backsnow[i].posY = random(0, height);
   backsnow[i].speedX = random(0, .5);
   backsnow[i].speedY = random(1, 2);
   backsnow[i].r = random(60, 140);
 }
  
 for(int i =0; i<numberBalls; i++)
 {
   myBalls[i] = new Ball();
   myBalls[i].myDiameter = 3;
   myBalls[i].posX = random(0, width);
   myBalls[i].posY = random(0, height);
   myBalls[i].speedX = random(0, 1);
   myBalls[i].speedY = random(1, 3);
   myBalls[i].r = random(140, 255);
   myBalls[i].a = 200;
 }

  
}
  
void draw()
{
  background(255,255,255);
  fill((255-(mouseX%255)),(mouseX%255),0);
  text ( poem, 0 , 0, mouseX, screenSizeX);
  
  for(int i =0; i<numberBalls; i++)
 {
   myBalls[i].update();
   backsnow[i].update();
 }
}
 
class Ball //this does not exist until you call it
{
  //these are properties of the class
  int myDiameter = 10;
  float r = 255;
  float g = 255;
  float b = 255;
  float a = 110;
  float posX = 250; //these are the default properties of the class
  float posY = 250;
  float speedX = 3; //three pixels at a time
  float speedY = 2;
  //
   
  //this is the method
  //and it is a function inside the class, it can be whatever name you decide
  void update()
  {
   fill(r, a);
   ellipse(posX, posY, myDiameter, myDiameter);
  posX+= speedX;
  posY+= speedY;
   
  if(posX > width) //when you have only one instruction in your block of instruction, you don't have to use the curly brackets
  posX = 0;
   
  if(posX < 0)
  posX= width;
   
  if(posY > height)
  posY = 0;
   
  if(posY < 0)
  posY = height;
   
  if(speedY < 2)
  {
  myDiameter = 3;
  r = 130;
  }
   
  if(speedY < 1.6)
  {
  myDiameter = 2;
  r = 100;
  }
   
  if(speedY < 1.2)
  {
  myDiameter = 1;
  r = 70;
  }
   
  }

  
}
