
//Use the arrow keys to change the speed of your character
//As you press arrow keys your character will speed up or slow down



Mover orb; //orb is Your character
Mover[] them = new Mover[30];//number of enemies
int x=0;//DO NOT CHANGE (changes starting speed of You)
int y=0;//DO NOT CHANGE (changes starting speed of You)
int c=100;//changes color of You
int l = 16;//changes size of You
int w = l;
boolean lost = false;
int time = millis()/1000;//used for timer
int purple;//used for timer
void setup() 
{
  rectMode(CENTER);
  size(600, 600);//size of screen
  orb = new Mover(0, 0, width/2, height/2);

  for (int i = 0; i< them.length; i++)
  {
    them[i] = new Mover((random(-5, 5)), (random(-5, 5)), (random(width)), 0);
  }
}
void keyPressed()
{
  if (key == CODED)

    if (keyCode == DOWN)
    {
      y = y+1;
    }
    else if (keyCode == UP)
    {
      y = y-1;
    }
    else if (keyCode == LEFT)
    {
      x = x-1;
    }
    else if (keyCode == RIGHT)
    {
      x = x+1;
    }
}



void draw() 
{

  background(255);
  orb.update();
  orb.displayYou(l, w, c);
  orb.setVelocity(x, y);
  
  for (int i = 0; i< them.length; i++)
  {
    them[i].displayThem();
    them[i].update();
  }

  if (orb.location.x > width) 
  {
    lost = true;
  } 
  if (orb.location.x < 0) 
  {
    lost = true;
  }

  if (orb.location.y > height) 
  {
    lost = true;
  } 
  if (orb.location.y < 0) 
  {
    lost = true;
  }

  for (int i = 0; i< them.length; i++)
  {
    orb.getDistance(them[i]);

    if (orb.getDistance(them[i])<16)
    {

      lost = true;
    }
  }
  if (lost)
  {
    textSize(32);
    fill(0);
    text("Game Over", width/2, height/2);
    text(purple,width/2,50);
    orb.location.x=-1000000;
    orb.location.y=-1000000;
  } else {
    fill(0);
    textSize(32);
    text(millis()/1000,width/2,50);
    purple = millis()/1000;
  }
}

class Mover 
{


  PVector location;
  PVector velocity;

  Mover(float x, float y, float a, float b) 
  {


    location = new PVector(a, b);
    velocity = new PVector(x, y);
  }
  void setVelocity(int x, int y)
  {
    velocity = new PVector(x, y);
  }

  float getDistance( Mover other)
  {
    float d = dist(location.x, location.y, other.location.x, other.location.y);
    return d;
  }

  void update() 
  {

    location.add(velocity);
    if ((location.x > width) || (location.x < 0)) {
      velocity.x = velocity.x * -1;
    }
    if ((location.y > height) || (location.y < 0)) {
      velocity.y = velocity.y * -1;
    }
  }

  void displayThem() 
  {


    fill(175);
    ellipse(location.x, location.y, 16, 16);
  }
  void displayYou(int w, int l, int tempC) 
  {

    c=tempC;
    stroke(0);
    fill(c);
    ellipse(location.x, location.y, w, l);
  }
}

