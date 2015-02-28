
float x,y,vx,vy,rad,drag;
Particle p;
Particle[] ps;
//array




void setup()
{
  size(1300, 700);
  x = random(width);
  y = random(height);
  vx = random(-1,1);
  vy = random(-1,1);
  rad = 10;
  drag = .97;
  ellipseMode(CENTER);
  noStroke();
  smooth();
  
  //instantiate or construct the class
  p = new Particle();
  //construct array as well
  ps = new Particle[100];
  
  //fill the array with particle objects...
  for(int i = 0; i < ps.length; i++)
  {
    ps[i] = new Particle();
    
  }
  
}




void draw()
{
  background(100);
  
  fill(100); //solo ellipse
  x+=vx;
  y+=vy;
  vx+=noise(x*.01,y*.01,frameCount*.01)-.5;    //change frequency by changing decimals
  vy+=noise(frameCount*.01,x*.01,y*.01)-.5;
  vx*=drag;
  vy*=drag;
  
  //keeps object in bounds
  //left bound
  if(x < -rad)
  {
    x = width + rad;
  }
  
  //right
  if(x > width+rad)
 {
   x = -rad;
 }
 
 //top
 if(y < -rad)
 {
   y = height+rad;
 }
 
 //bottom
 if(y > height+rad)
 {
   y = -rad;
 }
  
  pushMatrix();
  translate(x,y);
  ellipse(0,0,rad,rad);
  popMatrix();
  
  p.update(); //calls particle 'p' to update
  p.display();
  noStroke();
  for(int i = 0; i < ps.length; i++)
  {
    ps[i].update();
  }
  

  stroke(200,random(0,100)); //lines
  for(int i = 0; i < ps.length; i++)
  {
    //creat inline cariables to track the info we need.
    float x1 = ps[i].x;
    float y1 = ps[i].y;
    
    //check positions of all the others...
    for(int j = i+1; j < ps.length; j++)
    {
    float x2 = ps[j].x;
    float y2 = ps[j].y;
    //calculate distance between 2 particles
    if(dist(x1,y1,x2,y2) < 50)
    {
      ps[i].connected = true;
      ps[j].connected = true;
      line(x1,y1,x2,y2);
    }
    
   }

  }
  noStroke();
  for(int i = 0; i < ps.length; i++)
  {
    ps[i].display();
  }
    
  
} //end of draw

void mouseReleased()
{
  for(int i = 0; i < ps.length; i++)
  {
    ps[i].reset();
  }
  
  
}


class Particle
{
  //local to the class, will not conflict with global variables
  float x,y,vx,vy,rad,drag;
  boolean connected;
  
  //constructor function
  //name must match class name and is CASE SENSITIVE
   Particle()
  {
    x = random(width);
    y = random(height);
    vx = random(-1,1);
    vy = random(-1,1);
    rad = 8;
    drag = .80;
    connected = false;
  }
  
  void update()
  {
  
  connected = false;  
  x+=vx;
  y+=vy;
  vx+=noise(x*.01,y*.01,frameCount*.01)-.5;
  vy+=noise(frameCount*.01,x*.01,y*.01)-.5;
  vx*=drag;
  vy*=drag;
  

  //left bound
  if(x < -rad)
  {
    x = width + rad;
  }
  
  //right
  if(x > width+rad)
 {
   x = -rad;
 }
 
 //top
 if(y < height/2)
 {
   y = height+rad;
 }
 
 //bottom
 if(y > height+rad)
 {
   y = height;
 }
 
 } //end of update function
  
  
  void display()
  {
    if(connected)
    {
     fill(200, random(40,150)); //fill and transparency
    }
    else
    {
     fill(0, 0);
    }
   
    pushMatrix();
    translate(x,y);
    ellipse(0,0,rad,rad);
    popMatrix();
    
  }
  
  void reset()
  {
    x = mouseX+random(-10,10);
    y = mouseY+random(-10,10);
    
  }
  
  
}
