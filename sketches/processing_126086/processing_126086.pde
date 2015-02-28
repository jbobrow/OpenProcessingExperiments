
Asteroid a1 = new Asteroid(50,60,2.0,2.0);
Asteroid a2 = new Asteroid(50,40,2.0,1.5);
Asteroid a3 = new Asteroid(50,70,3.0,1.5);
Asteroid a4 = new Asteroid(50,70,2.0,2.5);

void setup(){
  size(500,500);
  
}

void draw() {
  background(204);
  a1.update();
  a2.update();
  a3.update();
  a4.update();
  
}


class Asteroid{
 float xpos, ypos, xspeed, yspeed;
Asteroid (float x, float y, float sx, float sy) {
  ypos = y;
  xspeed = sx;
  yspeed = sy;
  xpos = x;
}
void update() {
  ypos += yspeed;
  if (ypos > height - 15) {
    yspeed *= -1;
  }
  if (ypos < 15) {
    yspeed *= -1;
  }
  xpos += xspeed;
  if (xpos > width - 15){
    xspeed *= -1;
  }
  if (xpos < 15){
    xspeed *= -1;
  }
  fill(0);
  ellipse(xpos,ypos,30,30);
}
}
