
int NUM_THINGS = 45;
Thing[] things = new Thing[NUM_THINGS];
int NUM_THING2S = 25;
Thing2[] thing2s = new Thing2[NUM_THING2S];
int max_thing2s = 200;
Thing2[] thing22s = new Thing2[max_thing2s];
int cnt2s = 0;

void setup()
{
  size(500, 500);
  smooth();

  for (int i = 0; i < NUM_THINGS; i++)
  {
    things[i] = new Thing();   // populating the array
    things[i].x = random(0, width);
    things[i].y = random(0, height);
    things[i].direction = random(0, 360);
  }
  
  for (int i = 0; i < NUM_THING2S; i++)
  {
    thing2s[i] = new Thing2(0, 0, 0, false);
    thing2s[i].x = random(0, width);
    thing2s[i].y = random(0, height);
    thing2s[i].direction = random(0, 360);
  }
}

void draw()
{
  //bg is not conceptually part of the class
  background(0, 0, 0);

  //call the method update everytime I draw
  for (int i = 0; i < NUM_THINGS; i++)
  {
    things[i].update();
  }
  
  for (int i = 0; i < NUM_THING2S; i++)
  {
    thing2s[i].update();
  }
  
  for(int i = 0; i < cnt2s; i++)
  {
    thing22s[i].update();
  }
}

///////////////////////////////////////////////////////

class Thing
{
  //parameters of my thing
  float charge = random(-10, 10);
  float diameterr = charge;
  float x;
  float y;
  float speed = 1;
  float direction = 0;
  float force = 0;
  int col = #FFFFFF;
 
  //Constructor function - same name as the class
  Thing()
  {
  }
 
  //method(s) for my thing
  void update()
  {
    strokeWeight(0.1);
    float dX = cos(radians(direction))*speed;
    float dY = sin(radians(direction))*speed;
 
    //the result are the steps in the vertical and horizontal direction
    x = x + dX;
    y = y + dY;
 
    //managing borders
    if (x > width) x = 0;
    if (x < 0) x = width;
    if (y > height) y = 0;
    if (y < 0) y = height;
    
    //draw the thing  
    fill(col);
    noStroke();
    ellipse(x, y, diameterr, diameterr);
    
    if (speed > 6) speed = 6;
    if (speed < -6) speed = -6;

    for (int i = 0; i < NUM_THINGS; i++)
    {
      Thing other = things[i];
      if (this != other)
      {
        if (dist(x, y, other.x, other.y) < 100)
        {
          stroke(255);
          line(x, y, other.x, other.y);
          force = (charge*other.charge)/sq(dist(x, y, other.x, other.y));
          speed += force;
          direction = -direction;
        }
      }
    }
    ////////////
  }
}

///////////////////////////////////////////////////////

class Thing2
{
  //parameters of my thing
  float diameterr = 5;
  float x;
  float y;
  float speed = 1;
  float direction = 0;
  int col = #0000FF;
  Splash s = new Splash(x, y, 2000);
  boolean dead = false;
 
  //Constructor function - same name as the class
  Thing2(float xx, float yy, float dd, boolean m)
  {
    if (m == true)
    {
      x = xx;
      y = yy;
      direction = dd;
    }
  }
 
  //method(s) for my thing
  void update()
  {
    if (dead == false)
      {
      float dX = cos(radians(direction))*speed;
      float dY = sin(radians(direction))*speed;
   
      //the result are the steps in the vertical and horizontal direction
      x = x + dX;
      y = y + dY;
   
      //managing borders
      if (x > width) x = 0;
      if (x < 0) x = width;
      if (y > height) y = 0;
      if (y < 0) y = height;
      
      //draw the thing  
      fill(col);
      noStroke();
      ellipse(x, y, diameterr, diameterr);
      
      if (speed > 6) speed = 6;
      if (speed < -6) speed = -6;
  
      col = #0000FF;
      diameterr = 5;
      for (int i = 0; i < NUM_THINGS; i++)
      {
        Thing other = things[i];
        if (dist(x, y, other.x, other.y) < 5)
        {
          col = #FF0000;
          diameterr = 10;
          s = new Splash(x, y, 5);
          dead = true;
        }
      }
    }
    s.update();
    ////////////
  }
}

//////////////////////////////////////////////////////

class Splash
{
  float x;
  float y;
  int cnt;

  Splash(float cx, float cy, int c)
  {
    x = cx;
    y = cy;
    cnt = c;
  }

  void update()
  {
    stroke(255, 0, 0);
    strokeWeight(0.5);
    noFill();
    ellipse(x, y, 10+cnt, 10+cnt);
    
    cnt++;
  }
}

void mouseClicked()
{
  thing22s[cnt2s] = new Thing2(mouseX, mouseY, random(0, 360), true);
  if (cnt2s < max_thing2s-1) cnt2s++;
}
