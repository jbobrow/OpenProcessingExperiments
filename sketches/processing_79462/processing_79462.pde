
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//declare minim objects....
Minim minim;
AudioPlayer player;
AudioInput input;

//DECLARE OBJECTS------!!!
Mountain mount;
Sun s;
Main m;
Figure f;
ArrayList figures = new ArrayList();
ArrayList mountains = new ArrayList();
ArrayList mountainsFG = new ArrayList();
//Grass g;
ArrayList grassBlades = new ArrayList();

float rotation;      //the rotation of the grass blade
float bladeSize;
float bladeLean;
float[] ampHistory;
float amp2;    // keeps track of if incoming amp is louder
int numSamples;

int stage;      //keeps track of where we are in the game

void setup()
{
  //remember original height is 200
   //size(1440, 900); 
   size(1200, 600);
   background(0);
   smooth();
   
   stage = 0;
   
   bladeSize = 2.5;
   bladeLean = 0;
   numSamples = (int) (width/bladeSize);
   ampHistory = new float[numSamples];
   
   //construct the minim objects
   minim = new Minim(this);
   player = minim.loadFile("data/saturn_strobe.mp3");
   player.play();
  input = minim.getLineIn(Minim.MONO,512);
  //return an array of floats that is 512 in length
   
   //OBJECTS------------
   for(int i = 0; i*bladeSize < width; i++)
   {
     grassBlades.add(new Grass(i*(bladeSize),height, i));
   }
   
   
  //-----------------------------mountains----------
   for(int i = 0; i*30 < width; i++)
   {
     mountains.add(new Mountain(i*60, height/2-100, .25));
   }   
   for(int i = 0; i*30 < width; i++)
   {
     mountainsFG.add(new Mountain(i*60, height/2 - 100, .50));
   }
   
   //------------------end mountains-----------
   
   //g = new Grass(120,height, (int)random(512));
   m = new Main();
   s = new Sun(250);
   s.setPosition(width/2, height/2-300);
   //f = new Figure(width/2 + width/20);
   
   for(int i = 0; i*100 < width; i++)
   {
     figures.add(new Figure(width/2 + width/20 + 100*i));
   }
   
   //mount = new Mountain(0,height);
}

void draw()
{
  background(0);
  noStroke();
  noCursor();
  
  
  //STAGES-------------
  //0
  if(stage == 0)
  {
    
    if(s.getY() <= height/2 + s.getRad())
    {
      s.move(1, .5);
    }
    else
    {
      stage = 1;
    }
  }
  
  //STAGE 1
  if(stage == 1)
  {
    s.move(3, .85);
  }
  
  //time state change
  if(millis() > 61000 && millis() < 62000)
  {
    stage = 2;
    s.setPosition(width + s.getRad()/2 + 10, height/2);
  }
  
  //STAGE 2
  if(stage == 2)
  {
    s.move(2, 1);
  }
  
  if(millis() > 123000 && millis() < 124000)
  {
    stage = 3;
    
  }
  
  if(stage == 3)
  {
    s.move(3, 30);
    
    if(s.getX() > width + s.getRad()+50)
    {
      stage = 4;
    }
  }
  
  if(stage == 4)
  {
    s.update();
  }
  
  
   s.display();
  
  //print(millis() + "\n");
  
 
  
  //2. mountains
  //mount.display();
  //mount.update();
  
  for(int i = 0; i < mountains.size(); i++)
   {
     Mountain m = (Mountain)mountains.get(i);
     m.update();
     //m.display();
   }
  
  
  
  
  //MAIN CHARACTER
   m.update();
   m.display();
   
   
   
   //FIGURE
   //f.update();
   //f.display();
   for(int i = 0; i < figures.size(); i++)
   {
     Figure f = (Figure)figures.get(i);
     f.update();
     
     if(stage != 3 && stage != 0)
     {
        f.display();
     }
   }
   
   
  //GRASS
  for(int i = 0; i < grassBlades.size(); i++)
   {
     Grass g = (Grass)grassBlades.get(i);
     g.update(s.getX(), s.getRad());
     g.display();
   }
   
   float amp = player.left.get(0);
   if(abs(amp) > amp2)
   {
     amp2 = amp;
   }
   amp2*=.75;
   ampHistory[0] = amp2;
   
   for(int i = numSamples-1; i > 0; i--)
   {
     ampHistory[i] = ampHistory[i-1];
   }

/*
  fill(random(255), random(255), random(255), 127.5);
  PFont font;
  
  font = loadFont("Helvetica-48.vlw");
  textFont(font);
  //textSize(100);
  text("w", width/2, height/2);
*/

  //bottom border
  fill(0);
  rect(0, height/2 + 100, width, height/2);
  
  //top border
  rect(0, height/2 - 100, width, -height/2);

}
//END DRAW------------



//USER INPUT----------------------------
void keyTyped(){
  fill(random(255), random(255), random(255), 127.5);
  PFont font;
  
  font = loadFont("Helvetica-48.vlw");
  textFont(font);
  //textSize(100);
  text(key + "", width/2, height/2);
}




