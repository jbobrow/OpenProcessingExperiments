
PImage charizard; PImage ultra; PImage pikachu; PImage thunder; PImage red;  PImage raichu; PImage battle; float release = 36;  boolean ball = false; boolean evol = false;
int timer = 0;
void setup(){
  size(600,400);
  charizard = loadImage("Charizard.png"); ultra = loadImage("UltraBall.png");
  red = loadImage("Red.png"); thunder = loadImage("Thunder.png"); battle = loadImage ("Battle1.jpg");
  pikachu = loadImage("Pikachu.png"); raichu = loadImage("Raichu.png");
  red1 = new Red(random(width), random(height));
  pikachu1 = new Pikachu(random(width), random(height));
  //raichu1 = new Raichu(random(width), random(height));
  charizard1 = new Charizard(random(width), random(height),random(5), random(5));
  thunder1 = new Thunder(random(width), random(height),random(5), random(5));
  ultra1 = new Ultra(random(width), random(height),(random(5)), random(5));
  
}
  void draw()
  { 
      image(battle,0,0); 
      ultra1.draw();
      
      if (timer < 35)
        {  timer++; 
          red1.draw();
        }
      if (timer >= 35 && !evol)
      {
        pikachu1.move();
        pikachu1.draw();
        charizard1.move();
        charizard1.draw();   
      }
      /*if (evol)
      {
        raichu1.draw();
        raichu1.move();
      }*/
      if (release <= timer)
      {
        thunder1.move();
        thunder1.draw();
      }  
      if (release > timer)
      {
        ultra1.move();
        ultra1.draw();
      }
    }
class Red 
{
    float x; float y; float xs; float ys;
    
    Red (float a, float b)
    {
      x = a; y = b;
    }
     void draw()
     {
       image(red,x,y);
     }  
}
class Pikachu 
{
    float x; float y; float xs; float ys;
    
    Pikachu (float a, float b, float c, float d)
    {
      x = a; y = b; xs = c; ys = d;


    }
     void draw()
     {
       image(pikachu,x,y);
                if (x < charizard1.x && (x + charizard1.width) < charizard1.x ) 
       {
         thunder1.draw();
         thunder1.move();  
       }
       if (this.x > (charizard1.x + charizard1.width)  && (this.x + charizard1.width) > (charizard1.x + charizard1.width)) 
       {
         thunder1.draw();
         thunder1.move();   
       }
       if (this.y < charizard1.y  && (this.y + charizard1.height) < charizard1.y ) 
       {
          thunder1.draw();
         thunder1.move();  
       }
       if (this.y > (charizard1.y + charizard1.height)  && (this.y + charizard1.height) > (charizard1.y + charizard1.height)) 
       {
         thunder1.draw();
         thunder1.move();   
       }

         fill(random(255), random(255));
         textSize(60);
         text("CLASH!!", 200, 200);
     }
         void move(){
    if (x > width || x < 0) 
    {
      xs = -xs;
    }
    x += xs;
  } 

}
class Charizard 
{
    float x; float y; float xs; float ys;
    
    Charizard (float a, float b, float c, float d)
    {
      x = a; y = b; xs = c; ys = d;
    
    }
     void draw()
     {
       image(charizard,x,y);
     }
          void move(){
    if (x > width || x < 0) {
      xs = -xs;
    }
    if (y < random(200)) {
      ys += 1;
    }
    if (y >= 200) {
      ys -= 2;
    }
    x += xs;
    y += ys;
  } 

}
class Thunder 
{
    float x; float y; float xs; float ys;
    
    Thunder (float a, float b, float c, float d)
    {
      x = a; y = b; xs = c; ys = d;
    }
     void draw()
     { 
       image(thunder,x,y);
     }
          void move(){
    if (x > width || x < 0) {
      xs = -xs;
    }
    if (y < random(200)) {
      ys += 1;
    }
    if (y >= 200) {
      ys -= 4;
    }
    x += xs;
    y += ys;
  } 
}
class Ultra 
{
    float x; float y; float xs; float ys;
    
    Ultra (float a, float b, float c, float d)
    {
      x = a; y = b; xs = c; ys = d;
    
    }
     void draw()
     {
       image(ultra,x,y);
     }
          void move(){
    if (x > width || x < 0) {
      xs = -xs;
    }
    if (y < random(200)) {
      ys += 1;
    }
    if (y >= 200) {
      ys -= 3;
    }
    x += xs;
    y += ys;
  } 
}
class Raichu 
{
    float x; float y; float xs; float ys;
    
    Raichu (float a, float b, float c, float d)
    {
      x = a; y = b; xs = c; ys = d;
    
    }
     void draw()
     {
       
       image(raichu,x,y);
     }
         void move(){
    if (x > width || x < 0) 
    {
      xs = -xs;
    }
    x += xs;
  } 
}



