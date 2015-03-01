
//Nancy Wang nancyw
//copyright notice
float wd, ht;
float x=0, y=0;
float easing;


void setup()
{
  size(400, 400);
  smooth();
  easing=.05;
}

void draw()
{
  background(0);

  float dif_in_x = mouseX-x;
  float dif_in_y = mouseY-y;
  float new_x = x+(dif_in_x*easing);
  float new_y = y+(dif_in_y*easing);
  x = new_x;
  y = new_y;
 
  wd=x-y;
  ht=y*.8;
  stroke(0, 65, 89);
  fill(0, 173, 206);
  ellipse (x, y, wd, ht);
  stroke (0, 65, 89);
  strokeWeight (3);
  fill(170, 206, 226);
  rectMode (CENTER);
  rect(x, y, wd*.7, ht*.7);
  stroke(140, 101, 211);
  strokeWeight(10);
  fill(154, 147, 236);
  ellipse(x, y, wd*.63, ht*.63);
  stroke(202, 185, 241);
  strokeWeight(7);
  fill(65, 179, 247);
  quad(x-.18*wd, y-.2*ht, x+.25*wd, y-.03*ht, x-.15*wd, y+.23*ht, x-.11*wd, y-.01*ht);
  stroke(0, 197, 144);
  fill(115, 235, 274);
  strokeWeight(8);
  ellipse(x, y, wd*.15, ht*.15);
  fill(0, 65, 89);
  strokeWeight(1);
  ellipse(x, y, wd*.07, ht*.07);
  
}


