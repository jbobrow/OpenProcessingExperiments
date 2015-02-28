

//initiallizing variables
Vehicle vehicle1;
Vehicle vehicle2;
Vehicle vehicle3;
Vehicle vehicle4;
Vehicle vehicle5;
Vehicle vehicle6;
Vehicle ufo1;
Vehicle flyingThing;
//Rain drops;

// image varables
/*   PImage img;
  int yPos;
  int xPos;
  int savedTime;
  int totalTime = 10000;
  */
  
void setup()
{
  frameRate(30);
  size(600,600);
 // savedTime = millis();
 // img = loadImage("gameover.jpg");
  
  // creating new objects
  vehicle1 = new Lane(338,0,random(4.5,6.5));
  vehicle2 = new Lane1(375,0,random(2.5,3.5));
  vehicle3 = new Vehicle(412,0,random(1.0,2.0));
  vehicle4 = new Lane4(168,600,random(-1.0,-2.0));
  vehicle5 = new Lane5(205,600,random(-2.5,-3.5));
  vehicle6 = new Lane6(243,600,random(-4.5,-6.5));
  ufo1 = new Ufo(0,random(1,600),random(-1.5,-6.5)); 
  flyingThing = new FlyingThing(1,random(150,450),4);
  //drops = new Rain();
  
}
void draw()
{
 //drawing the road 
  noStroke();
  fill(135);
  quad(130,0,450,0,450,height,130,height);
  fill(15,180,7);
  quad(260,0,320,0,320,height,260,height);
  fill(129,175,16);
  //drawing the landscape
  quad(0,0,130,0,130,height,0,height);
  quad(450,0,600,0,600,height,450,height);

  //loop for landscape
  fill(15,144,24);
  for (int d=12; d<130; d=d+50)
  {
    for (int b=20; b<height; b=b+40)
    {
      ellipse(d,b,20,20);
      for (int n=475; n<width; n=n+50)
      {
         ellipse(n,b,20,20);
      }
    }
  } 
  // triple loop for road lanes
  stroke(255);
    for( int j=148; j<250; j=j+38)
    {    
      for(int i=5; i<height; i=i+10)
      {
        line(j,i,j,i=i+10);     
          for( int k=5; k<height; k=k+10)
            {
              line(j+207,k,j+207,k=k+10);
      }
    }
  }
  // fence in the middle 
    strokeWeight(6);
    line(291,0,291,600);
    strokeWeight(1);
    noStroke();
    fill(255);
  for ( int p=25; p<height; p=p+60)
  {
    ellipse(291,p,20,20);
    fill(0);
    ellipse(291,p,10,10);
    fill(255);
    ellipse(291,p,5,5);   
  }  
  
  //starting engines vroom
  vehicle1.populate();
  vehicle2.populate();
  vehicle3.populate();
  vehicle4.populate();
  vehicle5.populate();
  vehicle6.populate();
  ufo1.populate();
  flyingThing.populate();
 //drops.letItRain();
 //println(frameRate);
 
  // picture stuff
 /*int passedTime = millis( );
 fill(255, 186, 121);
 noStroke();
 
  if(xPos<900)
  {
      xPos+=random(2); 
  }
  else {
    //do nothing 
  } 
  if(yPos<900) 
  {
    yPos+=random(2); 
  }
  else {
      //nothing again
  } 

while (passedTime<10000)
    {
    image(img, 0, 0, 600, 600);
    savedTime = millis();
    fill(0, 0, 0 , 0);
    }   
   println(passedTime);
   ellipse(xPos, yPos, 20, 20); 
*/
}

// creating main class
class Vehicle {
  //color variables
  int a;
  float b;
  float c;
  float d;
  //coordinates
  float x;
  float y;
  //size and speed
  float speed;
  float Wsize;
  float Hsize;
  //flyingThing variables
  float yy;
  int m;
  // main class constructor
   Vehicle( float tx,float ty,float tspeed) 
  {
    //random colors and size for objects
    b=random(1,255);
    c=random(1,255);
    d=random(1,255);
    a=color(b,c,d);
    speed=tspeed;
    x=tx;
    y=ty;
    Hsize=random(30,40);
    Wsize=random(20,25);
   // display method to display vehicles 
  }
    //method to call other methods, to simplify
  void populate()
  {    
    traffic();
    display();
  }  
   void display()
  {  
    stroke(0.5);
    fill(a);
    rectMode(CENTER);
    rect(x,y,Wsize,Hsize);
  }
  // movement method
  void traffic()
  {
    y=y+speed;

    if(y>height)
    {
      y=0;
      b=random(1,255);
      c=random(1,255);
      d=random(1,255);
      a=color(b,c,d);
      speed=random(1.0,2.0);
      Hsize=random(30,40);
      Wsize=random(20,25);  
    }
  }  
}
//second class which inherits from main class for purpose of different speed on lanes
class Lane extends Vehicle
  {
    //inherited class constructor which uses mainclass constructor 
    Lane(float tx,float ty, float tspeed)
    {
    super(tx,ty,tspeed);  
    speed=tspeed; 
    }   
    // movement method for lane class overriding main class traffic()method   
  void traffic()
  {
      y=y+speed;
        
    if(y>height)
    {
      y=0;
      b=random(1,255);
      c=random(1,255);
      d=random(1,255);
      a=color(b,c,d);
      speed=random(4.5,6.5);
      Hsize=random(30,40);
      Wsize=random(20,25);      
    }
  }
}

