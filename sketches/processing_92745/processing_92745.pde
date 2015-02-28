
// Samantha Ticknor
// sticknor
// Hw9
// copyright 2013

color[] col = {color(255, random(100), random(100)),
               color(255, random(100), random(100)),
               color(255, random(100), random(100)),
               color(255, random(100), random(100)),
               color(255, random(100), random(100)),
               color(255, random(100), random(100)),
               color(255, random(100), random(100)),
               color(255, random(100), random(100)),
               color(255, random(100), random(100)),
               color(255, random(100), random(100))};
               
float[] x = {random(400), random(400), random(400),
           random(400), random(400), random(400), 
           random(400), random(400), random(400),
           random(400)};
           
float[] y = {random(400), random(400), random(400),
           random(400), random(400), random(400), 
           random(400), random(400), random(400),
           random(400)};
         
float[] size = {random(10, 40), random(10, 40), random(10, 40),
              random(10, 40), random(10, 40), random(10, 40), 
              random(10, 40), random(10, 40), random(10, 40),
              random(10, 40)};

void setup( )
{
  background(255);
  size(400,400);
  for(int a = 0; a < 400; a += 20){
    line(0, a, 400, a);
  }
  for(int a = 0; a < 400; a += 20){
    line(a, 0, a, 400);
  }
  for(int i = 0; i < 10; i++){
    float xx = x[i];
    float yy = y[i];
    float siz = size[i];
    fill(col[i]);
    rect(xx+8, yy-8, siz, siz);
    rect(xx, yy, siz, siz);
    line(xx, yy, xx+8, yy-8);
    line(xx+siz, yy, xx+8+siz, yy-8);
    line(xx+siz, yy+siz, xx+8+siz, yy-8+siz);
  }
}


