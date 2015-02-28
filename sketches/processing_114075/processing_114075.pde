
/* @ pjs preload = "animal0.jpg, animal1.jpg, animal2.jpg, animal3.jpg, animal4.jpg, animal5.jpg, animal6.jpg, animal7.jpg,
animal8.jpg, animal9.jpg"; */

int index = 0;
SpriteObject[] pic = new SpriteObject[10];
float timer = 0;
float myframerate = 20;
void setup()
{ 
  size(250,250);
  for (int i = 0; i < 10; i += 1)
  { 
    pic[i] = new SpriteObject("animal" + i + ".jpg");
    pic[i].x = width/2;
    pic[i].y = height/2;
  }
  frameRate(myframerate);
}

void draw()
{
  timer += 1;
 pic[index].render();
 
 
 if (timer >= 30)
 { 
   index += 1;
   timer = 0;
 }
 if (index > 9)
 { 
   index = 0;
 }
 if (index <0)
 {
   index = 0;
 }
}

void keyPressed()
{
  if (key == CODED)
  {
    if(keyCode == RIGHT)  
    { index += 1;
      timer = 0;
    }
    if(keyCode == LEFT)
    { 
     index -= 1;
     timer = 0;     
    }
    if(keyCode == UP)
    {
      myframerate += 10;
      frameRate(myframerate);
    }
    if(keyCode == DOWN)
    {
      myframerate -= 10;
      if (myframerate <= 20)
      {
        myframerate = 20;
      }
      frameRate(myframerate);
    }  
  }
  if (key == " ")
    {
      index = random(9);
      timer = 0;
    }
  println(frameRate);
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




