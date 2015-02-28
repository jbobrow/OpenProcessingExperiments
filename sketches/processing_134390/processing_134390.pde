
float x1 = 0;
float y1 = 0;
float xspeed1 = 0;
float yspeed1 = 0;

void setup() {
  size( 600, 600);
  background(#000000);
  stroke(#ffffff);
  smooth();
  frameRate(100);
  stroke(255);
  noLoop();
  
  int x;
  int y;
  int i;
  int j;  
  for ( i = 0; i < width; i = i + 10) {
//     stroke(255-i);
    line (0, i, i, height);
    }
  
  for (j = 0; j < width; j = j + 10) {
    line (j, 0, width, j);
  }

  }

 void draw() {
   noStroke();
//   fill(0);
//   rect(0,0,width,height);
   
   x1 = x1 + xspeed1;
   y1 = y1 + yspeed1;
  
   if ((x1 > width) || (x1 < 0)) {
      xspeed1 = -xspeed1;
    }
   if ((y1 > height) || (y1 < 0)) {
      yspeed1 = -yspeed1;
    }  
   
   stroke(255); 
   line (0,y1,width,y1);
   line (x1,0,x1,height);
}


void mousePressed ()
{
  redraw ();
}


