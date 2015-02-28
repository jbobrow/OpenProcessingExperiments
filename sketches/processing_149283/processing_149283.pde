
int numThings=200;
int count=0;
boolean MouseIsDown=false;

Particle [] particles = new Particle[numThings];

void setup()
{
  background(255,255,255);
  size (600,600);
  for (int i=0;i<numThings;i++)
      {
        particles[i]= new Particle(random(0),random(255),random(255),15, random(width),random(height));      
      }
  
}

void draw()
{
  background(209);
  
        for(int i=0;i<numThings;i++)
        {
            particles[i].makeParticle();
            particles[i].update();
        }
        
        
  
}





void mousePressed()
{

  MouseIsDown=true;
}
void mouseReleased()
{ 

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
  float speed = random(1,3);
  float direction = random(1,3);
  float mehX=0;
  float mehY=0;
  float easing=random(0.01,0.05);

  
  
  
  
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
             
                  
     for (int i = 0; i<numThings;i++)
      {
               Particle  I = particles[i];
              int num=40;
              if ((I.x-x)<num && (I.x-x)>-num)
              {
                if (I.y-y<num && (I.y-y>-num))
                {
                  stroke(150);
                  strokeWeight(1);
                  line(x,y, I.x,I.y);
                  noStroke();
                }
                
              }
      }            
     
      if (MouseIsDown)
         {
            mehX = mouseX-x;
            if (abs(mehX)>1)
              {x = x + mehX * easing ;}
            
             mehY = mouseY-y;
            if (abs(mehY)>1)
              {y = y + mehY * easing ;}
          }
          
            y=y+speed;
            x=x+direction;
                           
    }
    
    

}



