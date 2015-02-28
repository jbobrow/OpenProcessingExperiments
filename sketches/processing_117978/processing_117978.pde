
int numThings=200;
boolean MouseIsDown=false;
Particle [] particles = new Particle[numThings];
Circle [] circle = new Circle[numThings];
int countsize=0;
int count=0;

void setup()
{
   background(255,255,255);
  size (900,900);
  for (int i=0;i<numThings;i++)
  {
    particles[i]= new Particle(random(255),random(0),random(0),15, 15, 0);
  }
  
}

void draw()
{
  background(255,255,255,10);
  
  for(int i=0;i<numThings;i++)
  {
      particles[i].makeParticle();
      particles[i].update();
  }
  for (int i = 0; i<count;i++)
  {
    Circle I = circle[i];
    
    I.makeCircle();
    I.update();
    
  }
  
  
  if (MouseIsDown)
  {
    countsize++;
    fill(129);
    ellipse(mouseX,mouseY,countsize,countsize);
    
  }
  
  
}

void mousePressed()
{
  
  if (countsize!=0)
    {countsize=0;}
  MouseIsDown=true;
}
void mouseReleased()
{ 
  circle[count] = new Circle(countsize);
  MouseIsDown=false;
  count++;
}






class Particle
{
  float R;
  float G;
  float B;
  float size;
  float x;
  float y;
  float speed = random(5,15);
  float direction = random(1,20);
  float mehX=0;
  float mehY=0;
  float easing=random(0.01,0.05);
  float MX= mouseX;
  float MY = mouseY;
  
  
  
  
  Particle(float r, float g, float b, float S, float XPos, float YPos)
  {
    R=r;
    G=g;
    B=b;
    size = S;
    x=XPos;
    y=YPos;
    //speed= random(20,50);
    
    
    
  }
  void makeParticle()
  {
    noStroke();
    fill(R,G,B,70);
    ellipse (x,y,size,size);
  }
  
  void update()
  {
    float dX = cos(radians(direction))*speed;
    float dY = sin(radians(direction))*speed;
   
   if (mouseX > 0 || mouseX < width || mouseY > 0 || mouseY < height)
            {
                  //MANAGING BORDERS
                  if (x > width)
                  {
                    //x = 0;
                    x=-x;
                    direction= abs(direction);
                  }
               
                  if (x < 0)
                  {
                    //x = width;
                    x= abs(x);
                    direction=-(direction);
                  }
               
                  if (y > height)
                  {
                    speed=-speed;
                    //direction= random(1,360);
                  }
               
                  if (y < 0)
                  {
                    speed= abs(speed);
                     //direction= random(1,360);
                  }
                  
                  //CHANGING POSITION
                  
                  //x = x + dX;
                  //y = y + dY;
                  y=y+speed;
                  x=x+direction;
            }
            
            
    if (mouseX < 0 || mouseX < width || mouseY < 0 || mouseY < height)
         {
            mehX = MX-x;
            if (abs(mehX)>1)
              {x = x + mehX * easing ;}
            
             mehY = MY-y;
            if (abs(mehY)>1)
              {y = y + mehY * easing ;}
          }
          
    for (int i = 0; i<count;i++)
      {
              Circle I = circle[i];
              int num=50;
              
          if ((I.x-x)<num && (I.x-x)>-num)
              {
                if ((I.y-y)<num  && (I.y-y)>-num)
                {
                    MX= I.x;
                    MY= I.y;
                }
                
              }   
         if ((mouseX-x)<num && (mouseX-x)>-num)
              {
                if (mouseY-y<num && (mouseY-y>-num))
                {
                 MX= mouseX;
                MY=  mouseY;
                }
           
             }
      }

  
                 
   }


}

class Circle
{

  float x=0;
  float y=0;
  float size;
  float speed = random(2,5);
  float direction = random(1,20);
  
  Circle (float S)
      {
        size=S;
      }
        
          
  void update()
     {
       //MANAGING BORDERS
       if (x > width)
         {
          //x = 0;
           x=-x;
           direction= abs(direction);
          }
               
        if (x < 0)
          {
            //x = width;
            x= abs(x);
            direction=-(direction);
          }
               
        if (y > height)
          {
            speed=-speed;
             //direction= random(1,360);
          }
               
        if (y < 0)
           {
             speed= abs(speed);
             //direction= random(1,360);
           }
                  
        //CHANGING POSITION
         
          y=y+speed;
          x=x+direction;
         
      }
           
void makeCircle()
     {
       noStroke();
       fill(255,0,0, 75);
       ellipse (x,y,size,size);
      }
          
  }
  
  
  
  



