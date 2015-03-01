
final int NB = 180;
float speedMax = 4;
PVector[] pos = new PVector[NB];
float maxDist;
final int MODE_1 = 0;//behind the scene
final int MODE_2 = 1;//circles
final int MODE_3 = 2;//rectangles
int currentMode = MODE_2;
float l, L;
 
void setup()
{
  size(500, 400, P2D);
  maxDist = sqrt(width*width + height*height);
  speedMax = maxDist / 100;
  l = min(width, height);
  L = max(width, height);
  rectMode(CENTER);
  noFill();
  for (int i = 0; i < NB; i++)
  {
    pos[i] = new PVector(random(width), random(height));
  }
}
 
void draw()
{
  background(200);
  PVector mous = new PVector(mouseX, mouseY);
  PVector sum = new PVector(0, 0);
  float distance;
  for (int i = 0; i < NB; i++)
  {
    sum.add(PVector.sub(mous, pos[i]));
  }
  sum.mult(.0001);
  sum.limit(speedMax);
   
  for (int i = 0; i < NB; i++)
  {
    pos[i].add(sum);
    if (pos[i].x < 0 || pos[i].x > width || pos[i].y < 0 || pos[i].y > height)
    {
      if (random(1) < l / (L+l))//birth should be on one of the 2 shortest sides
      {
        if (width > height)
        {
          pos[i].x = sum.x > 0 ? 0 : width;
          pos[i].y = random(height);
        }
        else
        {
          pos[i].x = random(width);
          pos[i].y = sum.y > 0 ? 0 : height;
        }
      }
      else//birth should be on one of the 2 longest sides
      {
        if (width > height)
        {
          pos[i].x = random(width);
          pos[i].y = sum.y > 0 ? 0 : height;
        }
        else
        {
          pos[i].x = sum.x > 0 ? 0 : width;
          pos[i].y = random(height);
        }
      }
    }
    distance = PVector.dist(mous, pos[i]);
    stroke(map(distance, 0, maxDist, 10, 120), map(distance, 0, maxDist, 50, 10));
    strokeWeight(1);
     
    if (currentMode == MODE_1)
    {
      line(mouseX, mouseY, pos[i].x, pos[i].y);
      strokeWeight(4);
      ellipse(pos[i].x, pos[i].y, 10, 10);
    }
    else if (currentMode == MODE_2)
    {
      ellipse(pos[i].x, pos[i].y, 2*distance, 2*distance);
    }
    else if (currentMode == MODE_3)
    {
      rect(pos[i].x, pos[i].y, 2*distance, 2*distance);
    }
   }
}
 
void mousePressed()
{
  currentMode = (currentMode+1) % 3;
}
 code
 tweaks (0)
about this sketch
line ellipse rect force 731 views June 20, 2014
collection: Illusions
This sketch is running in HTML5 using Processingjs.

how to attribute?
license
   



why?
advertisement

 
 oggy


doodly lines
 Add to Faves 6 
Tweak!
Download
Embed
nothing much to say, just click to change the visualization mode :-)

 Jerome Herr    
20 Jun 2014 Very cool!!
 TomaszS    
21 Jun 2014 Love the square mode.
 Daniel Hoare   
8 Oct 2014 Really interesting effects, love how mindbending the first mode is
 Kryštof Pešek (Kof)    
11 Oct 2014 There is something really interesting in this sketch.. mostly in the circle mode, it almost creates 3d-like space.. I am kind of collecting "illusive" sketches.. whatever, really nice one, thanks for sharing.
 oggy   
12 Oct 2014 thx guys, first mode is the best one I admit :-) But the last mode is actually what I started to achieve first... it's just great to end up where you didn't intend to!
M4U Movies
  When there is a reply, notify me. 

About OpenProcessing
OpenProcessing is an online community platform devoted to sharing and discussing Processing sketches in a collaborative, open-source environment.

 Download Processing
Terms of Service - Privacy Policy

Get in Touch
