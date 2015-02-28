
SpriteObject[] images = new SpriteObject[15];
int imageIndex = 0;
float timer = 0;
PImage troll;

void setup()
{
  size(700, 700);
  background(#FFFFFF);
  
 
  
  
  images[0] = new SpriteObject("intro.png");
  images[1] = new SpriteObject("waiting.png");
  images[2] = new SpriteObject("nails.png");
  images[3] = new SpriteObject("huh.png");
  images[4] = new SpriteObject("hangnail.png");
  images[5] = new SpriteObject("hmm.png");
  images[6] = new SpriteObject("challenge.png");
  images[7] = new SpriteObject("biting.png");
  images[8] = new SpriteObject("blood1.png");
  images[9] = new SpriteObject("blood2.png");
  images[10] = new SpriteObject("rage.png");
  images[11] = new SpriteObject("arm.png");
  images[12] = new SpriteObject("result.png");
  images[13] = new SpriteObject("nuclear.png");
  images[14] = new SpriteObject("end.png");
  
  
 troll = loadImage("troll.png");
  image(troll,0,0);

 
}



void draw()
{

{ 
  background(0);
  imageMode(CENTER);
 image(troll, mouseX, mouseY);
}


{
  if (mousePressed && (mouseButton == LEFT)) {
    fill(0);
  } else if (mousePressed && (mouseButton == RIGHT)) {
    fill(255);
  } else {
    fill(#F50202);
  }
  rect(75, 75, 550, 550);
}




  
  timer += 0.0167;
  images[imageIndex].render();
  if (timer > 2)
  {
    timer = 0;
    imageIndex += 1;
  }

  if (imageIndex >= 15)
  {
    imageIndex = 0;
  }
}


void keyReleased()
{
  if (key == '0')
  {
    imageIndex = 0;
  }
  if (key == '1')
  {
    imageIndex = 1;
  }
  if (key == '2')
  {
    imageIndex = 2;
  }
  if (key == '3')
  {
    imageIndex = 3;
  }   
     if (key == '4')
  {
    imageIndex = 4;
  }
  if (key == '5')
  {
    imageIndex = 5;
  }
  if (key == '6')
  {
    imageIndex = 6;
  }
  if (key == '7')
  {
    imageIndex = 7;
  }
    if (key == '8')
  {
    imageIndex = 8;
  }
  if (key == '9')
  {
    imageIndex = 9;
  }
   
  if (key == CODED)
  {
    if (keyCode == RIGHT)
    {
      imageIndex += 1;
    }
  }
  
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      imageIndex += -1;
    }
  }
  
}


class SpriteObject
{
  float x = 350.0;
  float y = 350.0;
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



