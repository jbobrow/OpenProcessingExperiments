
size(800,800);
background(255);
 

int space = 50;
int ms = 12;
int f = 10;
  
// a grid of points

for (float x = 0; x<width; x+=space) {
  for (float y = 0; y<height; y+=space) {
 strokeWeight(abs(ms*sin(f*x/width*2)+(ms*sin(f*y/height*2))));
 
   point(x+3, y+3);
  }
}



