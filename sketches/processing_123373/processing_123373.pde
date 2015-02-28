
Ring []speed ;
 
int Rect = 20;
float angle = 0.01;
 
void setup()  {
  background (255);
  size(1400,750);
  smooth();
  speed = new Ring[Rect];
  for (int s=0;s<Rect;s++)  //instructions for draw
  speed[s] = new Ring(s*random(0.005)); //varying speeds with limit in ()

  
}
 
void draw()   {
 scale(sin(angle) + 1); //size of circles
  for (int s=0; s < Rect; s++)  {
    speed[s].display();
  }
  if (mousePressed){  
    //stroke (10);
    fill (random(255),240,12,12); //fills rectangle in green
    tint (random (255),random(255));
    scale(cos(angle) + 2); //size of the whole shape including squares
  for (int s=1; s < Rect; s++)  {
    speed[s].display();
    
    stroke (0);
 
scale(cos(mouseX*angle) + random(0.2)); //change of shape (size, trail), function
for (int S=1; S < Rect; S++)  {
speed[S].display();
}
}}
  
  else {
  fill(255);
  }
 
}
 
class Ring
{
  float x, y, a, b, r, th, spinSpeed;
   
  Ring(float spinSpeedvar)  {
    spinSpeed = spinSpeedvar;
    a = width/5; //velocity between circles
    b = height/2; 
    r = 300;  //how far out it spins
  }
   
  void display()  {
    th = th + spinSpeed;
    x = a + r*tan(th); //direction, function shape 
    y = b + r*cos(th);  

    rect(x,y,40,40);
  }
  
    
    
   
  }
  
  

    

