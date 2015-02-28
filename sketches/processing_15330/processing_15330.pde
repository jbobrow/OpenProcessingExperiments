
float x = 80;
float y = 80;
float n = 80;
float z = 80;
float xspeed = 6;
float yspeed = 6;
float nspeed = 6;
float zspeed = 6;
void setup() {
  size(500,500);
  background(0);
}
void draw() {
 background(50,30,85, 50);
  x = x + xspeed;
  y = y + yspeed;
  n = n + nspeed;
  z = z + zspeed;
ellipse(x,100,100,100);
ellipse(100,y,100,100);
ellipse(x,y,(10-y/4),(10-y/4));
fill(30, 60);
  ellipse(x,y,(50+x/2),(50+x/2));
 ellipse(x,y,(10+y/4),(10+y/4));
ellipse(n,100,100,100);
ellipse(100,z,100,100);

if(x > 450){
  xspeed = - 6;
}
  if(x < 100){
   xspeed = + 6; 
  }
   if(y > 450){
  yspeed = - random(20);
}
  if(y < 100){
   yspeed = random(20); 
}
if(n > 450){
  nspeed = - 6;
}
  if(n < 100){
   nspeed = + 6; 
  }
   if(z > 450){
  zspeed = - random(20);
}
  if(z < 100){
   zspeed = random(20); 
}
}

