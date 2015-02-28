
ArrayList particles;
///fuck arraylist, 

void setup()
{
  size(500, 500);
  particles = new ArrayList(10);
  smooth();
}

void draw()
{ 
  background(255, 242, 242);
  particles.add(new Particle());
  
  for(int i=0; i<particles.size(); i++)
    {
      Particle p = (Particle) particles.get(i);
      p.run();
      p.gravity();
      p.display();
      ///REMINDER TO SELF: ^^^^^^ don't forget to void () these commands when finishing code
    }
    
    //arralist shouldnt go above 100 particles. keep organized and steady
    if(particles.size()>100)
      {
        particles.remove(0);
      }
}
 



class Particle //seconds minutes hours need to be mapped and incoroprated with pi, if wanted to use regular clock format
{
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;

  float x;
  float y;
  float xmin;
  float ymin;
  float xhour;
  float yhour;
  float xspeed;
  float yspeed;

Particle()
{
  /////trig trig trig trig bleeeehhh have to do math. 
 //writing out mathmatical instead of already multiplying. helps me
  x = cos(s) * 150 + 200;
  y = sin(s) * 150 +200;
  xmin = cos(m) * 120 + 200;
  ymin = sin(m) * 120 +200;
  xhour = cos(h) * 80 + 200;
  yhour =cos(h) * 80 + 200;
  xspeed = random(-2, 2);
  yspeed = random(-2, 2);
}

void run()
{
  x = x + xspeed;
  y = y + yspeed;
  xmin = xmin + xspeed;
  ymin = ymin + yspeed;
  xhour = xhour + xspeed;
  yhour = yhour + yspeed;
}

void gravity()
{
  yspeed -=0;
}

void display()
{
  stroke(random(220, 255), random(214, 240), random(230, 255), random(200, 240));
  
  line(x, y, width/2, height/2);
  line(xmin, ymin, width/2, height/2);
  line(xhour, yhour, width/2, height/2);
  
  noStroke();
  fill(random(200, 255), random(200, 255), random(200, 255), random(0, 20));
  ///add pointers on ends of clock hands??
  ellipse(x, y, 30, 20);
  ellipse(xmin, ymin, 30, 20);
  ellipse(xhour, yhour, 30, 20);
  
    if((mouseX>400)&&(mouseX<width-40)) 
        {
          x = cos(s) * 150+200;
          y = sin(s) * 150+200;
          xmin = cos(m) * 120+200;
          ymin = sin(m) * 120+200;
          xhour = cos(h) * 80+200;
          yhour = sin(h) * 80+200;
        }
    } 
}
