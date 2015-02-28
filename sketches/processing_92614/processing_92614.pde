
int MAX = 300;
//float easing = 0.80;
 
Light[] myLights = 
new Light[MAX];
 
void setup()
{
   size (700,500);
   //set colorMode
   colorMode (RGB, 255,255,255,100);
   stroke(10);
   smooth();
   for (int i=0;i<MAX;i++)
   {
    color tempcolor = color (random(255), random(255), random(200),60);
    myLights[i] = new Light(tempcolor, random(width), 0, random(1,5)); 
   }
}
 
void draw()
{
  background (map(mouseX, 0, width, 0, 255), 80, map(mouseY, 0, height, 0, 255)); //changing background colors by moving mouse up/down/l/r
  // for every world in the myWorlds array, call the move and draw functions
    for (int i=0;i<MAX;i++)
    {
      myLights[i].make();
   myLights[i].move();
    }
      {
      if (mousePressed) 
        {
        fill (random(120, 255), random(155,200), random(130, 200));
        }
        else {
        fill (0, random(100, 255), random(100,255), random(100, 255));
        }
      }
}

 
class Light
{
  color c;
  float xpos;
  float ypos;
  float yvel;
  float r=0; 
   
  //Constructor//
  Light(color c_, float xpos_, float ypos_, float yvel_)
  {
    c = c_;
    xpos = xpos_;
    ypos = ypos_;
    yvel = yvel_;
  }
   
  void make () {
    fill (c);
    noStroke();
    //ellipse (xpos, ypos, 65,105);
    ellipse (xpos, ypos, random(51,53),random(51,53));
  }
   
  void move () {
    if(r==0) {
      ypos = ypos + yvel;
    }
    else if (r==1) {
      xpos = xpos + yvel; 
      ypos = ypos + yvel; 
      xpos = xpos +1 ; 
    }
    else if (r==2) {
      xpos = xpos - yvel;
      ypos = ypos + yvel;
      xpos = xpos - 1;
    }
    else if (r==3) {
      ypos = ypos - yvel;
      ypos = ypos - 1;
    }   
    if (ypos > height) {
      ypos=5;
    }
      if (xpos > width) {
        xpos=0;
      }
      if (keyPressed) {
        if (key==CODED) {
          if (keyCode==RIGHT) {
            r=1;
          } 
          else if (keyCode==LEFT) {
          r=2;
          }
          else if (keyCode==UP) {
            r=3;
          }
          else if (keyCode==DOWN) {
            r=0;
          }  
        }
      }
    
    }
  }
  

