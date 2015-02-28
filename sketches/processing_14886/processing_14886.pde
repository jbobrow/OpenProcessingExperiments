
float x = 0;
float y = 0;
float xspeed = 3;
float yspeed = 6;
float a = 0;
float b = 0;
float aspeed = 6;
float bspeed = 3;
float p = 400;
float q = 400;
float pspeed = -3;
float qspeed = -6;

void setup(){
  size(400,400);
}

void draw(){
  background(0);
  fill(250,120,230,200);
  ellipse(x,y,50,50);
  x = x + xspeed;
  y = y + yspeed;
  if (x > 400){
    xspeed = -3;
  }else if(x<0){
  xspeed = 3;
  }  
  
  if (y > 400){
    yspeed = -random(20);
  }
  
  if (y<0){
    yspeed = random(20);
  }


  fill(80,220,250,200);
  ellipse(a,b,100,100);
  a = a + aspeed;
  b = b + bspeed;
  
  if (b > 400){
    bspeed = -3;
  }else if(b < 0){
   bspeed = 3;
}

if (a > 400){
  aspeed = -random(30);
}
if (a < 0){
  aspeed = random(30);
  
}


fill(220,250,80,200);
  ellipse(p,q,170,170);
  p = p + pspeed;
  q = q + qspeed;
  
  if (p < 0){
    pspeed = 3;
  }else if(p > 400){
   pspeed = -3;
}

if (q < 0){
  qspeed = random(50);
}
if (q > 400){
  qspeed = -random(50);
  
}
}
