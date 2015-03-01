
Ball b, b2;
int num_objects = 55;
Ball[] ball_array = new Ball[num_objects];


void setup() //__________________________________________________
{
 size(200,600);
 b = new Ball();
 b2 = new Ball();
 
 
 for(int i = 0; i < num_objects; i++)
 {
   ball_array[i] = new Ball();
 }
 
 
}




void draw() //___________________________________________________

{
 background(25);
 noStroke();
 fill(25);

 b.update();
 b.display();
 b2.update();
 b2.display();
 
 for(int i = 0; i < num_objects; i++)
 {
   ball_array[i].update();
   ball_array[i].display();
   
 }
 

 noFill();
 stroke(255,90);
 
 for(int i = 0; i < num_objects; i++)
 {
    for (int j = i+1; j < num_objects; j++)
    {
      //object one
      float x1 = ball_array[i].x;
      float y1 = ball_array[i].y;
      
      //object two
      float x2 = ball_array[j].x;
      float y2 = ball_array[j].y;
      
      if(dist(x1,y1,x2,y2) < 100)
        {
          line(x1,y1,x2,y2);
        }
      
    }
  
   
 }
 
 
 
 

 
 
 
 
 
 
 
 
 
 
 
}



//_______________________________________________________________
class Ball
{
 float x,y,vx,vy,grav,diam;
 float bounciness;
 
 

  Ball()
   {
     x = random(width);
     y = random(height);
     diam = random(20,50);
     bounciness = random(-.95,-.5);
     vx = random(-5,5);
     vy = random(0,0);
     grav = -.005;
   }
   
   
   
   
   
   
void update() //_______________________________________________________
  {
    
   
     vy+=grav;
     x+=vx;
     y+=vy;
    
     if(y > height) 
      {
        y= height;
        vy *= bounciness;
        
      }
 
  //restrain left side
     if(x < 0)
      {
        x = 0;
        vx *= -1;
      }
 
  //restrain right size
     if (x > width)
      {
        x = width;
        vx *= -1; 
      }    
      
  //restrain top    
      if (y < 0)
       {
         y = 0;
         vy*=-1;
       }
       
     
  }
  
  
  
  
  
void display() //______________________________________________________
 {
     pushMatrix();
     translate(x,y);
     ellipse(0,0,diam,diam);
     popMatrix();
 
 }

  
}
