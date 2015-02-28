
int r = 35;
float [] x = new float [100];
float [] y = new float [100];
float [] xspeed = new float [100];
float [] yspeed = new float [100];
 
 
void setup () {
 // frameRate (50);
  size (600,400);
//  smooth ();
  noStroke();
   
  int i = 0;
  while (i< x.length) { 
    x [i] = random (0,0);
    y [i] = random (0,0);
    xspeed [i] = random (2,10);
    yspeed [i] = random (1,7);
    i=i+1;
  }
}
   
 
void draw () {
 background (247,70,0);
   
int i=0;
 while ( i < x.length-1) {
      fill (random(0,255));
      noStroke();
      ellipse (x[i], y[i], r, r);
      stroke(30);
      i=i+1;
   }
    
i=0;
 while ( i < x.length-1) {
       x [i]  = x[i] + xspeed[i];
       y [i] = y[i] + yspeed[i];
         if ((x[i] > width) || (x[i] < 0)) {
    xspeed[i] = xspeed[i] * -1;   
  }
         if ((y [i]> height) || (y[i] < 0)) {
    yspeed[i] = yspeed[i] * -1;
  }
  i=i+1;
}
}

