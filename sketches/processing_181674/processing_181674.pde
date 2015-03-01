
//b makes particles big, l makes them little, r returns them to the center and original size
//s makes the balls stop, g makes them appear randomly, if another key is pressed after g they will return to normal
//mouse clicked clears the design

//The balls code was borrowed
Ball[] balls;
//I added these for my additions to the code
Particle[] p;
int j = 150;
int x = 150;
int k = 1;

//I added a picture for the ellipse design
PImage circle;

 void setup() 
{
  circle = loadImage("circle.png");
  size(800,800);
  balls = new Ball[250];
  //I changed the amount of balls from 100 to 250 and the background size
  for(int i = 0; i < 250; i++) 
   {
    balls[i] = new Ball();
   }
  //I added this particle array
  p = new Particle[300];
  for(int i = 0; i < 300; i++) 
   {
    p[i] = new Particle();
   }
}


void draw() 
{ 
  for(int i = 0; i < 250; i++) 
   {
    balls[i].move();
    balls[i].render();
    //I added the checkkey method
    balls[i].checkkey();
   }
  //I added this to create the decreasing ellipse design
  if (j > 90)
   {
    strokeWeight(3);
    stroke(random(255),random(255),random(255));
    imageMode(CENTER);
    image(circle,mouseX,mouseY,j,j);
    j = j - 1;
   } 
  else
   {
    j = 150;
   }
  //I added this to create the rectangles in the border
  if (x > 20)
   {
    fill(random(100,250),3,245);
    rectMode(CENTER);
    rect(0,random(0,800),x,x,15);
    rect(random(0,800),800,x,x,15);
    rect(800,random(0,800),x,x,15);
    rect(random(0,800),0,x,x,15);
    x = x - 1;
   }
   else
   {
     x = 150;
   }
   if (k < 100)
    {
     line(400,400,random(800),random(800));
     k = k + 1;
    }
   else
    {
     k = 1;
    }
}

//I added this for the particle design to appear when a key is pressed
void keyPressed()
 {
 for (int i = 0; i < 300; i++)
  {
    p[i].display();
    p[i].keycheck();
  }
 }
 
//I added this to reset the background when mouse clicked
void mouseClicked()
 {
  background(255);
 }

//This was the borrowed code that I altered 
class Ball 
{
  float x,y;
  float mx,my;
  color c;
  float s;


  Ball() 
  {
    //I changed the velocity and size
    x = random(width);
    y = random(height);
    mx = random(-5,5);
    my = random(-5,5);
    c = color(0);
    s = random(5,20);
  }
  
  void move() 
  {
    x += mx;
    y += my;
    if(x > width || x < 0) 
     {
      mx*=-1;
     }
    if(y > height || y < 0)
     {
      my*=-1;
     }
 //This I added to have a cool color pattern
   if(c >255)
    {
     c = 0;
    }
   c = c + 500;
  }
 
  void render() 
  {
    stroke(255, 155, 51);
    strokeWeight(.35);
    fill(c);
    ellipse(x,y,s,s);
  }
  
  //I added this to have more interaction  
  void checkkey()
  {
    if (keyPressed == true)
     {
      if (key == 's')
      {   
       mx = 0;
       my = 0;
       x = 0;
       y = 0; 
      }
     }
     else
     {
       if (key == 'g')
       {   
        x = random(width);
        y = random(height);
        mx = random(-5,5);
        my = random(-5,5);
       }
     }
     
  }
}

//This I added from the shared paritcle code
class Particle
{
  float a;
  float b;
  float av;
  float bv;
  float g;
  
  Particle()
  {
    //I changed the velocity and size
    a = width/2;
    b = height/2;
    av = random(-7,7);
    bv = random(-7,7);
    g = random(10,17);
  }
  
  void display()
  {
    a += av;
    b += bv;
    
    if ((a < 0) || (a > width)) av *= -1;
    if ((b < 0) || (b > width)) bv *= -1;
    
    //Changed the fill to all random RGB's
    fill(int(random(255)),int(random(255)),int(random(255)));
    ellipse(a,b,g,g);
  }
  
  //I added this to have more interaction   
  void keycheck()
  {
   if (keyPressed == true)
     {
      if (key == 'b')
      {
       g = random(30,50);
      }
     } 
    else
     {
       if (key == 'l')
       {
        g = random(5,13);
       }
       if (key == 'r')
       {
        a = 400;
        b = 400;
        g = random(10,17);
       }
     }
  }
}


