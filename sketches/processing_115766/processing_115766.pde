
float prevX;
float prevY;
int selectbrush = 1;
int instructions = 0;
int timer = 0;
SpriteObject dogPrint;
SpriteObject trollFace;


void setup()
{
  background(255);
  size(500,500);
  dogPrint = new SpriteObject("DogPaw.png");
  trollFace = new SpriteObject("troll.png");
  dogPrint.w = 50;
  dogPrint.h = 50;
  trollFace.w = random(25,100);
  trollFace.h = trollFace.w;
}

void draw()
{
  if (instructions == 0)
  {
  fill(0);
  textSize(32);
  text("Instructions",150,100);
  textSize(20);
  text("Press 1,2, or 3 for the different brushes",100,150);
  text("Press 'W' and 'E' to rotate the 2nd brush", 100,200);
  text("Press '4' to clear the screen", 100, 250);
  text("Press '5' to display instructions", 100,300);
  text("Press 'S' to begin!", 100, 350);
  }
  
  if (keyPressed)
  {
    if (key == '4')
    {
      background(255);
    }
    if (key == '5')
    {
      background(255);
      instructions = 0;
    }
    if (key == 'S' || key == 's')
    {
      background(255);
      instructions = 1;
      selectbrush = 1;
    }
            if (keyPressed)
        {
          if (key == 'e' || key == 'E')
          {
            dogPrint.rotation += 5;
          }
          if (key == 'w' || key == 'W')
          {
            dogPrint.rotation -=5;
          }
         }
  }
if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      
      if (selectbrush == 1 && instructions == 1)
      {
        strokeWeight(10);
        stroke(255,0,0);
        line(prevX, prevY, mouseX, mouseY);
      }
      if (selectbrush == 2 && instructions == 1)
      {
        fill(255,0,0);
        dogPrint.x = mouseX;
        dogPrint.y = mouseY;
        dogPrint.render();

       }
       
       if (selectbrush == 3 && instructions == 1)
       {
         timer++;
         stroke(random(1,500));
         fill(66,88,random(100,200));
         ellipse(prevX+(random(-100,100)), prevY+(random(-100,100)), mouseX, mouseY); 
         if (timer == 1)
            {
              timer = 0;
              trollFace.x = random(50,450);
              trollFace.y = random(50,450);
              trollFace.render();
            }

       }
    }
  }
  prevX = mouseX;
  prevY = mouseY;
}


void keyReleased()
{

  if (key == '1')
  {
    selectbrush = 1;
  }
   if (key == '2')
  {
    selectbrush = 2;
  }
  if (key == '3')
  {
    selectbrush = 3;
  }
   
}

class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
    
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
    
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }
      
    if (loaded)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}


