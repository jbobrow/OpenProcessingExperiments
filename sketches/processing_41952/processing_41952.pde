
int  x, y; 
int j, k;
int r, g, b;
int velocityX, velocityY;
int velocityJ, velocityK;


void setup () {
  size (600, 600);
  smooth ();
  x = 150;
  y = 125;
  velocityX =  25;
  velocityY =  25;
  j= 350;
  k = 400;
  velocityJ = 25;
  velocityK= 25; 
  r = 100;
  g = 75;
  b = 90;


}

void draw () {
  background (100);
  smooth ();
  fill (r,g,b);
  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      rect (30*i, 30*j, 15, 15);
    }
  }
  //green ball
  fill (0, 225,0);
  ellipse (x, y, 60, 60);
  x+= velocityX;
  y+= velocityY;
   if (x > width -25 || x < 25) {
     velocityX *= -1;
     r = 225;
     g = 0;
     b =0;
   }
   if (y > height- 25 || y < 25) {
     velocityY *=-1;
     r = 0;
     g = 225;
     b = 0;
   }
  //blue ball
  fill (0, 0, 225);
  ellipse (j, k, 120, 120);
    j+= velocityJ;
    k+= velocityK;
    if (j > width - 25 || j < 25) {
       velocityJ *=-1;
       r = 0;
       g = 0;
       b = 225;
    }
     if (k > height - 25 || k < 25) {
        velocityK *=-1;
        r = 100;
        g = 0; 
        b = 100;
     }
     
 
   }
  
  





                
                
