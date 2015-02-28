

int numBeziers =10;
Mybezier [] beziers = new Mybezier[numBeziers];

void setup() {
 
    size(500, 500);
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
    background(random(0,255) );
    for(int i = 0; i < beziers.length; i++)
    {
       beziers[i].reset(mouseX, mouseY); 
    }
}


class Mybezier {
   
  float xpos, ypos; 
  float xspeed, yspeed;  
 



  
  Mybezier () {
       
      xpos = width / 2;
      ypos = height / 2;
      xspeed = random(10.) - 5.;
      yspeed = random(10.) - 5.;
  
      

      
    
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
    
      xpos = xpos + xspeed;
      if(xpos > width) xpos = width; 
      if(xpos < 0) xpos = 0; 
      
      ypos = ypos + yspeed;
      if(ypos > height) ypos = height; 
      if(ypos < 0) ypos = 0;  
      
      noFill();
      strokeWeight(xpos/height );
      stroke(xpos *ypos/width);
      bezier(xpos, ypos, 20+ypos , 250+xpos,xpos + 100, ypos + 50, xpos + 250, ypos + 500);
     bezier(xpos, ypos, 20 + random(20,30), 100,110, ypos + random(200,210), xpos- 200, ypos + 500);
   

  }
  
}

