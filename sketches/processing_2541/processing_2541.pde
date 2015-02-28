
class Particle {
  
  float x;
  float y;
  float xspeed;
  float yspeed;
  
  Particle () {
    x = 200;
    y = 100;
    xspeed = random (-5,6);
    yspeed = random (-9,3);
    
  }
  
void run () {
  x = x + xspeed;
  y = y + yspeed;
}

void gravity () {
  yspeed += 0.4;
}

void display () {
  noStroke ();
  fill (187,231,249);
  ellipse (x,y,3,3);
}
}

