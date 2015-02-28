
//asignment 8, Grame
// Copyright Felipe Castelblanco, October, 2011

float x, y, dia, deltaX, deltaY, Increment, directionX, directionY, figIncX,figIncY, z, posFigX,posFigY,diaFig;
boolean collisions = false;
int sumCollisions = 0;

float startime;
float gameover = 15000;
boolean timer = false;
int printTime = 0;

PFont b;


void setup()
{
    size(600, 600);
    x = width/4;
    y = height/4;
    deltaX = random(2,5); //movement X / speed bullet
    deltaY = random(2,5); //movement Y / speed bullet
    dia = width*.05; //diameter bullet
    Increment = 1; //slows down movement of initials
    directionX = 1;
    directionY = 1;
    figIncX = 0;//speed Figure X target
    figIncY = 0;//speed Figure y target
    posFigX = width/2;
    posFigY = height/2;
    diaFig = 60; // diameter targey
    
    
   b = loadFont("Monospaced-14.vlw"); 
   textFont(b, 14);
    
    ellipseMode(CENTER);//sets ellipse to corner mode in order to align initials inside the circle
    smooth();
    
    frameRate(50);
   
}

void draw()
{
    prepScreen ();
    checkCollisions();
    moveSomething();
    drawfig();
    Something();
    info();
    
    ////timer/// must go inside draw --  
  startime = millis();
  if (startime < gameover) {
   printTime = printTime + 1;
  }
  else if (startime > gameover)
  {
    frameRate (1);
    fill(250);
    rect(0,0,width,height);
    fill(250,0,0);
    textSize(30);
    text("Grame Over", width/3,height/2);
    frameRate (30);
    sumCollisions = 0;
    printTime = 0;
}
}
  

void moveSomething() //bouncing object
{
   /****** Horizontal wrap *********/
   x += deltaX * directionX;
   
     if((x > width - dia) || (x < dia))
      {
       directionX =  - directionX; 
      }
  
  /****** Vertical warp *********/
 y += deltaY * directionY;
   
     if((y > height - dia) || (y < dia))
      {
       directionY =  -directionY; 
      }
}

void prepScreen () 
{

fill(200, 200, 25, 50); //color background with 50% opacity
rect (0,0, width, height);

}

void info() // target info
{
float distance;
distance = dist (width/2, posFigX, height/2, posFigY);
  
if ((posFigX >= width + diaFig) || (posFigY >= height + diaFig) || (posFigX <= 0 - diaFig) || (posFigY <= 0 - diaFig)) 
{

  ellipse(width/2,height/2,50,50);
  line(width/2,height/2,posFigX,posFigY);
  
  fill(200,200,250,60);
  rect(width/6, height/5,430,50);
  fill(200,0,0);
  textSize(18);
  text ("Away from Center: " + distance + " pixels" , width/4, height/4); //distanc in pix
}
fill(10);
textSize(14);
text ("Horizontal Speed: " + figIncX, 50,50);//prints collisions
text ("Horizontal Speed: " + figIncY, 50,75);//prints collisions
text ("collsions: " + sumCollisions, 50,100);//prints collisions
text ("Timer: " + printTime, 50,125);
fill(240);
text ("Press Space Bar to Reset Game ", 50,550);
  
}

void keyPressed () 
{
  posFigY = posFigY + figIncY;
  posFigX = posFigX + figIncX;
  
  if(keyCode == UP)
  {
    figIncY = figIncY - Increment;
  } 
  else if (keyCode == DOWN)
  {
  figIncY = figIncY + Increment; 
  }
  else if (keyCode == LEFT)
  {
   figIncX = figIncX - Increment;
  }else if (keyCode == RIGHT)
  {
   figIncX = figIncX + Increment; 
  }else if (keyCode == ' ')
  {
    posFigX = width/2;
    posFigY = height/2;
    figIncX = 0;
    figIncY = 0;
    startime = 0;
    gameover = gameover + 15000;
    sumCollisions = 0;
    printTime = 0;
  }
}
  
  void checkCollisions()
  {
    
    if (dist (x,y,posFigX,posFigY) < diaFig/2)
   {
     collisions = true;
     frameRate(10);
     fill(250,0,120);
     rect(0,0,width,height);
     sumCollisions ++;
    posFigX = random(100,width-diaFig);
    posFigY = random(200,height-diaFig);
    deltaX = random(5,10); //movement X / speed bullet
    deltaY = random(5,10); //movement Y / speed bullet
  }
    else
  {
    collisions = false;
     frameRate(50);
  }
  }
 

void Something()//bullet
{
  stroke(180);
  strokeWeight(3);
  fill (255, 10, 0);
  ellipse (x,y,dia,dia);
}

void drawfig()//target
{
  
  if (collisions == true)
  {
  fill(0);
  textSize(34);
  text("pow!", x, y-diaFig);
  }
    else
  {
    
  fill(0,100,200);
  ellipse(posFigX,posFigY,diaFig+5,diaFig+5);
  fill(200);
  noStroke();
  ellipse(posFigX,posFigY,diaFig,diaFig); 
  fill(20);
  ellipse(posFigX,posFigY,diaFig/2,diaFig/2);
  fill(random(255),random(255),random(255));
  ellipse(posFigX,posFigY,diaFig/5,diaFig/5);
}
}



