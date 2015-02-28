
// HW #8
// Written by Mark Choi
// Andrew ID: mschoi
// © Mark Choi November 2013 Pittsburgh, Pa 15213  All Rights reserved

// Controls:
// 's' to begin game
// Arrow keys <- , -> to move frog side to side
// SPACE to launch tongue and capture bugs

int count;
int startTime, endTime, targetDisplayTime,  targetStartTime, totalTargetTime, gameTime;
int gamePhase;


float x1, y1, sz1, dx1, dy1;
float x2, y2, sz2, dx2, dy2;
float x3, y3, sz3, dx3, dy3;
float x4, y4, sz4, dx4, dy4;
float x5, y5, sz5, dx5, dy5;

int checkBee, checkFly;

PImage fly, bee, cloud1, cloud2, frog;
color col1, col2;

void setup()
{
  rectMode(CENTER);
  imageMode(CENTER);

  size(600, 600);
  
  x1 = random(width);
  y1 = random(height);
  sz1 = 50;
  dx1 = random(3, 10);
  dy1 = random(3, 10);
  
  x2 = random(width);
  y2 = random(height);
  sz2 = 100;
  dx2 = random(3, 10);
  dy2 = random(3, 10);
  
  x3 = random(width);
  y3 = random(height*.1, height/2);
  sz3 = 100;
  dx3 = random(1, 6);
  
  x4 = random(width);
  y4 = random(0, height/2);
  sz4 = 100;
  dx4 = random(1, 6);
  
  x5 = width/2;
  y5 = height*.94;
  sz5 = 100;
  
  col1 = color(200, 200, 0);
  col2 = color(0, 200, 200);
  
  fly = loadImage("fly.png");
  bee = loadImage("bee.png");
  cloud1 = loadImage("cloud1.png");
  cloud2 = loadImage("cloud2.png");
  frog = loadImage("frog.png");

  checkFly = 0;
  checkBee = 0;
  textSize( 15 );
  textAlign( CENTER );
  fill( 255 );
  count = 0;
  gamePhase = 0; 
  
  frameRate(40);
}
  
void draw()
{
  background(46, 131, 221);
  
  if ( gamePhase == 0 )
  {
    showInstructions( );
  }
  else if ( gamePhase == 1 )
  {
     playGame( );
  }
  else if (gamePhase == 2)
     score();
 
}

void playGame()
{
  prepScreen();
  checkTime();
  movFig2();
  fig2();
  movFig1();
  fig1();
  fig3();
  fig4();
  fig5();
  movFig3();
  movFig4();
  movFig5();
  collide1();
}

void showInstructions( )
{
   text( "Feed mr.Frog", width/2, 50 ); 
   text("Use Arrow Keys to move side to side \n & press SPACE to launch his toungue.", width/2, 100 );
   text("MAKE HIM HAPPY \nby capturing both fly and bee in under 2 seconds!", width/2, 175);
   text("Press 's' to begin.", width/2, 275 );
}

void score( )
{
   fill( 255, 255, 255 );
   text("GAME OVER", width/2, 50 );
   text("You fed him " + gameTime/1000 + " seconds.", width/2, 100 );
   if ( gameTime < 2000 )
   {
      text("Mmmmmmmmm!!!!!!", width/2, 150 );
      image(frog, width/2, height*.6, 100, 85);
      fill(255, 0, 0);
      beginShape();
      vertex(width*.485, height*.59);
      vertex(width*.515, height*.59);
      vertex(width/2, height*.61);
      endShape();
   }
   else 
   {
      text("Grrrrrrrrrrrrrrrr.......bt", width/2, 150 );   
      image(frog, width/2, height*.6, 100, 85);
      stroke(0, 0 , 0);
      strokeWeight(4);
      line(width/2-35, height*.51, width/2-25, height*.52);
      line(width/2+25, height*.52, width/2+35, height*.51);
      strokeWeight(1);
      stroke(255, 0 , 0);
      line(width/2-8, height*.6, width/2, height*.59);
      line(width/2, height*.59, width/2+8, height*.6);
   }
   
     

}

