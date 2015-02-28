
import controlP5.*;
ControlP5 controlP5;
PImage img;

boolean rightKey= false;
boolean leftKey= false;
boolean upKey= false;
boolean downKey= false;

ArrayList objectList;

PlayerCat player;
int numFoods = 15;
int weight = 0;


void setup () 
{ 
  img = loadImage("backgroundclouds.jpg");
  size(1024,720);
  smooth();
  controlP5 = new ControlP5(this);
  // change the default font to Verdana
  PFont p = createFont("Verdana",15); 
  controlP5.setControlFont(p);
//  // change button colors
  controlP5.setColorForeground(0xff003399);
  controlP5.setColorBackground(0xffFFFFF);
  controlP5.setColorLabel(0xffdddddd);
  controlP5.setColorValue(0xffff88ff);
  controlP5.setColorActive(0xffff3333); 
  controlP5.addButton("BINGE SOME MORE",1,70,10,160,40);
  
  player = new PlayerCat(); 
  restart();
}


void restart() 
{
  objectList = new ArrayList();
  for (int i = 0; i < numFoods; i++)
  {
    if (i%3 == 0)
    {
      objectList.add(new Poison());
    }
    else
    {
      objectList.add(new Food());
    }

  }
  
 
  player.regenerate();
  weight=0;
}


void controlEvent(ControlEvent theEvent) 
{
  if(theEvent.isController()) 
  {
    if(theEvent.controller().name()=="BINGE SOME MORE")
    {
      restart();
    }
  }

}







void draw() 
{
  image(img, 0, 0);
//  counter ++;
  if(player.unEaten)
  {
    player.drawMe(boolean (frameCount/ 50 % 2));
    player.checkWalls();
    player.update(upKey,downKey,leftKey,rightKey);
  }

  // draw candies
  for (int i = 0; i < objectList.size(); i++) 
  { 
    // for each candy call drawMe() method
    Food candy = (Food)objectList.get(i);
    candy.drawMe();
    candy.update();
       
    if(player.unEaten)
    {
      if(player.touch(candy))
      {
        if(candy instanceof Poison)
        {
          Poison badCandy = (Poison)candy;
          badCandy.drawMe();
          badCandy.update();
          badCandy.regenerate(objectList);
          
          if(badCandy.unEaten)
          {
            weight = weight/2;
            
            if(player.objectSize <= 0.5)
            {
              player.shrink(0);
            }
            else
            {
              player.shrink(0.4);
            }
            badCandy.unEaten = false;
            badCandy.destroy(objectList);
            badCandy.regenerate(objectList);
          }
        }
        // player cat grows by .04 times the size of eaten candy 
        player.grow(candy.objectSize * 0.03);
        candy.destroy(objectList);
        candy.regenerate(objectList);
        
        float sizeDifference = candy.objectSize/player.objectSize;
        // increase in weight depends on difference in size between size of cat and size of candy eaten
        if(sizeDifference > 1)
        {
          weight += 20;
        }
        else if(sizeDifference > 0.8)
        {
          weight += 10;
        }
        else
        {
          weight += 5;
        }
      }
    }

    
    if(candy.detectOffScreen())
    {
      candy.destroy(objectList);
      candy.regenerate(objectList);
    }

  
  fill(100);
  text("WEIGHT: "+ weight + "  POUNDS", 70, 650);
  
 }
}
  

  
  
void keyPressed() 
{ 
  if(key == CODED)
  {
    if (keyCode == RIGHT)
    {
      rightKey = true;
    }
    if (keyCode == LEFT)
    {
      leftKey = true;
    }
    if (keyCode == UP)
    {
      upKey = true;
    }
    if (keyCode == DOWN)
    {
      downKey = true;
    }
  }
}

void keyReleased()
{
  if(key == CODED)
  {
    if (keyCode == RIGHT)
    {
      rightKey = false;
    }
    if (keyCode == LEFT)
    {
      leftKey = false;
    }
    if (keyCode == UP)
    {
      upKey = false;
    }
    if (keyCode == DOWN)
    {
      downKey = false;
    }
  }
}




  

