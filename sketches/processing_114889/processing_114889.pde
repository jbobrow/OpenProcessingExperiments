
SpriteObject[] imageSet = new SpriteObject[13];


PImage zed;


void setup(){
  
  size(1200,500);
  background(0);
  frameRate(60);
  
    
   
    
    imageSet[0] = new SpriteObject("league0.png");
    imageSet[1] = new SpriteObject("league1.png");
    imageSet[2] = new SpriteObject("league2.png");
    imageSet[3] = new SpriteObject("league3.png");
    imageSet[4] = new SpriteObject("league4.png");
    imageSet[5] = new SpriteObject("league5.png");
    imageSet[6] = new SpriteObject("league6.png");
    imageSet[7] = new SpriteObject("league7.png");
    imageSet[8] = new SpriteObject("league8.png");
    imageSet[9] = new SpriteObject("league9.png");
 
    
    imageSet[10] = new SpriteObject("league20.png");
    //Zed
    
    imageSet[11] = new SpriteObject("league21.png");
    //Bork
    
   
    
    
  }
  



void draw(){
  
  //Crank
  
  for (int i = 0; i < 3; i++)
  {
    imageSet[0].x += 1;
    imageSet[0].y = 100;
    imageSet[0].render();
    imageSet[0].w = 50;
    imageSet[0].h = 50;

  }
  
  if (imageSet[0].x >1400)
  {
    imageSet[0].x = 0;
  }
  
  //Cockroach
  
   for (int i = 0; i < 3.3; i++)
  {
   
    imageSet[1].x += 1;
    imageSet[1].y = 400;
    imageSet[1].w = 50;
    imageSet[1].h = 50;
    imageSet[1].render();

  }
  
  if (imageSet[1].x >1400)
  {
    imageSet[1].x = -50;
  }
  
  //Fox
  
     for (int i = 0; i < 1.75; i++)
  {
   
    imageSet[2].x += 1;
    imageSet[2].y = 475;
    imageSet[2].w = 50;
    imageSet[2].h = 50;
    imageSet[2].render();

  }
  
  if (imageSet[2].x >1400)
  {
    imageSet[2].x = -0;
  }
  
  //Sidebust
  
       for (int i = 0; i < 3.3; i++)
  {
   
    imageSet[3].x += 1;
    imageSet[3].y = 125;
    imageSet[3].w = 50;
    imageSet[3].h = 50;
    imageSet[3].render();

  }
  
  if (imageSet[3].x >1400)
  {
    imageSet[3].x = 50;
  }
  
  //Cow
  
       for (int i = 0; i < 4; i++)
  {
   
    imageSet[4].x += 1;
    imageSet[4].y = 50;
    imageSet[4].w = 50;
    imageSet[4].h = 50;
    imageSet[4].render();

  }
  
  if (imageSet[4].x >1400)
  {
    imageSet[4].x = -100;
  }
  
  //Tumblr
  
       for (int i = 0; i < 1.45; i++)
  {
   
    imageSet[5].x += 1;
    imageSet[5].y = 250;
    imageSet[5].w = 50;
    imageSet[5].h = 50;
    imageSet[5].render();

  }
  
  if (imageSet[5].x >1400)
  {
    imageSet[5].x = 0;
  }
  
  //How to press R
  
       for (int i = 0; i < 2.25; i++)
  {
   
    imageSet[6].x += 1;
    imageSet[6].y = 300;
    imageSet[6].w = 50;
    imageSet[6].h = 50;
    imageSet[6].render();

  }
  
  if (imageSet[6].x >1400)
  {
    imageSet[6].x = -150;
  }
  
  //Shushei
  
       for (int i = 0; i < 2.3; i++)
  {
   
    imageSet[7].x += 1;
    imageSet[7].y = 425;
    imageSet[7].w = 50;
    imageSet[7].h = 50;
    imageSet[7].render();

  }
  
  if (imageSet[7].x >1400)
  {
    imageSet[7].x = -100;
  }
  
  //Cait
  
         for (int i = 0; i < 5; i++)
  {
   
    imageSet[8].x += 1;
    imageSet[8].y = 300;
    imageSet[8].w = 50;
    imageSet[8].h = 50;
    imageSet[8].render();

  }
  
  if (imageSet[8].x >1400)
  {
    imageSet[8].x = -200;
  }
  
  //Cookie
  
         for (int i = 0; i < 4.5; i++)
  {
   
    imageSet[9].x += 1;
    imageSet[9].y = 175;
    imageSet[9].w = 50;
    imageSet[9].h = 50;
    imageSet[9].render();

  }
  
  if (imageSet[9].x >1400)
  {
    imageSet[9].x = -25;
  }
  
  
  //Zed 
  
 for (int i = 0; i < 4.5; i++)
  {
   
    imageSet[10].x = width/2;
    imageSet[10].y = height/2;
    imageSet[10].w = 100;
    imageSet[10].h = 100;
    imageSet[10].render();

  }
  
  if (imageSet[9].x >1400)
  {
    imageSet[9].x = -25;
  }
 

  }

  
  
  //=============================================================
  
  
 void mouseMoved(){
   

for (int i = 0; i < 4.5; i++)
  {
   
    imageSet[11].x = 700;
    imageSet[11].y = 250;
    imageSet[11].w = 75;
    imageSet[11].h = 75;
    imageSet[11].render();

  }
  
  if (imageSet[9].x >1400)
  {
    imageSet[9].x = -25;
  }
   


        
//Crank
  
  for (int i = 0; i < 4; i++)
  {
    imageSet[0].x += 1;
    imageSet[0].y = 100;
    imageSet[0].render();
    imageSet[0].w = 50;
    imageSet[0].h = 50;

  }
  
  if (imageSet[0].x >1400)
  {
    imageSet[0].x = 0;
  }
  
  //Cockroach
  
   for (int i = 0; i < 4.3; i++)
  {
   
    imageSet[1].x += 1;
    imageSet[1].y = 400;
    imageSet[1].w = 50;
    imageSet[1].h = 50;
    imageSet[1].render();

  }
  
  if (imageSet[1].x >1400)
  {
    imageSet[1].x = -50;
  }
  
  //Fox
  
     for (int i = 0; i < 4.75; i++)
  {
   
    imageSet[2].x += 1;
    imageSet[2].y = 475;
    imageSet[2].w = 50;
    imageSet[2].h = 50;
    imageSet[2].render();

  }
  
  if (imageSet[2].x >1400)
  {
    imageSet[2].x = -0;
  }
  
  //Sidebust
  
       for (int i = 0; i < 5.3; i++)
  {
   
    imageSet[3].x += 1;
    imageSet[3].y = 125;
    imageSet[3].w = 50;
    imageSet[3].h = 50;
    imageSet[3].render();

  }
  
  if (imageSet[3].x >1400)
  {
    imageSet[3].x = 50;
  }
  
  //Cow
  
       for (int i = 0; i < 5; i++)
  {
   
    imageSet[4].x += 1;
    imageSet[4].y = 50;
    imageSet[4].w = 50;
    imageSet[4].h = 50;
    imageSet[4].render();

  }
  
  if (imageSet[4].x >1400)
  {
    imageSet[4].x = -100;
  }
  
  //Tumblr
  
       for (int i = 0; i < 4.45; i++)
  {
   
    imageSet[5].x += 1;
    imageSet[5].y = 250;
    imageSet[5].w = 50;
    imageSet[5].h = 50;
    imageSet[5].render();

  }
  
  if (imageSet[5].x >1400)
  {
    imageSet[5].x = 0;
  }
  
  //How to press R
  
       for (int i = 0; i < 5.25; i++)
  {
   
    imageSet[6].x += 1;
    imageSet[6].y = 300;
    imageSet[6].w = 50;
    imageSet[6].h = 50;
    imageSet[6].render();

  }
  
  if (imageSet[6].x >1400)
  {
    imageSet[6].x = -150;
  }
  
  //Shushei
  
       for (int i = 0; i < 6.3; i++)
  {
   
    imageSet[7].x += 1;
    imageSet[7].y = 425;
    imageSet[7].w = 50;
    imageSet[7].h = 50;
    imageSet[7].render();

  }
  
  if (imageSet[7].x >1400)
  {
    imageSet[7].x = -100;
  }
  
  //Cait
  
         for (int i = 0; i < 5.5; i++)
  {
   
    imageSet[8].x += 1;
    imageSet[8].y = 300;
    imageSet[8].w = 50;
    imageSet[8].h = 50;
    imageSet[8].render();

  }
  
  if (imageSet[8].x >1400)
  {
    imageSet[8].x = -200;
  }
  
  //Cookie
  
         for (int i = 0; i < 6.5; i++)
  {
   
    imageSet[9].x += 1;
    imageSet[9].y = 175;
    imageSet[9].w = 50;
    imageSet[9].h = 50;
    imageSet[9].render();

  }
  
  if (imageSet[9].x >1400)
  {
    imageSet[9].x = -25;
  }
  
 }
   
 

