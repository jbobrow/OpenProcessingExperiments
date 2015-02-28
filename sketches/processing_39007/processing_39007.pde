
/* 
  Daniel C. Young
  Points #1
  09/24/2011
*/

// variables
int gap=25;

// setup
size(800,800);
smooth();
background(100);
stroke(255);

// draw
for(int x=10;x<width;x=x+gap){
  for(int y=10;y<height;y=y+gap){
    stroke(255-(y/2.5));
    point(x,y);
    for(int i=5;i<15;i=i+5){
      point(x+i,y-i);
      point(x-i,y+i);
    }
  }
}

