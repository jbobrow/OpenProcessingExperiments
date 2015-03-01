

float x=100;
float y=100;
float xspeed=2;
float yspeed=2;

float diam = 80;


void setup () {
  size (800,400);
  
}


void draw () {
  background (255);
  
  x += xspeed;
  y = y + yspeed;
  
  
  if ((x > width - (120 + (diam/2))) || (x < (diam/2))) {
    xspeed = xspeed * -1;
    diam-=5;

  }
  if ((y > height - (diam/2)) || (y < (diam/2))) {
    yspeed = yspeed * -1;
    diam-=5;


  }
  
  fill (150);
  for (int z=0; z < 3; z++) {
    ellipse(x + (z*60), y, diam, diam);
    
  }

}


