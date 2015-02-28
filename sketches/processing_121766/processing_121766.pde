
float speed = 1;
float angle = 0;
PFont Courier;
float timer = 0;
float girth = 0;
float x = 0;
float t = 0;
float z = 0;
float a = 0;
float b = 0;
float c = 0;
SpriteObject music;
SpriteObject games;



void setup()
{
  size(500,500);
  music = new SpriteObject("music.jpg");
  games = new SpriteObject("games.PNG");
  
}


void draw()
{
  timer += .0167;
  z += speed;
  girth += .05;
  x += .4;
  a -= .3; 
  if(timer > 0 && timer <= 8)
  {
    music.render();
    music.x = 250;
    music.y= 250 ;
    music.s = .5;
    pushMatrix();
    fill(255,0,0);
    textSize(50);
    translate(z,z);
    scale(z/400);
    text("Fuck Yeah",0,0,100);
    popMatrix();
    
    pushMatrix();
    fill(0,255,0);
    translate(2,z);
    text("community",50,453); 
    popMatrix();
    
    pushMatrix();
    fill(151,32,211);
    translate(z,15);
    text("escape",50,453); 
    popMatrix();
    
    pushMatrix();
    translate(a,a);
    fill(255,255,0);
    text("imagination",250,250);
    popMatrix();
    
    pushMatrix();
    text("Fandom",0,0);
    popMatrix();
    
    pushMatrix();
    translate(18,z);
    fill(255,140,0);
    text("this is ok",6,40);
    popMatrix();
    
    
  }
  if(timer > 8 && timer <= 15)
  {
    girth = 0;
    x=0;
    a=0;
    z=0;
    z += speed;
    girth += .05;
    x += .4;
    a -= .3; 
    games.render();
    games.x = 250;
    games.y = 250;
    pushMatrix();
    fill(255,0,0);
    textSize(50);
    translate(z,z);
    scale(z/400);
    text("Fuck Yeah",0,0,100);
    popMatrix();
    
    pushMatrix();
    fill(0,255,0);
    translate(2,z);
    text("community",50,453); 
    popMatrix();
    
    pushMatrix();
    fill(151,32,211);
    translate(z,15);
    text("escape",50,453); 
    popMatrix();
    
    pushMatrix();
    translate(a,a);
    fill(255,255,0);
    text("imagination",250,250);
    popMatrix();
    
    pushMatrix();
    text("Fandom",0,0);
    popMatrix();
    
    pushMatrix();
    translate(18,z);
    fill(255,140,0);
    text("this is not",6,40);
    popMatrix();

  }
  
  if (timer > 16)
  {
    timer = 0;
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



