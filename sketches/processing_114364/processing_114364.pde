
//CODE REFERENCE FOR SOUND
//http://www.openprocessing.org/sketch/53707

// IMAGE REFERENCE BY CRCR - "ABORTED PROJECT"
//http://vimeo.com/44109978

SpriteObject[] mysprites = new SpriteObject[27];
int currentSprite = 0;
float timer = 0;
 
void setup()
{
  size(400,225);
  
  mysprites[0] = new SpriteObject ("00.png");
  mysprites[1] = new SpriteObject ("0.png");
  mysprites[2] = new SpriteObject ("1.png");
  mysprites[3] = new SpriteObject ("2.png");
  mysprites[4] = new SpriteObject ("3.png");
  mysprites[5] = new SpriteObject ("4.png");
  mysprites[6] = new SpriteObject ("5.png");
  mysprites[7] = new SpriteObject ("6.png");
  mysprites[8] = new SpriteObject ("7.png");
  mysprites[9] = new SpriteObject ("8.png");
  mysprites[10] = new SpriteObject ("9.png");
  mysprites[11] = new SpriteObject ("10.png");
  mysprites[12] = new SpriteObject ("11.png");
  mysprites[13] = new SpriteObject ("12.png");
  mysprites[14] = new SpriteObject ("13.png");
  mysprites[15] = new SpriteObject ("14.png");
  mysprites[16] = new SpriteObject ("15.png");
  mysprites[17] = new SpriteObject ("16.png");
  mysprites[18] = new SpriteObject ("17.png");
  mysprites[19] = new SpriteObject ("18.png");
  mysprites[20] = new SpriteObject ("19.png");
  mysprites[21] = new SpriteObject ("20.png");
  mysprites[22] = new SpriteObject ("21.png");
  mysprites[23] = new SpriteObject ("22.png");
  mysprites[24] = new SpriteObject ("23.png");
  mysprites[25] = new SpriteObject ("24.png");
  mysprites[26] = new SpriteObject ("25.png");
 
}
 
void draw()
{
  if (currentSprite >= 27)
  {
    currentSprite = 0;
}
  mysprites [currentSprite].render();
}

void mouseReleased()
{
  if (mouseButton == LEFT)
  {
    currentSprite ++;
  }
  if (mouseButton == RIGHT)
  {
    currentSprite ++;
  }
}

void keyPressed() 
{
  if (key == 's') 
  {
    strobelight();
  }
}

class SpriteObject
{
  float x = 400;
  float y = 225;
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
      translate(this.x / 2, this.y /2);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}

void strobelight()
{
 filter(INVERT);
}



