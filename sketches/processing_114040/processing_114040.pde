
SpriteObject[] mysprites = new SpriteObject[10];
float counter = 0, inputSpeed=0, input;
int imgNum = 0;

void setup()
{
  size(500,500);
  for (int i = 0; i <= 9; i++)
  {
    mysprites[i] = new SpriteObject((i+1)+".jpg");
  }
}

void draw()
{
  if(keyPressed&&key==' ')
  {
    imgNum=int(random(0,9));
    counter=0;
  }
  mysprites[imgNum].render();
  if(keyPressed&&keyCode==UP)
  {
    if(inputSpeed>=-100)
    {
      inputSpeed-=50;
    }
  }
  if(keyPressed&&keyCode==DOWN)
  {
    if(inputSpeed<=200)
    {
      inputSpeed+=50;
    }
  }
  if(keyPressed&&keyCode==LEFT)
  {
    imgNum--;
    if(imgNum<0)
    {
      imgNum=9;
    }
    counter=0;
    keyCode=ENTER;
  }
  if(counter>200+inputSpeed||keyPressed&&keyCode==RIGHT)
  {
    imgNum++;
    if(imgNum>9)
    {
      imgNum=0;
    }
    counter=0;
  }
  counter++;
  keyCode=ENTER;
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
    }
      
    if (loaded)
    {
      imageMode(CORNER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, 500, 500);
      popMatrix();
    }
  }
}


