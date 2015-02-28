
float timer = 0;
float ballX = -220;
float ballY = 475;
float ballW = 50;
float ballH = 50;
float ballR = 300;
SpriteObject keeper;

 void setup()
 {
   size(600, 500); 
   frameRate(100);
   keeper = new SpriteObject("keeper.jpg.jpg");
   keeper.x = width/2;
   keeper.y = height/2;
   keeper.s = 0.1;
 }
 
 void draw()
 {
  timer += .25
  ;
   
   //background
   fill(0, 255, 0);
   rect(0, 250, 600, 250);
 
   for (int i = 0; i < 80; i = i+5) 
  {
     line(0, i, 40, i);
  }
  
   for (int i = 0; i < 80; i = i+5) 
  {
     line(40, i, 80, i);
  }
  
   for (int i = 0; i < 80; i = i+5) 
  {
     line(80, i, 120, i);
  }
  
   for (int i = 0; i < 80; i = i+5) 
  {
     line(120, i, 160, i);
  }
  
   for (int i = 0; i < 80; i = i+5) 
  {
     line(160, i, 200, i);
  }
  
   for (int i = 0; i < 80; i = i+5) 
  {
     line(200, i, 240, i);
  }
  
   for (int i = 0; i < 80; i = i+5) 
  {
     line(240, i, 280, i);
  }
  
   for (int i = 0; i < 80; i = i+5) 
  {
     line(280, i, 320, i);
  }
  
   for (int i = 0; i < 80; i = i+5) 
  {
     line(320, i, 360, i);
  }
  
   for (int i = 0; i < 80; i = i+5) 
  {
     line(360, i, 400, i);
  }
  
   for (int i = 0; i < 80; i = i+5) 
  {
     line(400, i, 440, i);
  }
  
   for (int i = 0; i < 80; i = i+5) 
  {
     line(440, i, 480, i);
  }
  
   for (int i = 0; i < 80; i = i+5) 
  {
     line(480, i, 520, i);
  }
  
   for (int i = 0; i < 80; i = i+5) 
  {
     line(520, i, 560, i);
  }
  
   for (int i = 0; i < 80; i = i+5) 
  {
     line(560, i, 600, i);
  }
 
   //goal
   //noStroke();
   fill(255);
   rect(100, 75, 10, 225);
   rect(500, 75, 10, 225);
   rect(100, 75, 400, 10);
   rect(75, 250, 400, 10);
  // rect(
   
   //net
   stroke(255);
   noFill();

for(int i = -400; i < 490; i = i + 30)
{
  for(int l = 75; l < 465; l = l + 30)
  {
    bezier(l, 250, 475, 250, i, 75, 510, 75);
  }
}
   
   
   //goal lines
   noStroke();
   fill(#F0FC4F);
   rect(0, 300, 600, 10);
   rect(50, 300, 10, 175);
   rect(550, 300, 10, 175);
   rect(50, 475, 510, 10); 
   rect(270, 420, 70, 10); 
  
   
     //ball
   pushMatrix();
   ellipseMode(CENTER);
   fill(255);
   rotate(radians(ballR));
   ellipse(ballX, ballY, ballW, ballH);
   popMatrix();
    
   //text
   textSize(12);
   
   if (timer >= 20 && timer <= 40)
   {
     text("Shooter ready?", 10, 90);
   }
   
   if (timer >= 40 && timer <= 60)
   {
     text("Yes", 550, 110);
   }
   
   if (timer >= 60 && timer <= 80)
   {
     text("Keeper ready?", 10, 130);
   }
   
   if (timer >= 80  && timer <= 100)
   {
     text("Yes", 550, 80);
   }
   
   if (timer >= 100 && timer <= 120)
   {
     text("Shoot when ready", 10, 20);
   }
   
   if (timer >= 120)
   {
     text("press enter to shoot", 200, 10);
   } 
     if(keyCode == ENTER)
       {
         ballX += .3;
         ballY += -1;
         ballW = 25; 
         keeper.x += .5;    
       } 
    if(ballY <= 220)
    {
      ballR = 0;
      ballX = 125;
      ballY = 220;
      ballW = 50;
      keeper.x = 450;
      
      
      textSize(30);
      text("GOOOOOOAAAAALLLLLLL", 200, 350);
    }
     keeper.render();
 }
 
 class SpriteObject
{
  float x = width/2;
  float y = height/2;
  float w = width * 2;
  float h = height * 2;
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


