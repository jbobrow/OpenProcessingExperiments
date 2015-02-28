
//Gloriana Gonzalez
//HW 11 Screen Saver 
//gloriang@andrew.cmu.edu
//Copyright Gloriana Gonzalez, Pittsburgh, October 2012
//* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/2922*@* 


//spacebar to make background black
//shift to male background white
//click mouse to change color

final int MAX=10000;

PVector[] pos = new PVector[MAX];
PVector[] vel = new PVector[MAX];
color col= color (random(255), random(255), random (255));


void setup ()
{
  size (600, 600);
  background (255);
  smooth();

  for (int i= 0; i< MAX; i++)
  {
   pos [i] = new PVector (random (0, width), random (0,height));
   vel [i] = new PVector (0, 0);
  }
  
  noiseDetail (10);
}

void draw()
{
 
  for (int i=0; i<MAX; i++)
  {
    stroke(col);
    point (pos[i].x, pos[i].y);
    
    vel[i].x = noise(pos[i].x*.05, pos[i].y*.05)*cos(4*PI*noise(pos[i].x*.005, pos[i].y*.005));
    vel[i].y = noise(pos[i].x*.05, pos[i].y*.05)*sin(4*PI*noise(pos[i].x*.005, pos[i].y*.005));
    
    pos[i].add(vel[i]);
    
        if(pos[i].x < 0 || pos[i].y < 0 || pos[i].x > width || pos[i].y > height)
        {
    
      pos[i].x = random(0, width);
      pos[i].y = random(0, height);

        }
  
  }
  
  rectMode(CORNER);
  fill(255, 5);
  rect (0,0, width, height);
 
}
  
void mousePressed()
{
col= color (random(255), random(255), random (255));

}

void keyPressed()
{
  if (keyCode == ' ')
  {
    background(0);
  }
   else if (keyCode == SHIFT)
  {
    background(255);
  }
}





