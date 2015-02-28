
/* @pjs preload="bg.jpg"; */
/* @pjs preload="flappy2.png"; */
/* @pjs preload="basket.png"; */
boolean upPressed,downPressed,leftPressed, rightPressed,rPressed;
ball[] birdy;
PImage basket, bg, flappy;
int screenNumber,x,y,speed2,score, life;
 
void setup()
{
  frameRate(60);
  smooth();
  size(700, 700);
  imageMode(CENTER);
  bg = loadImage("bg.jpg");   //Achtergrond plaatje
  flappy = loadImage("flappy2.png"); //Vallende vogeltjes
  basket = loadImage("basket.png");//Vangende mand
  birdy = new ball[5];//Aantal vogeltjes dat valt
  for(int i = 0; i<5; i++)
  {
    birdy[i] = new ball();
    birdy[i].a = (int)random(0,650);
    birdy[i].b = (int)random(-250,-50);
    birdy[i].speed = (int)random(2,5);
  }
  x = y = width/2;
  speed2 = 10;
  screenNumber = 1;
  score = 0;
  life = 5;
}
 
void draw()
{
  background(bg);
  if (screenNumber == 1)
  {
     
    for(int i = 0; i<birdy.length; i++)
    {
      birdy[i].show2();
    }
     
     //Start scherm
    x = y = width/2;
    textSize(22);
    fill(255);
    text("Gebruik de pijltjes om Flappy bird te vangen!", 131, 287);
    text("Klik om te starten.", 264, 428);
    if (mousePressed) screenNumber = 2;
  }
 
 //Game zelf
  if (screenNumber == 2)
  {
    for(int i = 0; i<birdy.length; i++)
    {
      birdy[i].show();
      birdy[i].aanraken();
      birdy[i].binnenkant();
    }
       
    image(basket, x, y, 100, 100);
  
    if (upPressed)    y -= speed2;
    if (downPressed)  y += speed2;
    if (rightPressed) x += speed2;
    if (leftPressed)  x -= speed2;
    
   //Score en levens
    text("Score:"+score,20,101);
    text("Levens:"+life,592,101);
  }
  
  //Eindscherm
  if (screenNumber == 3)
  { 
    endscreen();
    life = 5;
    score = 0;
    fill(255);
    text("Druk R voor Restart",226, 285);
     
    for(int i = 0; i<birdy.length; i++)
    {
      birdy[i].nothing();
      birdy[i].speed = (int)random(2,5);
    }
  }
}
 
 
 
class ball
{
  float a, b;
  int speed, speed2;
 
 //vallende vogeltjes
  void show()
  {
 
    image(flappy, a, b, 275, 260);
 
    if (b > 700)
    {
      b = (int)random(-250,-50);
      life = life - 1;
      if( life == 0)
      {
        life = life;
        screenNumber = 3;
      }
      a = random(700);
    }
    b += speed;
     
    if (screenNumber == 1)
    {
      b = -100;
    }
    if (screenNumber == 3)
    {
      b = -100;
      a = -200;
    }
  }
   
  void nothing()
  {
    b = random(-250,-50);
      a = -200;
  }
   
  void show2()
  {
    if (screenNumber == 1)
    {
      a = random(width);
    }
  }
   
   //Botsen
 void aanraken()
  { 
    if(dist(x,y,a,b)<(50))
    {
      b = -100;
      a = random(5,695);
      score = score +1;
    }
  }
   
  void binnenkant()
  {
    if( x > width-5 ) x = width;
    if( y > height ) y = height;
    if( x < 2 ) x = 2;
    if( y < 2 ) y = 2;

  }
} 

//eindscherm 
void endscreen()
{
    if (rPressed)
    {
    screenNumber = 1;
    }
}
 
 
 //Besturing
void keyPressed()
{
  if (keyCode == UP) upPressed = true;
  if (keyCode == DOWN ) downPressed = true;
  if (keyCode == LEFT ) leftPressed = true;
  if (keyCode == RIGHT ) rightPressed = true;
  if (key == 'r' ) rPressed = true;
}
 
void keyReleased()
{
  if (keyCode == UP) upPressed = false;
  if (keyCode == DOWN ) downPressed = false;
  if (keyCode == LEFT ) leftPressed = false;
  if (keyCode == RIGHT ) rightPressed = false;
  if (key == 'r' ) rPressed = false;
}


