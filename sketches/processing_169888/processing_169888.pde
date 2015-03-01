
Rocket r;
int num_objects = 150;
Star[] star_array = new Star[num_objects];


void setup ()
{
  size(400,600);
  r = new Rocket();
  
  for(int i = 0; i< num_objects; i++)
  {
    star_array[i] = new Star();
  }
}


void draw ()
{
 background(15); 
 noStroke();
 fill(250,255,124,80);
 

 
 for(int i = 0; i < num_objects; i++)
 {
   star_array[i].update();
   star_array[i].display();
 }
 
 fill(190,20);
 noStroke();
 r.update();
 r.display();
 
 
 
}


  
  










class Star //____________________________________________________
{
  float x,y, vx,vy, grav, diam;
  float bounciness;
  
    Star()
    {
      x = random(width);
      y = random(height);
      diam = random(.01,5);
      vx = random (-.01,.01);
      vy = random(-.05,.05);
      grav = 0;
    }
    


void update()
{
    vx += grav;
    x += vx;
    y += vy;    
}


void display()
{
  pushMatrix();
  translate(x,y);
  ellipse(0,0,diam,diam);
  popMatrix();
}







}//end of class Star ____________________________________________


class Rocket 
{
  float x,y, vx, vy, grav, diam;
  
  Rocket()
  {
    x = 200;
    y = 700;
    diam = 20;
    vx = 0;
    vy = -.01;
    grav = -.02;
  }
  
void update ()
{
  vy += grav;
  x += vx;
  y += vy;
  
  
}


void display()
{
  pushMatrix();
  translate(x,y);
  rect(0,0,20,30);
  popMatrix();
}
  
  
  
  
}


