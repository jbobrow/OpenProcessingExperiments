
PImage fuu;
PImage fuuu;
float x,y;
float angle;
float value;
float rate;
Splode splody1= new Splode(40,50,10,0);
Splode splody2= new Splode(50,70,6,0);
Splode splody3= new Splode(60,100,2,0);
Splode splody4= new Splode(40,75,20,0);
Splode splody5= new Splode(120,70,5,0);
Splode splody6= new Splode(30,80,2,0);
Splode splody7= new Splode(30,20,15,0);
Splode splody8= new Splode(36,70,6,0);
Splode splody9= new Splode(25,66,14,0);
Splode splody10= new Splode(100,50,12,0);
void setup(){
  size(480,320);
  smooth();
  x=180.0;
  y=50.0;
 
}

void draw()
{
  fuu=loadImage("fuu.png");
  fuuu=loadImage("fuuu.png");
  background(0);
  angle+= 0.1;
  value= map (cos(angle),-1,1,102,255);
  fill(value);
  noStroke();
  ellipse(x,y,9,9);

 
  if(mouseX<=111)
  {
    image(fuuu,mouseX,180);
  }
  else
   image(fuu,mouseX,200);
  println();
  splody1.update();
  splody2.update();
  splody3.update();
  splody4.update();
  splody5.update();
  splody6.update();
  splody7.update();
  splody8.update();
  splody9.update();
  splody10.update();
  
  }
  
  
  class Splode {
    float xpos,ypos,fall,fu;
    Splode (float x, float y,float rate, float fu)
    {
      xpos=x;
      ypos=y;
     rate=fall;
      fu=fu;
    
    }
    
    void update(){
      fu=map(mouseX,120,480,1,25);
      ypos=ypos+fu;
      ypos=ypos+(ypos*map(rate,0,20,0,90));
      
      if(ypos>=1000)
      {
        ypos=0;
      }
      ellipse(xpos,ypos,10,10);
    }
  }

