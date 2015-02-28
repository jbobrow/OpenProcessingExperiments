

int numBeziers =100;
Mybezier [] beziers = new Mybezier[numBeziers];

void setup() {
 
    size(800, 600);
    background(255);
    smooth();
    for(int i = 0; i < beziers.length; i++) 
    {
       beziers[i] = new Mybezier(); 
    }
  
}

void draw() 
{  
    for(int i = 0; i < beziers.length; i++)
    {
       beziers[i].display(); 
    }
  
}

void mousePressed() 
{
    background(random(0,255),random(0,255),random(0,255) );
    for(int i = 0; i < beziers.length; i++)
    {
       beziers[i].reset(mouseX, mouseY); 
    }
}


class Mybezier {
   
  float xpos, ypos; 
  float xspeed, yspeed;  
  PImage im;



  
  Mybezier () {
       
      xpos = random(width);
      ypos = random(height);
      xspeed = random(width);
      yspeed = random(height);
      im = loadImage("hua.png");
  
      

      
    
  }
  
  void reset(float _x, float _y)
  {
      xpos = _x;
      ypos = _y;
      xspeed = random(10.) - 5.;
      yspeed = random(10.) - 5.;
      
  }
  
  void display() 
  {
      float xtemp, ytemp;
      
      xtemp = xpos * xspeed;
      if(xtemp > width) xtemp = width - (xtemp - width); 
      if(xtemp < 0) xtemp = xtemp * -1; 
      
      ytemp = ypos  * xspeed;  
      if(ytemp > height) ytemp = height - (ytemp - height); 
      if(ytemp < 0) ytemp = ytemp * -1;  
      
      
      
       xpos = xpos + yspeed;
      if(xpos >= width) xpos = width; 
      if(xpos <= 0) xpos = 0; 
      
      ypos = ypos + yspeed;
      if(ypos >= height) ypos = height;
      if(ypos <= 0) ypos = 0;  
     
      image(im, xpos, ypos);
      image(im, xtemp, ytemp);
   

  }
  
}

