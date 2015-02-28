
//Used Jim's blimp drop game to write basis for asteroid field.  The objective is to navigate through the an asteriod field located near the --- cluster.  The spaceship will have to navigate through the field without being hit,
//while the asteroids go faster by degres over time.  After 30 seconds pass, the speed will increase, providing the illusion that the asteroids are becoming more closely packed.  Hit three times, and you die (and therefore
//lose).  Controls: left and right are arrow keys.

//**Reminder: make timer go back to zero, and make more difficult either by speeding
//up asteriods, making them bigger, or appearing in a random location every pass.
float ex, ey;
float ec=30;
float ed=45;
float t1=120;
float t2=270;
float t3=150;
float t4=230;
float t5=180;
float t6=270;


float[] asteroidXs = new float[8];
float[] asteroidYs = new float[8];
int numAsteroids = -1;
float dy=1; //asteroid speed

int tiem;

void setup()
{
 size (300,300);
 background (3, 3, 3);
 noStroke();
 asteroidXs[0] = random(ec,width-ec);
 asteroidYs[0] = 0;
}

void draw()
{
  background(0);
  fill(230, 230, 230);
  showStats();
  if (numAsteroids==-1)
  {
   background(255);
   fill(0);
   if(mousePressed)
   {
     numAsteroids=3;
     tiem = millis();
   }
   text("Welcome to Asteroid Field!",50,30);
   text("Avoid asteroids as long as possible",50,60);
   text("to get a high score (or don't, to",50,90);
   text("get a low score). Be hit three times",50,120);
   text("and it's game over. Survive!",50, 150);
  }
  else if (numAsteroids>=0 && numAsteroids < 8)
  {
    for(int i = 0; i < numAsteroids; i++)
    {
      ex = asteroidXs[i];
      ey = asteroidYs[i];
      ellipse(ex, ey, ec, ed);
      float d=dist(t3, t4, ex, ey);
        if (d<25)
        {
         asteroidYs[i]=-5/2;
         fill(200, 200, 0);
         rect(0, 0, width, height);
         asteroidXs[i] = random(ec, width-ec);
        // if(numAsteroids <3)
        // {
           asteroidXs[numAsteroids] = random(ec,width-ec);
           asteroidYs[numAsteroids] = -5/2;
       //  }
         numAsteroids++;
        }
        asteroidYs[i]=ey+dy;
        if (ey>=height+ed/2)
        {
         asteroidYs[i]=-5/2; 
         asteroidXs[i]=random(ec, width-ec);
        }
    }
    //if(((int(millis()-tiem)/1000)-1) % 10 == 0)
      // {
        dy = dy+0.5/1200;
       //}
    fill(208, 199, 219);
    triangle(t1, t2, t3, t4, t5, t6);
    //if(t1 < 0 && t5 >0)
    //{
   //  triangle(width-abs(t1),t2, width+t3, t4, width+t5, t6); 
   // }
    //if( t5 > width && t1<width )
    //{
   //   triangle(t1,t2, t3-width, t4, t5-width, t6);
   // }
      if ( t5<0 )
      {
        t1=width-abs(t1);
        t3=width+t3;
        t5=width+t5;
      }
      if(t3>330)
      {
       t1=0;
       t3=30;
       t5=60;
      }
  }
  else
  {
    if(mousePressed)
     numAsteroids=3;
     tiem=millis();
     dy = 1;
       background(255);
       fill(0);
       text("GAME OVER",128,height/2);
       
       
      
  }

}
void keyPressed()
{
 if(keyCode==RIGHT)
{
 t1+=1*3;
 t3+=1*3;
 t5+=1*3;
 
}
else if(keyCode==LEFT)
{
 t1-=1*3;
 t3-=1*3;
 t5-=1*3;
}
}

void showStats()
{
  textSize(12);
  fill(255);
  
  text("Score:  "+int((millis()-tiem)/1000), 10, 20);
  
    
  
  //text("Hits:  " + 
  
  
}


