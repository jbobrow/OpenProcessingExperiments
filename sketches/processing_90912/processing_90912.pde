
//following instructions from http://www.shiffman.net/itp/classes/ppaint/week5/index.html

int MAX = 300;
//float easing = 0.80;

Light[] myLights = new Light[MAX];

void setup()
{
   size (700,500);
   //set colorMode
   colorMode (RGB, 255,255,255,100);
   
   for (int i=0;i<MAX;i++)
   {
    color tempcolor = color (random(255), random(255), random(200));
    myLights[i] = new Light(tempcolor, random(width), 0, random(1,5)); //can add easing here if I want but I'm not sure 
   }
}

void draw()
{
  background (0);
  // for every world in the myWorlds array, call the move and draw functions
  for (int i=0;i<MAX;i++)
 {
   myLights[i].move();
   myLights[i].make(); 
 }
}

class Light
{
  color c;
  float xpos;
  float ypos;
  float yvel;
  
  //Constructor//
  Light(color c_, float xpos_, float ypos_, float yvel_)
  {
    c = c_;
    xpos = xpos_;
    ypos = ypos_;
    yvel = yvel_;
  }
  
  void make ()
  {
    fill (c);
    noStroke();
    //ellipse (xpos, ypos, 25,25);
    ellipse (xpos, ypos, random(31,33),random(31,33));
  }
  
  void move ()
  {
   ypos = ypos + yvel;
   if (ypos > height) {ypos = 0;} 
  }
}
