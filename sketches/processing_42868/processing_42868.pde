
PImage innards;
PImage openFlesh;
PImage bacterium;
PImage whiteBloodCell;
PImage cell;
int millisRolloverTime;
int prevSec;
int S;
int mils;

ArrayList<Bacterium> bacteria;
ArrayList<Cell> cells;
ArrayList<WhiteBloodCell> wbc;

void setup()
{
  smooth();
  size(700, 700);
  background(0);
  imageMode(CENTER);
  
  innards = loadImage("innards.png");
  openFlesh = loadImage("openSkin.png");
  bacterium = loadImage("bacterium.png");
  cell = loadImage("cell.png");
  whiteBloodCell = loadImage("whiteBloodCell.png");
  
  millisRolloverTime = 0;
  
  bacteria = new ArrayList<Bacterium>();
  cells = new ArrayList<Cell>();
  wbc = new ArrayList<WhiteBloodCell>();
  
  for (int i = 0; i < 5; i++) 
  {
    bacteria.add(new Bacterium(random(0, width), random(200, height - 90), random(0, 360)));   // populating the array
  }
}

void draw()
{
  background(0);
  
  S = second();
  if(prevSec != S) millisRolloverTime = millis();
  
  prevSec = S;
  mils = millis() - millisRolloverTime;
  
  drawInnards();
  
  for(int i = 0; i < bacteria.size(); i++)
  {
      bacteria.get(i).update();
  }
  for(int i = 0; i < cells.size(); i++)
  {
      cells.get(i).update();
  }
  for(int i = 0; i < wbc.size(); i++)
  {
      wbc.get(i).update();
  }
  
  image(openFlesh, width/2, height/2);
}

void drawInnards()
{
    S = second();
  if(prevSec != S) millisRolloverTime = millis();
  
  prevSec = S;
  mils = millis() - millisRolloverTime;
  
  int dS = int(700 + 20 * sin(mils*(TWO_PI)*.0002));
  
  image(innards, 350, 350, dS, dS);
}

class Bacterium
{
  //parameters of my thing
  float myRadius;
  float x;
  float y;
  float accelX;
  float accelY;
  float speedX;
  float speedY;
  float direction;
  float attractionX; 
  float attractionY;
  float repulsionX;
  float repulsionY;
  float originalDirection;
 
  //Constructor function - same name as the class
  Bacterium(float X, float Y, float angle)
  {
    x = X;
    y = Y;
    direction = angle;
    originalDirection = angle;
    myRadius = 17;
    speedX = 2;
    speedY = 2;
  }
 
