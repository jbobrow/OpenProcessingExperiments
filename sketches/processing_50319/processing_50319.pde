
//summons transparent arc when mouse is clicked
//arc grows the farther away it is from middle of drawing.
//needs for loop
int value = 0;

void setup()
{
  size (600,600);
  background (0);
}


void draw()
{
 
  noStroke();
  background(0);
  
  //creates random field of grayscale ellipses
   for (int a = 233; a<250; a++)
  {
    fill (random(25));
    ellipse (random(600),random(600),random(300),random(300));
  }
  
  //draws an arc that decreases as it reaches center
  fill(255,255,122,122);
  float lager = dist(width,height, pmouseX, pmouseY);
  if (mousePressed)
  {
  arc (mouseX,mouseY,125,75, PI/8, (2*PI)*(lager/600));
  }
  
  
}

