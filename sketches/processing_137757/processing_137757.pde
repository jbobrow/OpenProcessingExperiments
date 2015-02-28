
/*//
Copyright Faryal Khalid 2014
Computer Arts with Processing T/Th 11:30-1:20
Spring 2014, Carnegie Mellon University
HW#7

Scene: Welcome to Bunny Blue's hunt for dinner 
User Controls: Use arrow keys to move Bunny Blue to the left and right
Hit space bar to fire Bunny Blue's super color bar that brings him the food
Success Measure: He gets food and dessert tonight if he catches all three in or under 7 secs
He gets food but no dessert if gets them between 7 and 10 secs
He goes to bed hungry tonight, if he takes more than 10 secs

The sounds were obtained from open licensing SoundBible.com 
*/


/*//
sound library import
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
Minim minim; 
*/

//declaring 
int count;
int startTime, endTime, targetDisplayTime,  targetStartTime, totalTargetTime, gameTime;
int gamePhase;
//AudioPlayer soundFire, soundStart;


float x1, y1, sz1, dx1, dy1;
float x2, y2, sz2, dx2, dy2;
float x3, y3, sz3, dx3, dy3;
float x4, y4, sz4, dx4, dy4;
float x5, y5, sz5, dx5, dy5;

int killCarrot, killStrawberry, killTomatoe;

PImage bunny, carrot, strawberry, tomatoe, bg;
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
  y3 = random(height);
  sz3 = 150;
  dx3 = random(3, 10);
  dy3 = random(3, 10);
  
  
  x5 = width/2;
  y5 = height*.94;
  sz5 = 100;
  

  
  bunny = loadImage("bunny.png");
  tomatoe = loadImage("tomatoe.png");
  carrot = loadImage("carrot.png");
  strawberry = loadImage("strawberry.png");
 

  killCarrot = 0;
  killStrawberry = 0;
  killTomatoe=0;
  textSize( 15 );
  textAlign( CENTER );
  fill( 255 );
  count = 0;
  gamePhase = 0; 
  
  frameRate(40);
  
 /*// minim = new Minim(this);
  soundFire = minim.loadFile("fire.wav");
  soundStart = minim.loadFile("woop.wav"); */


}
  
void draw()
{
  background(70,142,240);
  
  if ( gamePhase == 0 )
  {
    showInstructions( );
  }
  else if ( gamePhase == 1 )
  {
     playGame( );
  }
  
  else if (gamePhase == 2)
  {
     score();
  }
  
   
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
  fig5();
  movFig3();
  movFig5();
  collide1();

}



void showInstructions( )
{
   text( "Bunny Blue has to catch food to take home tonight using his super color bar", width/2, 50 ); 
   text("Use Arrow Keys to move him side to side & press SPACE to fire his color bar.", width/2, 100 );
   text("He gets food and dessert tonight if he catches all three in or under 7 secs", width/2, 175);
   text("He gets food but no dessert if gets them between 7 and 10 secs", width/2, 225);
   text("He goes to bed hungry tonight, if he takes more than 10 secs :(", width/2, 275 );
   text("Press 's' to begin.", width/2, 325 );
}


void score( )
{
   fill( 255, 255, 255 );
   text("GAME OVER", width/2, 50 );
   text("Bunny Blue took " + gameTime/1000 + " seconds.", width/2, 100 );
   if ( gameTime <= 7000 )
   {
      text("Oh wow!! You're a star Bunny Blue", width/2, 150 );
      text("Time for some yummy desset and dinner!!", width/2, 180);
      image(bunny, width/2, height*.6, 100, 85);
      fill(255, 0, 0);
    
   }
   
   if (gameTime>7000 && gameTime<=10000)
   {
      text("A little too slow Bunny Blue!", width/2, 150 );
      text("You can have dinner but sorry no dessert", width/2, 180);
      image(bunny, width/2, height*.6, 100, 85);
      fill(255, 0, 0);
    
   }
   
  if (gameTime>10000)
   {
      text("Uh OH! sorry Bunny Blue. Going to bed hungry tonight", width/2, 150 );   
      image(bunny, width/2, height*.6, 100, 85);
     
   }
   
     

}

void checkTime( )
{
  fill( 255, 255, 255 );
  text( "Time: " + round(millis( )/1000), width/2, 50 );
  if ( count == 3 )
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
    if (killStrawberry == 0)
    {
      killStrawberry = 1;
      count++;
    }
  }
  
  if (dist(x5, y2, x2, y2) <= sz2)
  {
    dx2 = 0;
    dy2 = 0;
    y2 = height+100;
    if (killCarrot == 0)
    {
       killCarrot = 1;
       count++;
    }
  }
  
  if (dist(x5, y3, x3, y3) <= sz3)
  {
    dx3 = 0;
    dy3 = 0;
    y3 = height*.95;
    if (killTomatoe == 0)
    {
      killTomatoe = 1;
      count++;
    }
  }
}

void fig1()
{
  noStroke();
  fill(col1);
  image(strawberry, x1, y1, 40, 40);
}

void fig2()
{
  fill(col2);
  image(carrot, x2, y2, 40, 40);
}

void fig3()
{
  image(tomatoe, x3, y3, 80, 60);
}



void fig5()
{
  image(bunny, x5, y5, 80, 70);
  
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
  y3 += dy3;
 
  if(x3 > width || x3<0 )
  {  
    dx3 = -dx3;
  }
  
  if(y3> height || y3 <0 )
  {
    dy3 = -dy3;  
  }
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
      //soundStart.play();
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
         fill(random(255), random(255) , random(255));
         rect(x5, height*.93/2, 40 ,height*.93);
         //soundFire.play();
        
         line(x5, height*.9, x5 ,height*.05);
         collide2();   
      }  
 
}
  
}




