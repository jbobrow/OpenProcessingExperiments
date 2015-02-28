
//HW11-Psuedo Screen Saver
//Joshua Chang Copyright 2012

final int MAX = 50;
float a =200;
float [] x;
float [] y;
float [] s;
float [] px;
float [] py;
color [] c;

//Processing Code

import ddf.minim.*;

Minim minim;
AudioInput in;
//-----------------
 
void setup()
{
   size (800, 400);
   
  //Processing code---------  
  minim = new Minim(this);
  minim.debugOn();
  
  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 512);
  //------------------------
  
   x = new float [MAX];
   initializeArray(x,width/3,2*width/3);
    
   y = new float [MAX];
   initializeArray(y, height/3, 2*height/3);
    
   s = new float [MAX];
   initializeArray(s, 10, 100);
    
   px = new float [MAX];
   initializeArray(px, 2, 15);
    
   py = new float [MAX];
   initializeArray(py, 2, 15);
    
   c = new color [MAX];
   initializeColor();
}
 
void draw()
{
  smooth();
  backgrounds();
  moveStuff();
  drawStuff();
  //saveFrame("HW11.jpg");
}
 
void initializeArray(float [ ] arrays, float mins, float maxs)
{
  for (int i=0; i < arrays.length; i++)
  {
    arrays[i] = int(random(mins,maxs));
  }
}
 
void initializeColor( )
{
  for (int i=0; i < c.length; i++)
  {
    c[i] = color(random(255), random(255), random(255),80);
  }
}
 
void moveStuff( )
{
  for (int i=0; i < MAX; i++)
  {
    x[i] = x[i] + px[i];
    if (x[i]+(s[i]/2) > width)
    {
      px[i] = -px[i];
    }
    else if (x[i]-(s[i]/2) < 0)
    {
      px[i] = -px[i];
    }
     
    y[i] = y[i] + py[i];
    if (y[i]+(s[i]/2) > height)
    {
      py[i] = -py[i];
    }
    else if (y[i]-(s[i]/2) < 0)
    {
      py[i] = -py[i];
    }
    
  }
}
 
void drawStuff( )
{
  for (int i=0; i < MAX; i++)
  {
    //smooth();
    noStroke(); 
    fill(c[i]);
    ellipse(x[i],y[i], s[i]/3,s[i]/3);
    ellipse(x[i], y[i], s[i] +in.right.get(i)*200, s[i] + in.left.get(i+1)*200);
  }
}
 
void backgrounds( )
{
  
  
  fill(255);
  
  
  rect(0,0,width,height);
  rectMode(CENTER);
  for (int i=0; i < MAX; i++){
    fill(0);
  rect(width/2,height/2,width/2,height/2);
 fill(255);
  ellipse(2*width/5,height/2,75+in.right.get(i)*100,75+in.right.get(i)*100); 
  ellipse(3*width/5,height/2,50+in.right.get(i)*100,50+in.right.get(i)*100);
  rect(width/2,2*height/3,width/6+in.right.get(i)*50,10); 
 fill(0); 
  ellipse(2*width/5,height/2,15-in.right.get(i)*100,15-in.right.get(i)*100); 
  ellipse(3*width/5,height/2,10-in.right.get(i)*50,10-in.right.get(i)*50);
   
   
  
}
   rectMode(CORNER);
}

void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();
  
  super.stop();
}

void keyPressed()
{
 
}

void mousePressed()
{

}

