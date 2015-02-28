



                
                float x = 0;
float y = 0;
float xspeed = 15;
float yspeed = 5;
float a = 0;
float b = 0;
float aspeed = 3;
float bspeed = 2;
float p = 100;
float q = 400;
float pspeed = -2;
float qspeed = -5;

void setup(){
  size(400,400);
}

void draw(){
  background(0);
  fill(10,600,150);
  ellipse(x,y,100,100);
  x = x + xspeed;
  y = y + yspeed;
  if (x > 400){
    xspeed = -100;
  }else if(x<0){
  xspeed = 20;
  }  
 

  fill(50,100,400,700);
  ellipse(a,b,20,50);
  a = a + aspeed;
  b = b + bspeed;
  
  if (b > 400){
    bspeed = -10;
  }else if(b < 0){
   bspeed = 10;

}

if (a > 400){
  aspeed = -random(70);
}
if (a < 0){
  aspeed = random(70);
  
}


fill(20,150,100,200);
  ellipse(p,q,50,100);
  p = p + pspeed;
  q = q + qspeed;
  
  if (p < 0){
    pspeed = 10;
  }else if(p > 400){
   pspeed = -10;
}

if (q < 0){
  qspeed = random(100);
}
if (q > 400){
  qspeed = -random(100);
  
}
}
