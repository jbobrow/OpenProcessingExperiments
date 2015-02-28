
int numcubes = 15;
Cube [] cubes = new Cube[numcubes];

void setup() {
 
    size(500, 500);
    background(0);
    smooth();
    for(int i = 0; i < cubes.length; i++)
    {
       cubes[i] = new Cube(); 
    }
 
}

void draw() 
{  
    for(int i = 0; i < cubes.length; i++)
    {
       cubes[i].display(); 
    }
  
}

void mousePressed() 
{
    background(0);
    for(int i = 0; i < cubes.length; i++)
    {
    cubes[i].reset(mouseX, mouseY); 
    }
}


class Cube {
   color c; 
   int colorstep; 
  float xpos, ypos; 
  float xspeed, yspeed;  
  
  Cube () {
    
 

      xpos = width / 2;
      ypos = height / 2;
      xspeed = random(10.) - 5.;
      yspeed = random(10.) - 5.;
    
  }
  
  void reset(float _x, float _y)
  {
      xpos = _x;
      ypos = _y;
      xspeed = random(10.) - 5;
      yspeed = random(10.) - 5;
  }
  
  void display() {  
    //background(frameCount % 250);
    stroke(0,100);  
     

    fill(mouseY,xpos,ypos,50); 
    ellipse(xpos, ypos,30, 30);
    //fill(255,20); 
    line(250, 250,xpos, ypos );

    

    xpos = xpos + xspeed;   
    xspeed = xspeed + 0.5;   
   if (xpos > width) {   
      xspeed = xspeed * -0.99;  
   }  
          ypos = ypos + yspeed;   
    yspeed = yspeed + 0.5;   
   if (ypos > height) {   
      yspeed = yspeed * -0.99;

   }

  }  
} 
 

