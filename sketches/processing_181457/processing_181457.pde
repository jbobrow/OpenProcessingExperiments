
float acc = .05;
float vel = .4;
float z_limit = 6;

Colony bc = new Colony();
boolean mouseDown = false;
 
void setup()
{
  size(800,400,P2D);
  smooth();
  noStroke();
  
  for(int i=0; i<80;i++){
    bc.add(new Bee(7,random(width),random(height)));
  }
}
 
void draw()
{
  background(255,255,255,0);
  
  bc.run();
}

class Bee
{
  int diameter;
  float x, y;
  float dx, dy, dz;
   
  Bee(){  }
 
  Bee(int D, float X, float Y)
  {
    diameter = D;
    x = X;
    y = Y;
    dx = random(-vel,vel);
    dy = random(-vel,vel);
  }
 
  void run()
  {
    move();
    change_momentum();
    display();
  }
 
    void move()
  {
    
    float targetX;
    float targetY;
    float easing = 0.02;
    
    if(x - mouseX >= -100 && x - mouseX <= 100 && y- mouseY >= -100  && y- mouseY <= 100){
      
    targetX = mouseX;
    dx = targetX - x;
    
    if(abs(dx) > 1){
       x += dx * easing; 
    }
    
    targetY = mouseY;
    dy = targetY - y;
    
    if(abs(dy) > 1){
    y += dy * easing;
    }
    
    }
    else{
      
    x += dx;
    y += dy;
     
    if(x > width){
      x = width; dx = 0;
    }
    if(x < 0){
    x = 0; dx = 0;
    }
    if(y > height){
    y = height; dy = 0;
    }
    if(y < 0){
    y = 0; dy = 0;
    }
    }
  }
   
  void change_momentum()
  {
    dx += random(-acc, acc);
    dy += random(-acc, acc);
   
    if(dx >  vel) dx =  vel;
    if(dx < -vel) dx = -vel;
    if(dy >  vel) dy =  vel;
    if(dy < -vel) dy = -vel;
  }
 
  void display()
  {
    noStroke();
    fill(random(200,255));
    ellipse (x+2, y-2, 10, random(30));
    fill(255,219,13);
    ellipse (x, y, 15, 10);
  }
}

class Colony
{
  ArrayList bees = new ArrayList();
   
  Colony(){}
   
  void add(Bee b)
  {
    bees.add(b);
  }
  
  void run()
  {
    for(int i = 0; i < bees.size(); i++)
    {
      Bee b = (Bee)bees.get(i);
      b.run();
    }
  }
}
