
int num_objects=1;
Ball[] ball_array= new Ball[num_objects];

void setup()
{
  background(255);
  size(700,700);

  
 for(int i=0; i< num_objects; i++)
{
  ball_array[i]=new Ball();
 } 
}

void draw()
{
  
 
  
  for(int i=0; i< num_objects;i++)
  {
    ball_array[i].update();
    ball_array[i].display();
    }
    
    
//beginShape();
noFill();
stroke(0);

for(int i=0; i<num_objects; i++)
{
  for(int j= i+1; j< num_objects; j++)
  {
     float x1=ball_array[i].x;
     float y1= ball_array[i].y;
     float x2=ball_array[j].x;
    float y2=ball_array[j].y;
  if(dist(x1,y1,x2,y2)<100)
  { line(x1,y1,x2,y2); }
    
  }
  
}
//for(int i=0; i< num_objects; i++)
//{
  //vertex(ball_array[i].x, ball_array[i].y);
//}
//endShape();

}

/*void mouseReleased()
{for(int i=0; i< num_objects;i++)
  {
    
    ball_array[i].reset();
  }
}*/

class Ball
{  //these are now local variables to the class object
  float x,y,vx,vy,grav,bounciness;
  //create constructor function-ALWAYS matches the class name
Ball()
{
  x=random(width);
  y=random(height);
  
  vx=random(-3,3);
  vy=random(-3,3);
  grav=0;
  bounciness = random (-.81, -.3); 
}
  
 void update()
{
 //add gravity to the y velocity
  vy+=grav;
  //add velocity to position
  x+=vx;
  y+=vy;
  
  if(y>height)
  {  //reverse course in vy
    y=height;
    vy*=-0.9;
  }
  if(y<0)
  {y=0;
  vy*=-1;}
  
  if(x<0)
  {x=0;
  vx*=-1;
  }
  
  if (x>width)
  {x=width;
  vx*=-1;
  }
  
}




void display()
{
   //move object to position and draw it
  pushMatrix();
  translate(100,100);
  line(300,300,x,y);
  popMatrix();
}

/*void reset()
{
  x=mouseX;
y=mouseY;
vx=random(-5,5);
vy=random(-5,5);
 diam=random(10,100);
}*/
}

