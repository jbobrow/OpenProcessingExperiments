
/*
"For" Loop practice 

by Jasmine Rajavadee 
*/

void setup()
{
  size(500, 500); 
  smooth(); 
  frameRate(10);
}

void draw()
{
  background(46, 142, 136); 
  for (int c = 0; c < 600; c = c + 25) 
  {
    for (int i = 0; i < 600; i = i + 25) 
    {
      //noStroke(); 
      stroke(255, 200, 5); 
      fill(i, 50, c); 
      ellipse(c, i, 10, 10);
    }
  }

  /*for(int l = 0; l < 400; l = l + 5)
   {
   fill(random(255), random(255), 0); 
   float x = random(0, 500); 
   float y = random(0, 500); 
   strokeWeight(random(1, 3)); 
   stroke(255, 200, 1); 
   rect(l, x, l, y);
   }*/
  for (int l = 0; l < 500; l = l + 5) 
  {
    float x = random(0, 300); 
    float y = random(0, 300); 
    strokeWeight(random(1, 3)); 
    stroke(255, 200, 5); 
    line(l, x, l, y);
  }

  for (int w = 500; w > 0; w = w - 10)
  {
    stroke(242, 242, 171);
    strokeWeight(random(1, 3)); 
    line(250, -50, w, 500); 
  }
}

