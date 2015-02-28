
SpriteObject[] mysprites = new SpriteObject[10];
float timer = 0;
int currentSprite = 0;
int rate;
int index;
  
void setup()
{
  size(250, 250);
 
  for (int i = 0; i < 10; i++)
  {
    mysprites[i] = new SpriteObject("animal" + i + ".jpg");
    mysprites[i].x = 125;
    mysprites[i].y = 125;
  }
  index = 0;
  frameRate(15); 

}

void draw()
{
  frameRate(rate); 
  mysprites[index].render();
  index ++;
  background(0); 
  timer += 0.0167;

if (index > 9)
{
  index = 0;
}
print("Index: " + index + " ");
 println("Rate: " + rate);


} 

void keyPressed() 
{
  if (key == CODED) 
  {
    if (keyCode == LEFT)
    {
      rate += 1;
    }
    if (keyCODED == RIGHT) 
    {
      rate -= 1;
    } 
    if (keyCode == ' ')
    {
      index = (int)random(0,9);
    }
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