void stop()
{
  // the AudioPlayer you got from Minim.loadFile()
  player.close();
  // the AudioInput you got from Minim.getLineIn()
  input.close();
  minim.stop();
  
  // this calls the stop method that
  // you are overriding by defining your own
  // it must be called so that your application
  // can do all the cleanup it would normally do
  super.stop();
}


//OBJECTS--------------------------
class Grass
{
  float x,y, amp, amp2, c;
  int id;
  
  Grass(float _x, float _y, int _id)
  {
    x = _x;
    y = _y;
    id = _id;
    amp = 0;
    c = 255;
  }
  
  void update(float sunX, float sunRad)
  {
    amp*=.98;
    
    if(x > sunX - sunRad/2 && x < sunX + sunRad/2)
    {
      c = 100;
    }
    else
    {
      if(c < 255)
      {
        c += 20;
      }
    }
  }
  
  void display()
  {
    fill(c,70);
    //grab amplitude assoc with id
    amp = ampHistory[id];
    amp2 = player.left.get((int)random(512));
    
    //1 grass blade
    pushMatrix();
      //rotate(radians(amp2));
      pushMatrix();
        translate(x, height/2 + 100);
        rotate(radians(amp*160 + amp2*30));
        //scale(1,amp2*2);
        triangle(-bladeSize, 0, 0, -200/4, bladeSize, 0);
      popMatrix();
    popMatrix();
  }
}
//END GRASS---------


//character user controls
class Main
{
  float x,y,elevation, el_max, dir;
  float rotation;
  
  Main()
  {
    x = width/2;
    y = height/2 + 70;
    elevation = 0;
    el_max = 20;
    dir = 1;
    rotation = 0;
  }
  
  void update()
  {
    if(elevation > el_max)
    {
      dir *= -1;
    }
    else if(elevation < 0)
    {
      dir *= -1;
    }  
    elevation += dir;
    
    if(rotation >= 360)
    {
      rotation += 10;
    }
  }
  
  void display()
  {
    fill(150);
    
    
    pushMatrix();
      translate(0,elevation);
      
      //body
      pushMatrix();
        translate(x,y);
        ellipse(0,0,30,200/2);
      popMatrix();
      
    //head
      pushMatrix();
        translate(x-22,(y - 200/3.5));
        ellipse(0,0,30,30);
      popMatrix();
      
    popMatrix();
    
  }
}
//END MAIN----------------



//START UNKNOWN FIGURE
class Figure
{
  float x,y,elevation, el_max, dir;
  float rotation, amp;
  
  Figure(float _x)
  {
    x = _x;
    y = height/2 + 70;
    elevation = 0;
    el_max = 20;
    dir = .5;
    rotation = 0;
  }
  
  void update()
  {
    if(elevation > el_max)
    {
      dir *= -1;
    }
    else if(elevation < 0)
    {
      dir *= -1;
    }  
    elevation += dir;
    
    if(rotation >= 360)
    {
      rotation += 10;
    }
  }
  
  void display()
  {
    fill(0);
    amp = player.left.get((int)random(512));
    
    pushMatrix();
      translate(0,elevation);
      
      //body
      pushMatrix();
        translate(x,y);
        ellipse(0,0,30,200/2);
      popMatrix();
      
    //head
      pushMatrix();
        translate(x-22,(y - 200/3.5));
        ellipse(0,0,30 + amp*50, 30 + random(50)*amp);
        //ellipse(0,0,30,30);
      popMatrix();
      
    popMatrix();
    
  }
}





class Sun
{
  float rad, x,y, amp;
  
  Sun(float radius)
  {
    rad = radius;
    x = width/2;
    y = height/2;
  }
  
  void update()
  {
    x = mouseX;
    y = mouseY;
  }
  
  void move(int direction, float speed)
  {
    switch(direction)
    {
      case 0: //up
          
          y -= speed;
          
          break;
          
      case 1: //down
          
          y += speed;
          
          break;
          
      case 2: //left
      
          x -= speed;
      
          break;
          
      case 3: //right
        
          x += speed;
          
          break;
    }
  }
  
  void setPosition(float _x, float _y)
  {
      x = _x;
      y = _y;
  }
  
  void setRadius(float _rad)
  {
    rad = _rad;
  }
  
  float getX()
  {
    return x;
  }
  
  float getY()
  {
    return y;
  }
  
  float getRad()
  {
    return rad;
  }
  
  void display()
  {
    amp = player.left.get((int)random(512));
    
    fill(255);
    pushMatrix();
      translate(x,y);
      ellipse(0,0,rad,rad);
    popMatrix();
  }
}
//END SUN-----------------



class Mountain
{
  float x,y, speed;
  
   Mountain(float _x, float _y, float _speed)
   {
     x = _x;
     y = _y;
     speed = _speed;
   }
   
   void update()
   {
     if(x - 30 > width)
     {
       x = -30;
     }
     x += speed;
   }
   
   void display()
   {
     fill(20);
     //triangle(width/2-80,height,width/2,0,width/2+80,height);
     pushMatrix();
       translate(x,y);
       triangle(-30,0,0,50,30,0);
     popMatrix();
   }
}



