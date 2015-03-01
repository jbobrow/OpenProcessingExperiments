
walker[] W;
float newH;  //current hue 


/*-----------------------*/


void setup()
{
  size(500, 500);
  smooth();
  colorMode(HSB, 360, 100, 100);
  background(0);
  
  //create each walker;
  newH = random(360); 
  W = new walker[100];
  for (int i = 0; i < W.length; i++)  {   W[i] = new walker(newH);  }
}


/*-----------------------*/


void draw()
{    
  for (walker w : W)
  {
    if (random(1) > 0.96) w.setDir(random(-PI, PI));  //change direction sometimes
    w.update();
    w.display(); 
    w.checkEdges();
  }
}


/*-----------------------*/


void mouseReleased()  //set a new hue and clean the background
{
  newH = random(360);
  for (walker w : W)  {   w.h = newH;  }
  background(0);
}


/*-----------------------*/


class walker
{
  PVector oldP, newP; //old and new positions
  PVector velocity, acceleration;
  float h, s, b;  //components of the color
  
  
  walker(float h_)
  {
    //define the color
    h = h_;
    s = random(20, 100);
    b = random(20,100);
    
    //initialize the position
    oldP = newP = new PVector(0, 0, 0);
    
    //initialize the velocity
    velocity = new PVector(0, 0, 0);
    
    //initialize the acceleration
    acceleration = new PVector(random(-1,1), random(-1,1), 0);
    acceleration.normalize();
    acceleration.mult(0.5);
  }
  
  
  void update()
  {
    oldP = newP;
    velocity.add(acceleration);
    velocity.limit(1.5);    
    newP = PVector.add(oldP, velocity);
  }
  
  
  void display()
  {
    strokeWeight(1);
    stroke(h, s, b);
    line(oldP.x, oldP.y, newP.x, newP.y);
  }
  
  
  void setDir(float angle)
  {    
    //direction of the acceleration is defined by the new angle
    acceleration.set(cos(angle), sin(angle), 0); 
    //magnitude of the acceleration is proportional to the angle between acceleration and velocity
    acceleration.normalize();
    float dif = PVector.angleBetween(acceleration, velocity);
    dif = map(dif, 0, PI, 0.1, 0.001);
    acceleration.mult(dif);  

  }
  
  
  void checkEdges()  //if it's out of the screen come back on the opposite edge
  {
    if (newP.x < 0)  newP.x = width;
    if (newP.x > width)  newP.x = 0;   
    if (newP.y < 0)  newP.y = height;
    if (newP.y > height)  newP.y = 0;   
  }
}


