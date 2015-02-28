

float x = 200;
float y = 200;
float r = 0;
float f = 0;


float xm = 0;
float ym = 0;

void setup(){
  size(400,400);
  background(0);
  smooth();
}
 
void draw() {
  background(0);
 stroke(255);
   fill(f);

float d = abs(dist(xm, ym, x+r, y+r));

xm = mouseX;
ym = mouseY;

 ellipse( x+r, y+r, 20, 20);
 y = y + (ym - y)/400;
 x = x + (xm - x)/400;



if(xm >= (x+r)){

  f += 10;
} else {
  f -= 10;
}



}

