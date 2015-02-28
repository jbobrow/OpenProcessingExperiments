
Meteor myMeteor;
Meteor myMeteor2;
Meteor myMeteor3;
Meteor myMeteor4;
Skud mySkud;
Skud mySkud2;
Skud mySkud3;
Skud mySkud4;
Player myPlayer;
Liv myLiv;

void setup()
{
  size(500,500);
  myMeteor = new Meteor();
  myMeteor2 = new Meteor();
  myMeteor3 = new Meteor();
  myMeteor4 = new Meteor();
  mySkud = new Skud();
  mySkud2 = new Skud();
  mySkud3 = new Skud();
  mySkud4 = new Skud();
  myPlayer = new Player();
  myLiv = new Liv();
}

void draw()
{
  background(255);
  myMeteor.display();
  myMeteor.drive();
  myMeteor2.display();
  myMeteor2.drive();
  myMeteor3.display();
  myMeteor3.drive();
  myMeteor4.display();
  myMeteor4.drive();
  mySkud.display();
  mySkud.drive();
  mySkud2.display();
  mySkud2.drive();
  mySkud3.display();
  mySkud3.drive();
  mySkud4.display();
  mySkud4.drive();
  myPlayer.display();
  myPlayer.drive();
  myLiv.display();


}
class Liv
{
  int Liv;
  float c;
  
  
  Liv()
  {
   Liv = 3; 
   c = color(0); 
    
  }
  
  void display()
  {
  fill(0);
  textSize(30);
  text("Liv: "+Liv,20,30);
  }
  
}
class Meteor
{
  color c;
  float xpos;
  float ypos;
  float laengde;
  float hoejde;
  float speed;
  float firkantStoerrelse;
  float ySpawn;
  float ySpawn2;
  float speed1;
  float speed2;
  float point;
  Meteor()
  {
   c = color(0); 
   xpos = random(0,width);
   ypos = random(-10,-100);
   firkantStoerrelse = 10;
   speed = 5;
   ySpawn = -10;
   ySpawn2 = -100;
   speed1 = 3;
   speed2 = 7;
   point = 0;
  } 
  void display()
  {
   rectMode(CENTER); 
   fill(c);
   rect(xpos,ypos,firkantStoerrelse,firkantStoerrelse); 
   textSize(30);
   text("Point: "+point,20,60);
  }
  void drive()
  {
   ypos = ypos + speed;
  if(ypos > height+5)
 {
  ypos = random(ySpawn,ySpawn2);
  xpos = random(0,width);
  speed = random(speed1,speed2);
  point++; 
 } 
  /*if(ypos > height)
  {
   point++;   
  }*/
 
 
  } 
}
class Player
{
  color c;
  float xpos;
  float ypos;
  float laengde;
  float hoejde;
  float speed;
  float firkantStoerrelse;
  
  Player()
  {
   c = color(0,255,0); 
   xpos = width/2;
   ypos = height/2;
   firkantStoerrelse = 10;
   speed = 10;
  } 
  
 void display()
  {
   rectMode(CENTER); 
   fill(c);
   rect(xpos,ypos,firkantStoerrelse,firkantStoerrelse); 
  }  
  
  void drive()
  {
   if (keyPressed)
   {
    if (keyCode == LEFT || key == LEFT)
    {
      xpos = xpos-speed;
    }
  }
  if (keyPressed)
  {
    if (keyCode == RIGHT || key == RIGHT)
    {
      xpos = xpos+speed;
    }
  }
  if (keyPressed)
  {
    if (keyCode == UP || key == UP)
    {
      ypos = ypos-speed;
    }
  }
  if (keyPressed)
  {
    if (keyCode == DOWN || key == DOWN)
    {
      ypos = ypos+speed;
    }
  } 
    if (xpos >= width)
    {
      xpos = 0+1;
    }
    if (xpos <= 0)
    {
      xpos = width-20;
    }
    if (ypos >= height)
    {
      ypos = 0+1;
    }
    if (ypos <= 0)
    {
      ypos = height-1;
    }
   
    
    
    
  
  }  
   
}
class Skud
{
  color c;
  float xpos;
  float ypos;
  float laengde;
  float hoejde;
  float speed;
  float firkantStoerrelse;
  float ySpawn;
  float ySpawn2;
  float speed1;
  float speed2;
  Skud()
  {
   c = color(0); 
   ypos = random(0,height);
   xpos = random(-10,-100);
   firkantStoerrelse = 10;
   speed = 5;
   ySpawn = -10;
   ySpawn2 = -100;
   speed1 = 3;
   speed2 = 7; 
  } 
  void display()
  {
   rectMode(CENTER); 
   fill(c);
    rect(xpos,ypos,firkantStoerrelse,firkantStoerrelse); 
  }
  void drive()
  {
   xpos = xpos + speed;
  if(xpos>width+5)
 {
  xpos = random(ySpawn,ySpawn2);
  ypos = random(0,height);
  speed = random(speed1,speed2);
 }  
  } 
}


