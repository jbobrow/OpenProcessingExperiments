
// Started with
// Michael's "Collision Detection with Objects"
// Sketch: 54863
class BigGuy
{
   float x, y;
   float mass;
   BigGuy(float tx, float ty, float tm)
   {
      x = tx;
      y = ty;
      mass = tm;
   }
   void display()
   {
     fill(224, 199, 113); // rgb
     noStroke();
     ellipse(x,y, mass,mass);
   }
}


class LittleGuy
{
  float x, y;
  float mass;
  float ny;
  float xspeed, yspeed;
 
  LittleGuy(float tx, float ty, float tm)
  {
    x = tx;
    y = ty;
    mass = tm;
    xspeed = random(-3, 3);
    yspeed = random(-3, 3);
  }
  void display()
  {
    fill(000, 000, 000, 150);
    noStroke();
    ellipse(x, y, mass, mass);
  }
  void update()
  {
    x += xspeed;
    y += yspeed;
    //wall bouncing
    if (  x >= width-(mass/2) || x <= (mass/2)  )
      xspeed *= -1.0;
    if (  y >= height-(mass/2) || y <= (mass/2)  )
      yspeed *= -1.0;
  }
 
  void check(BigGuy bg)
  {
    float d = dist(x, y, bg.x, bg.y);
    if (d <=  (mass+bg.mass)/2)
    {
      stroke(255, 255, 255);
      strokeWeight(30);
      noFill();
      rect(0, 0, width-1, height-1);
    }
  }
}

BigGuy bg;
LittleGuy lg1, lg2, lg3;
 
void setup()
{
  size(600,400);
  smooth();
  bg = new BigGuy(width/2,height/2, 150);
  lg1 = new LittleGuy(random(80,width-80),random(80,height-80), random(30,80));
  lg2 = new LittleGuy(random(80,width-80),random(80,height-80), random(30,80));
  lg3 = new LittleGuy(random(80,width-80),random(80,height-80), random(30,80));
}
void draw()
{
   background(159, 127, 52); // rgb
   //Draw the center unit
   bg.display();
    
   //Draw and Display the little units.
   lg1.display();
   lg1.update();
   lg1.check(bg); //Check their positions agasint the center unit. Pass in the
                 //whole bg object to check positions against lg1, etc.
    
   lg2.display();
   lg2.update();
   lg2.check(bg);
    
   lg3.display();
   lg3.update();
   lg3.check(bg);
}