// same inherited classes with minor tweaks
class Lane1 extends Vehicle
  {
    Lane1(float tx,float ty, float tspeed)
    {
    super(tx,ty,tspeed);  
   speed=tspeed; 
    }
  void traffic()
  {
        y=y+speed;

    if(y>height)
    {
      y=0;
      b=random(1,255);
      c=random(1,255);
      d=random(1,255);
      a=color(b,c,d);
      speed=random(2.5,3.5);
      Hsize=random(30,40);
      Wsize=random(20,25);      
    }
  }
}
class Lane4 extends Vehicle
  {
    Lane4(float tx,float ty, float tspeed)
    {
    super(tx,ty,tspeed);  
   speed=tspeed; 
    }
  void traffic()
  {
        y=y+speed;

    if(y<0)
    {
      y=600;
      b=random(1,255);
      c=random(1,255);
      d=random(1,255);
      a=color(b,c,d);
      speed=random(-1.0,-2.0);
      Hsize=random(30,40);
      Wsize=random(20,25);      
    }
  }
}
class Lane5 extends Vehicle
  {
    Lane5(float tx,float ty, float tspeed)
    {
    super(tx,ty,tspeed);  
   speed=tspeed; 
    }
  void traffic()
  {
        y=y+speed;

    if(y<0)
    {
      y=600;
      b=random(1,255);
      c=random(1,255);
      d=random(1,255);
      a=color(b,c,d);
      speed=random(-2,-3.5);
      Hsize=random(30,40);
      Wsize=random(20,25);      
    }
  }
} 
class Lane6 extends Vehicle
  {
   Lane6(float tx,float ty, float tspeed)
    {
    super(tx,ty,tspeed);  
   speed=tspeed; 
    } 
    void traffic()
  {
        y=y+speed;

    if(y<0)
    {
      y=600;
      b=random(1,255);
      c=random(1,255);
      d=random(1,255);
      a=color(b,c,d);
      speed=random(-4.5,-6.5);
      Hsize=random(30,40);
      Wsize=random(20,25);      
    }
  }
}  
// ufos they are real, this class is certainly real,secondary class from vehicle class
class Ufo extends Vehicle
  {
   Ufo(float tx,float ty, float tspeed)
    {
    super(tx,ty,tspeed);  
    speed=tspeed; 
    a=color(255);
    } 
  void traffic()
  {
     x=x-speed;
     y=y+speed;

    if(x>600)
    {
      y=random(0,width);
      x=0;  
      y=random(1,600);
      a=color(255);
      speed=random(-1.5,-6.5);
      Hsize=random(30,40);
      Wsize=random(20,25);      
    }
  }
 
  // display method
   void display()
  {    
    stroke(0);
    fill(a);
    ellipse(x,y,Wsize*1.5,Wsize*1.5);
    fill(220);
    ellipse(x,y,Wsize/1.8,Wsize/1.8);
  }
}
//  flying object - extending/inheriting class
class FlyingThing extends Vehicle
  {
   FlyingThing(float tx,float ty, float tspeed)
    {
    super(tx,ty,tspeed);  
    speed=tspeed; 
    a=color(255);
    m=1;
    yy=2;
    }    
   void traffic()
    {
     yy = yy + speed; 
     float xChange = cos(radians(speed));
     float yChange = sin(radians(yy));
     x += xChange * speed * (m);
     y += yChange * speed * (m);
     if( x>700 )
    {
      m = m*(-1);
    }
    if (x<-100)
    {
      m = m*(-1);
  }
    }
 
  void display()
  {
   fill(a);
   ellipse(x, y, 40, 10);
  }
 }
  
/* class to for rain
class Rain
{
float drop;
  void Rain()
  {    
  }
 void letItRain()
  {
   // filter(BLUR);
   drop=random(5,10);
    noStroke();
    fill(255,50);
    
     ellipse(random(width), random(height),drop,drop);
     ellipse(random(width), random(height),drop,drop);
     ellipse(random(width), random(height),drop,drop);
     ellipse(random(width), random(height),drop,drop);
     ellipse(random(width), random(height),drop,drop);
     ellipse(random(width), random(height),drop,drop);
     ellipse(random(width), random(height),drop,drop);
  }
}
*/