void mouseDragged(){

  textSize(100);
  fill(255,0,0);
  text("SKT T1", 100,280);
  text("FAKER", 800, 280);
  
  fill(255);
  textSize(50);
  text("GG NO RE", 600, 100);
  textSize(30);
  text("OMFG STAHP PLS", 100, 450);
  text("RYU WHERE ARE YO-OH DEAD NVM LOL", 300, 200);
  text("ZED OP MORELLO PLS NERF FFS", 700, 600);
  text("WHITEZ YOUR KASS HAS NO POWER HERE", 500, 400);
  text("PLS BAN VI MOAR", 100, 100);
  text("OH GOD RUN GTFO FFFFF-", 800, 50); 
  
  //Crank
  
  for (int i = 0; i < 12; i++)
  {
    imageSet[0].x += 1;
    imageSet[0].y = 100;
    imageSet[0].render();
    imageSet[0].w = 50;
    imageSet[0].h = 50;

  }
  
  if (imageSet[0].x >1400)
  {
    imageSet[0].x = 0;
  }
  
  //Cockroach
  
   for (int i = 0; i < 14; i++)
  {
   
    imageSet[1].x += 1;
    imageSet[1].y = 400;
    imageSet[1].w = 50;
    imageSet[1].h = 50;
    imageSet[1].render();

  }
  
  if (imageSet[1].x >1400)
  {
    imageSet[1].x = -50;
  }
  
  //Fox
  
     for (int i = 0; i < 13; i++)
  {
   
    imageSet[2].x += 1;
    imageSet[2].y = 475;
    imageSet[2].w = 50;
    imageSet[2].h = 50;
    imageSet[2].render();

  }
  
  if (imageSet[2].x >1400)
  {
    imageSet[2].x = -0;
  }
  
  //Sidebust
  
       for (int i = 0; i < 15; i++)
  {
   
    imageSet[3].x += 1;
    imageSet[3].y = 125;
    imageSet[3].w = 50;
    imageSet[3].h = 50;
    imageSet[3].render();

  }
  
  if (imageSet[3].x >1400)
  {
    imageSet[3].x = 50;
  }
  
  //Cow
  
       for (int i = 0; i < 12.5; i++)
  {
   
    imageSet[4].x += 1;
    imageSet[4].y = 50;
    imageSet[4].w = 50;
    imageSet[4].h = 50;
    imageSet[4].render();

  }
  
  if (imageSet[4].x >1400)
  {
    imageSet[4].x = -100;
  }
  
  //Tumblr
  
       for (int i = 0; i < 14.45; i++)
  {
   
    imageSet[5].x += 1;
    imageSet[5].y = 250;
    imageSet[5].w = 50;
    imageSet[5].h = 50;
    imageSet[5].render();

  }
  
  if (imageSet[5].x >1400)
  {
    imageSet[5].x = 0;
  }
  
  //How to press R
  
       for (int i = 0; i < 15.25; i++)
  {
   
    imageSet[6].x += 1;
    imageSet[6].y = 300;
    imageSet[6].w = 50;
    imageSet[6].h = 50;
    imageSet[6].render();

  }
  
  if (imageSet[6].x >1400)
  {
    imageSet[6].x = -150;
  }
  
  //Shushei
  
       for (int i = 0; i < 16.3; i++)
  {
   
    imageSet[7].x += 1;
    imageSet[7].y = 425;
    imageSet[7].w = 50;
    imageSet[7].h = 50;
    imageSet[7].render();

  }
  
  if (imageSet[7].x >1400)
  {
    imageSet[7].x = -100;
  }
  
  //Cait
  
         for (int i = 0; i < 15.5; i++)
  {
   
    imageSet[8].x += 1;
    imageSet[8].y = 300;
    imageSet[8].w = 50;
    imageSet[8].h = 50;
    imageSet[8].render();

  }
  
  if (imageSet[8].x >1400)
  {
    imageSet[8].x = -200;
  }
  
  //Cookie
  
         for (int i = 0; i < 16.5; i++)
  {
   
    imageSet[9].x += 1;
    imageSet[9].y = 175;
    imageSet[9].w = 50;
    imageSet[9].h = 50;
    imageSet[9].render();

  }
  
  if (imageSet[9].x >1400)
  {
    imageSet[9].x = -25;
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




