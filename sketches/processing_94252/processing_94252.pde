
// Samantha Ticknor
// sticknor
// Hw10
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
             
float[] dx = {random(-4, 4), random(-4, 4), random(-4, 4),
              random(-4, 4), random(-4, 4), random(-4, 4), 
              random(-4, 4), random(-4, 4), random(-4, 4),
              random(-4, 4)};
  
           
float[] y = {random(400), random(400), random(400),
           random(400), random(400), random(400), 
           random(400), random(400), random(400),
           random(400)};

float[] dy = {random(-4, 4), random(-4, 4), random(-4, 4),
              random(-4, 4), random(-4, 4), random(-4, 4), 
              random(-4, 4), random(-4, 4), random(-4, 4),
              random(-4, 4)};

float[] size = {random(10, 40), random(10, 40), random(10, 40),
              random(10, 40), random(10, 40), random(10, 40), 
              random(10, 40), random(10, 40), random(10, 40),
              random(10, 40)};

void setup( )
{
  background(255);
  size(400,400);
}

void draw()
{
  drawTheSquares();
  moveThem();
}

void drawTheSquares(){
  fill(255);
  rect(0, 0, width, height);
  for(int a = 0; a < width; a += 20){
    line(0, a, width, a);
  }
  for(int a = 0; a < height; a += 20){
    line(a, 0, a, height);
  }
  for(int i = 0; i < 10; i++){
    float xx = x[i];
    float yy = y[i];
    float dxx = dx[i];
    float dyy = dy[i];
    float siz = size[i];
    fill(col[i]);
    rect(xx+8, yy-8, siz, siz);
    rect(xx, yy, siz, siz);
    line(xx, yy, xx+8, yy-8);
    line(xx+siz, yy, xx+8+siz, yy-8);
    line(xx+siz, yy+siz, xx+8+siz, yy-8+siz);
  } 
}

void moveThem(){
  for(int i = 0; i < 10; i++){
    float xx = x[i];
    float yy = y[i];
    float dxx = dx[i];
    float dyy = dy[i];
    x[i] = xx+dxx;
    y[i] = yy+dyy;
    if(x[i] > width || y[i] < 0){
      dx[i] = -dx[i];
   }
   if(y[i] > width || y[i] < 0){
      dy[i] = -dy[i];
   }
  }
}