  //method(s) for my thing
  void update()
  {
    /*
    convert direction into radians
     break it down to the sinus and cosinus
     which are the vertical and horizontal component 
     of the angle then multiply for speed 
     (because in trigonometry you always work with a radius of 1)
     */
    float dX = cos(radians(direction))*speedX;
    float dY = sin(radians(direction))*speedY;
 
    //the result are the steps in the vertical and horizontal direction
    x = x + dX + attractionX + repulsionX;
    y = y + dY + attractionY + repulsionY;
 
    //direction++;
 
    //managing borders
    if (x > width || x < 0)
    {
      speedX *= -1;
    }
    if (y > height - 90 || y < 200)   
    {
      speedY *= -1;
    }
 
    //draw the thing  
    image(bacterium, x, y);
 

    //example of interaction among things//
    //every object scans the other objects using the global array
    for (int i = 0; i < cells.size(); i++)
    {
      //temporary variable to store the other
      Cell target = cells.get(i);
 
      if((target.x > (x - myRadius) && target.x < (x + myRadius)) && (target.y > (y - myRadius) && target.y < (y + myRadius)))
      {
        cells.remove(i);
        bacteria.add(new Bacterium(x, y, random(0, 360)));
      }
      else if (dist(x, y, target.x, target.y) < 75)
      {
        direction += .5;
        float change =  5 * noise(direction);
        attractionX = (-x + target.x) / 50;
        attractionY = (-y + target.y) / 50;
        
        if(attractionX < 0) attractionX -= change;
        else attractionX += change;
                
        if(attractionY < 0) attractionY -= change;
        else attractionY += change; 
      }
      else if(dist(x, y, target.x, target.y) < 150)
      {
        direction += .3;
        float change =  2 * noise(direction);
        attractionX = (-x + target.x) / 100;
        attractionY = (-y + target.y) / 100;
        
        if(attractionX < 0) attractionX -= change;
        else attractionX += change;
                
        if(attractionY < 0) attractionY -= change;
        else attractionY += change; 
        
      }
      else
      {
        attractionX = 0;
        attractionY = 0;
        direction = originalDirection;
      }
      
    }
    
    for (int i = 0; i < wbc.size(); i++)
    {
      //temporary variable to store the other
      WhiteBloodCell predator = wbc.get(i);
 
      if (dist(x, y, predator.x, predator.y) < 75)
      {
        direction -= .6;
        float change =  6 * noise(direction);
        repulsionX = -(-x + predator.x) / 40;
        repulsionY = -(-y + predator.y) / 40;
        
        if(repulsionX < 0) repulsionX -= change;
        else repulsionX += change;
                
        if(repulsionY < 0) repulsionY -= change;
        else repulsionY += change; 
      }
      else if(dist(x, y, predator.x, predator.y) < 150)
      {
        direction -= .4;
        float change =  2 * noise(direction);
        repulsionX = -(-x + predator.x) / 100;
        repulsionY = -(-y + predator.y) / 100;
        
        if(repulsionX < 0) repulsionX -= change;
        else repulsionX += change;
                
        if(repulsionY < 0) repulsionY -= change;
        else repulsionY += change; 
        
      }
      else
      {
        repulsionX = 0;
        repulsionY = 0;
        direction = originalDirection;
      }
      
    }

  }
}

class Cell
{
  //parameters of my thing
  float myRadius;
  float x;
  float y;
  float speedX;
  float speedY;
  float direction;
  float repulsionX; 
  float repulsionY;
  float originalDirection;
 
  //Constructor function - same name as the class
  Cell(float X, float Y, float angle)
  {
    x = X;
    y = Y;
    direction = angle;
    originalDirection = angle;
    myRadius = 12;
    speedX = 3;
    speedY = 3;
  }
 
  //method(s) for my thing
  void update()
  {
    /*
    convert direction into radians
     break it down to the sinus and cosinus
     which are the vertical and horizontal component 
     of the angle then multiply for speed 
     (because in trigonometry you always work with a radius of 1)
     */
    float dX = cos(radians(direction))*speedX;
    float dY = sin(radians(direction))*speedY;
 
    //the result are the steps in the vertical and horizontal direction
    x = x + dX + repulsionX;
    y = y + dY + repulsionY;
 
    //direction++;
 
    //managing borders
    if (x > width || x < 0)
    {
      speedX *= -1;
    }
    if (y > height - 90 || y < 200)   
    {
      speedY *= -1;
    }
 
    //draw the thing  
    image(cell, x, y);
 

    //example of interaction among things//
    //every object scans the other objects using the global array
    for (int i = 0; i < bacteria.size(); i++)
    {
      //temporary variable to store the other
      Bacterium predator = bacteria.get(i);
 
      if (dist(x, y, predator.x, predator.y) < 75)
      {
        direction -= .6;
        float change =  6 * noise(direction);
        repulsionX = -(-x + predator.x) / 40;
        repulsionY = -(-y + predator.y) / 40;
        
        if(repulsionX < 0) repulsionX -= change;
        else repulsionX += change;
                
        if(repulsionY < 0) repulsionY -= change;
        else repulsionY += change; 
      }
      else if(dist(x, y, predator.x, predator.y) < 150)
      {
        direction -= .4;
        float change =  2 * noise(direction);
        repulsionX = -(-x + predator.x) / 90;
        repulsionY = -(-y + predator.y) / 90;
        
        if(repulsionX < 0) repulsionX -= change;
        else repulsionX += change;
                
        if(repulsionY < 0) repulsionY -= change;
        else repulsionY += change; 
        
      }
      else
      {
        repulsionX = 0;
        repulsionY = 0;
        direction = originalDirection;
      }
      
    }
  }
}

