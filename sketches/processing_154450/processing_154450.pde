
//time doesn't restart unless game restarts
int state = 0;
int numStars = 50;
int points = 25;

float[] dotX = new float[numStars];
float[] dotY = new float[numStars];
float[] velocity = new float[numStars];

float blackHoleX;
float blackHoleY;
float blackHoleVelocity;

float time;
void setup()
{
  size(750, 750);
  
  for(int i=0; i<numStars; ++i)
  {
    dotX[i] = 0;
    dotY[i] = random(height);
    velocity[i] = random(30);
  }
  
  blackHoleVelocity=0;
  
}
void draw()
{
  if(state == 0)
  {
    background(0);
    textAlign(CENTER);
    textSize(100);
    text("GAME", width/2, TOP);
    textSize(32);
    text("Press Space", 100, height/2);
  }
  else if(state == 1)
  {
    time = millis();
    background(255);
    stroke(100, 225, 100);
    strokeWeight(30);
    for(int i = 0; i<numStars; ++i)
     {
       point(dotX[i], dotY[i]);
       dotX[i] += velocity[i];
       if(dotX[i] > 750)
       {
          dotX[i] = 0; 
       }
     }
    fill(0);
    text(points-25, 650, 650);
    text((int)time/1000, 650, 600);
    if(points==75)
      ++state;
  }
  else
  {
    background(0);
    textAlign(CENTER, CENTER);
    fill(255);
    text("You win! Press Space to play again! " + (int)time/1000, width/2, height/2);
  }
  blackHoleX = mouseX;
  blackHoleY = mouseY;
  stroke(30);
  strokeWeight(points*3);
  point(blackHoleX, blackHoleY);
  for(int i=0; i<numStars; ++i)
    if(dist(dotX[i], dotY[i], blackHoleX, blackHoleY) < points*2)
    {
       dotX[i] = 10000;
       dotY[i] = 10000;
       ++points;
    }
}
void keyPressed()
{
   if(state == 0)
   {
     if(key == ' ')
       ++state;
   }
   else if(state == 1)
   {
     
   }
   else
   { 
     if(key == ' ')
     {
       state = 1;
       points = 25;
       time = 0;
       for(int i = 0; i<numStars; ++i)
       {
          dotX[i] = 0;
          dotY[i] = random(height); 
       }
     }
   }
      
}
