
int SIZE = 8;
int TSIZE = 2;
Bird bird;
Clouds[] cloud = new Clouds[SIZE];
Tower[] tower = new Tower[TSIZE];
Score score;

void setup()
{
  size (500, 500);
  background (255);
  bird = new Bird();
  score = new Score();
  for (int i = 0; i < SIZE; i ++)
  {
    cloud[i] = new Clouds();
  }
  for (int i = 0; i < TSIZE; i ++)
  {
    tower[i] = new Tower();
  }
  tower[0].position.x = width;
  tower[1].position.x = width+290;  
}

void draw()
{
  stroke(0);
  background(#c4d6ee);
  for (int i = 0; i < cloud.length; i ++)
  {
    cloud[i].draw();
    cloud[i].update();
    cloud[i].checkSides();
  }
  
  for (int i = 0; i < TSIZE; i ++)
  {
    tower[i].draw();
    tower[i].update();
    tower[i].checkSides();
    tower[i].hitDUpperTower();
    tower[i].hitDLowerTower();
  }
  
  if (bird.del == false)
  {
    bird.draw();
    bird.checkSides();
    bird.update();
    score.addScore();
  }
  
  if (bird.del == true)
  {
    score.endScore();
  }
  
  if (bird.inst == true)
  {
     bird.instructions();
  }
}


void keyPressed()
{
   if (key == ' ')
   {
     bird.fly();
     bird.flap = true;
     if (bird.inst == true)
     {
       bird.inst = false;
     }
   }   
}
void keyReleased()
{
  if (key == ' ')
  {
    bird.buttonReset = true;
    bird.flap = false;
  } 
}
class Bird 
{
  float mass = 70.8;  
  float timeDelta = 1.0f / 60.0f;
  PVector gravity = new PVector(0 , 150.8);
  PVector velocity = new PVector (0, 0);
  PVector position = new PVector (width/2-100, height/2-100);
  PVector force = new PVector (0, mass * -gravity.y);
  boolean buttonReset = true, flap = false;
  boolean del = false;
  boolean inst = true;
  
  void instructions()
  {
    textSize(20);
    fill(0);
    text("Tap the SPACE bar to fly!", width/2-125, height/2-100);
  }
  
  void draw()
  { 
    stroke(0);
    //beak
    line(165, position.y, 154, position.y+9);
    line(165, position.y, 154, position.y-9);
    
    //body
    fill(#fdf1a5);
    ellipse(position.x, position.y, 20, 20);
    
    if (flap == false)
    {
      //wing
      line(149, position.y, 135, position.y);
    }
    if (flap == true)
    {
      stroke(0);
      line(149, position.y, 135, position.y + 10);
    }
  }
  
  void update()
  {
     velocity.add(PVector.mult(gravity, timeDelta));
     position.add(PVector.mult(velocity, timeDelta)); 
  }
  
  void fly()
  {
    if (buttonReset == true)
    {  
      velocity.add(PVector.mult(force, timeDelta));
      velocity.limit(150);
      buttonReset = false;
    }
  }
  
  void checkSides()
  {
     if (position.y < 2)
     {
       position.y = 15;
     } 
     if (position.y > 500)
     {
       position.y = 485;
     } 
  }
}
class Clouds
{
  PVector position = new PVector(random(width+200), random(height));
  PVector velocity = new PVector(-0.5, 0);
  
  Clouds()
  {
    stroke(255); 
    fill(255);
    ellipse (position.x, position.y, 50, 50);
    ellipse (position.x+20, position.y+10, 50, 50);
    ellipse (position.x, position.y+5, 50, 50);
    ellipse (position.x, position.y, 50, 50);
  }
  
  void draw()
  {
    stroke(255); 
    fill(255);
    ellipse (position.x, position.y, 50, 50);
    ellipse (position.x+20, position.y+10, 50, 50);
    ellipse (position.x-10, position.y+5, 50, 50);
    ellipse (position.x+30, position.y, 50, 50);
    ellipse (position.x-20, position.y+15, 50, 50);
    ellipse (position.x+20, position.y-15, 50, 50);
    ellipse (position.x-20, position.y-15, 50, 50);
    ellipse (position.x-25, position.y-15, 50, 50);
  }
  
  void update()
  {
    position.add(velocity);
  }
  
  void checkSides()
  {
    if (position.x < -80)
    {
       position.x = 500;
    } 
  }
}
class Score
{
  int score = 0;
  boolean scoreFlag = false;
  
  void addScore()
  {
    textSize(32);
    fill(0);
    text(score, 80, 30);
    for (int i = 0; i < TSIZE; i ++)
    {
      if (bird.position.x > tower[i].position.x+60 && bird.position.x < tower[i].position.x+62)
      {
        scoreFlag = true;
        if (scoreFlag = true)
        {
          score += 1;
          
        }
        scoreFlag = false;
      }
    }
  }
  
  void endScore()
  {
    textSize(20);
    fill(0);
    text("Game Over!\nYou scored: " + score, width/2-125, height/2-100);
    text("Press the 'r' key \nto restart the game", width/2-125, height/2+50);
    
    if (key == 'r' | key == 'R')
      {
        setup();
      }
  }
}


class Tower
{
  PVector position = new PVector (width/2, 0);
  PVector velocity = new PVector(-1, 0);
  float h = random(65,435);
  
  
  Tower()
  {
    stroke(0);
    fill(#b2b7be);
    rect (position.x, position.y, 60, h);
    rect (position.x, h + 80, 60, 500 - (h+ 60));
  }
  
  void hitDUpperTower()
  {
    if (bird.position.x > position.x-10 && bird.position.x < position.x+70 && bird.position.y < h+9)
    {
      bird.del = true;
    }
  }
  
  void hitDLowerTower()
  {
    if (bird.position.x > position.x-10 && bird.position.x < position.x+70 && bird.position.y > h+70)
    {
      bird.del = true;
    }
  }
  
  void draw()
  {
    stroke(0);
    fill(#b2b7be);
    rect (position.x, position.y, 60, h);
    rect (position.x, h + 80, 60, 500 - h -10);
  }
  
  void update()
  {
    position.add(velocity);
  }
    
  void checkSides()
  {
     if (position.x < -80)
     {
        position.x = 500;
        h = random(65,435);
     } 
  }
}