void checkTime( )
{
  fill( 255, 255, 255 );
  text( "Time: " + round(millis( )/1000), width/2, 50 );
  if ( count == 2 )
  {
     gameTime = millis();
     gamePhase = 2;
  } 
}

void collide1()
{
  if (dist(x1, y1, x2, y2) <= (sz1+sz2)/2)
  {
    float tempX, tempY;

    tempX = dx1;
    dx1 = dx2;
    dx2 = tempX;
  }
}
void collide2()
{  
  if (dist(x5, y1, x1, y1) <= sz1)
  {
    dx1 = 0;
    dy1 = 0;
    y1 = height*.95;
    if (checkFly == 0)
    {
      checkFly = 1;
      count++;
    }
  }
  
  if (dist(x5, y2, x2, y2) <= sz2)
  {
    dx2 = 0;
    dy2 = 0;
    y2 = height+100;
    if (checkBee == 0)
    {
       checkBee = 1;
       count++;
    }
  }
}

void fig1()
{
  noStroke();
  fill(col1);
  image(fly, x1, y1, 40, 40);
}

void fig2()
{
  fill(col2);
  image(bee, x2, y2, 40, 40);
}

void fig3()
{
  image(cloud1, x3, y3, 80, 60);
}

void fig4()
{
  image(cloud2, x4, y4, 60, 60);
}

void fig5()
{
  image(frog, x5, y5, 80, 70);
  
}

void movFig1()
{
  x1 +=dx1;
  y1 +=dy1;
  
  int xMin = 0; 
  if(x1> width)
  x1 = 0;
  if(x1< xMin)
  x1 = width;
  
  if(y1> height)
  y1 = 0;
  if(y1<0)
  y1 = height;
 
  
  if(dist(x5, y1, x1, y1) <= sz1 && dy1 == 50)
  {
    dy1 = 0;
    y1 = height*.923;
    x1 = x5-10;
    dx1 = 0;
  }
  if(dist(x5, y1, x1, y1) <= sz1 && dy1 == 0)
  {
    dx1=0;
    x1 = x5-10;
    if (x5 < 10)
    x1 = 1;
  }

}

void movFig2()
{
  x2 += dx2;
  y2 += dy2;
 
  if(x2 > width || x2<0 )
  {  
    dx2 = -dx2;
  }
  
  if(y2> height || y2 <0 )
  {
    dy2 = -dy2;  
  }
}
void movFig3()
{
  x3 += dx3;
  
  if(x3 > width || x3<0 )
  dx3 = -dx3;
}

void movFig4()
{
  x4 +=dx4;
  
  if(x4> width)
  x4 = 0;
  if(x4<0)
  x4 = width;

}

void movFig5()
{
  if (keyPressed == true)
  {
  if (key == CODED)
  {
    if (keyCode == LEFT)
    x5 = x5-10;
    if (keyCode == RIGHT)
    x5 = x5+10;
  }
  float temp;
  temp = x5;
  x5 = constrain(temp, 0, width);
}
}

void prepScreen()
{
    noStroke();
    fill(255, 10);
    rect(width/2,height/2, width, height);
}


void keyPressed( )
{
  
  if (key == 's')
  {
  if ( gamePhase == 0 )
  {
      gamePhase = 1;
      startTime = millis( );
  }
  }
  
  if (key == '1')
  {
    x1 = random(width);
    y1 = random(height);
    dx1 = random(3, 10);
    dy1 = random(3, 10);
  }
  if (key == '2')
  {
    x2 = random(width);
    y2 = random(height);
    dx2 = random(3, 10);
    dy2 = random(3, 10);
  }
  if (gamePhase == 1)
  {
    if (key == ' ')
      {
         fill(230, 30 , 125);
         ellipse(x5, height*.93/2, 20 ,height*.93);
         stroke(200, 10, 30);
         line(x5, height*.9, x5 ,height*.05);
         collide2();   
       
      }  
  }
}


  