class WhiteBloodCell
{
  //parameters of my thing
  float myRadius;
  float x;
  float y;
  float speedX;
  float speedY;
  float direction;
  float attractionX; 
  float attractionY;
  float originalDirection;
  int numEaten;
  int placeInArray;
  float sc;
 
  //Constructor function - same name as the class
  WhiteBloodCell(float X, float Y, float angle, int place)
  {
    x = X;
    y = Y;
    direction = angle;
    originalDirection = angle;
    myRadius = 25;
    speedX = 3;
    speedY = 3;
    numEaten = 0;
    placeInArray = place;
    sc = 1;
  }
 
  //method(s) for my thing
  void update()
  {
    /*
    convert direction into radians
     break it down to the sinus and cosinus
     which are the vertical and horizontal component 
     of the angle then multiply for speed 
     (because in trigonometry you always work with a radius of 1)
     */
     
    if(numEaten < 5)
    {
      float dX = cos(radians(direction))*speedX;
      float dY = sin(radians(direction))*speedY;
   
      //the result are the steps in the vertical and horizontal direction
      x = x + dX + attractionX;
      y = y + dY + attractionY;
   
      //direction++;
   
      //managing borders
      if (x > width || x < 0)
      {
        speedX *= -1;
      }
      if (y > height - 90 || y < 200)   
      {
        speedY *= -1;
      }
   
      //draw the thing  
      image(whiteBloodCell, x, y);
   
  
      //example of interaction among things//
      //every object scans the other objects using the global array
      for (int i = 0; i < bacteria.size(); i++)
      {
        //temporary variable to store the other
        Bacterium target = bacteria.get(i);
   
        if((target.x > (x - myRadius) && target.x < (x + myRadius)) && (target.y > (y - myRadius) && target.y < (y + myRadius)))
        {
          bacteria.remove(i);
          numEaten++;
        }
        else if (dist(x, y, target.x, target.y) < 75)
        {
          direction += .5;
          float change =  4 * noise(direction);
          attractionX = (-x + target.x) / 30;
          attractionY = (-y + target.y) / 30;
          
          if(attractionX < 0) attractionX -= change;
          else attractionX += change;
                  
          if(attractionY < 0) attractionY -= change;
          else attractionY += change; 
        }
        else if(dist(x, y, target.x, target.y) < 150)
        {
          direction += .3;
          float change =  2 * noise(direction);
          attractionX = (-x + target.x) / 80;
          attractionY = (-y + target.y) / 80;
          
          if(attractionX < 0) attractionX -= change;
          else attractionX += change;
                  
          if(attractionY < 0) attractionY -= change;
          else attractionY += change; 
          
        }
        else
        {
          attractionX = 0;
          attractionY = 0;
          direction = originalDirection;
        }
      
      }
    }
    else
    {
      if(sc > 0)
      {
        pushMatrix();
        translate(x, y);
        scale(sc);
        image(whiteBloodCell, 0, 0);
        popMatrix();
        sc -= .01;
      }
      else
      {
        wbc.remove(placeInArray);
        for(int j = 0; j < wbc.size(); j++)
        {
          if(wbc.get(j).placeInArray > this.placeInArray)
            wbc.get(j).placeInArray -= 1;
        }  
      }
    }
  }
}
void keyPressed()
{
  if(key == 'c') cells.add(new Cell(mouseX, mouseY, random(0, 360)));
  else if(key == 'w') wbc.add(new WhiteBloodCell(mouseX, mouseY, random(0, 360), wbc.size())); 
}


