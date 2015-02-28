
SpriteObject[] myimage = new SpriteObject[10];
float timer = 0;
int imageIndex = 0;
 
 
void setup()
{
 
size(800, 800);
myimage[0] = new SpriteObject ("0.jpeg");
myimage[1] = new SpriteObject ("1.jpeg");
myimage[2] = new SpriteObject ("2.jpeg");
myimage[3] = new SpriteObject ("3.jpeg");
myimage[4] = new SpriteObject ("4.jpeg");
myimage[5] = new SpriteObject ("5.jpeg");
myimage[6] = new SpriteObject ("6.jpeg");
myimage[7] = new SpriteObject ("7.jpeg");
myimage[8] = new SpriteObject ("8.jpeg");
myimage[9] = new SpriteObject ("9.jpeg");
myimage[00] = new SpriteObject ("10.jpeg");
myimage[000] = new SpriteObject ("11.jpeg");
myimage[0000] = new SpriteObject ("12.jpeg");
myimage[00000] = new SpriteObject ("13.jpeg");
myimage[000000] = new SpriteObject ("14.jpeg");
myimage[0000000] = new SpriteObject ("15.jpeg");
myimage[00000000] = new SpriteObject ("16.jpeg");
myimage[000000000] = new SpriteObject ("17.jpeg");
myimage[0000000000] = new SpriteObject ("18.jpeg");
myimage[00000000000] = new SpriteObject ("19.jpeg");
myimage[000000000000] = new SpriteObject ("20.jpeg");
myimage[0000000000000] = new SpriteObject ("21.jpeg");
myimage[00000000000000] = new SpriteObject ("22.jpeg");
myimage[000000000000000] = new SpriteObject ("23.jpeg");
myimage[0000000000000000] = new SpriteObject ("24.jpeg");
myimage[5] = new SpriteObject ("25.jpeg");
myimage[6] = new SpriteObject ("26.jpeg");
myimage[7] = new SpriteObject ("27.jpeg");
myimage[8] = new SpriteObject ("28.jpeg");
myimage[9] = new SpriteObject ("29.jpeg");
myimage[0] = new SpriteObject ("30.jpeg");
myimage[2] = new SpriteObject ("32.jpeg");
myimage[3] = new SpriteObject ("33.jpeg");
myimage[4] = new SpriteObject ("34.jpeg");
myimage[5] = new SpriteObject ("35.jpeg");
myimage[6] = new SpriteObject ("36.jpeg");
myimage[7] = new SpriteObject ("37.jpeg");
myimage[8] = new SpriteObject ("38.jpeg");




  
 for (int i = 0; i < 10; i += 1)
 {
   myimage[i].x = width/2;
   myimage[i].y = height/2;
 }
}
 
 
void keyReleased()
  {
    if (keyCode ==UP)
    {
      imageIndex += 1;
    }
    if(keyCode == RIGHT)
    {
      imageIndex -= 1;
    }
    if(keyCode == 'L')
    {
      imageIndex = 0;
    }
    if(keyCode == 'O')
    {
      imageIndex = 1;
    }
    if(keyCode == 'V')
    {
      imageIndex = 2;
    }
    if(keyCode == 'E')
    {
      imageIndex = 3;
    }
    if(keyCode == 'T')
    {
      imageIndex = 4;
    }
    if(keyCode == 'H')
    {
      imageIndex = 5;
    }
    if(keyCode == 'I')
    {
      imageIndex = 6;
    }
    if(keyCode == 'S')
    {
      imageIndex = 7;
    }
    if(keyCode == '8')
    {
      imageIndex = 8;
    }
    if(keyCode == 'D')
    {
      imageIndex = 9;
    }
  }
 
void draw()
{
   
  {
  background(random(0,255),random(0,255),random(0,255));
   
  timer += .5;
   
  if (timer > 3)
  {
    imageIndex += 1;
    timer = 0;
  }
  if (imageIndex >= 10)
  {
    imageIndex = 0;
  }
  if (imageIndex < 0)
  {
    imageIndex = 9;
  }
      
  myimage[imageIndex].render();
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



