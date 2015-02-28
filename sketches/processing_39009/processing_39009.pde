
/* 
 Daniel C. Young
 Points #2
 09/24/2011
*/

// variables
int gap=15;

// setup
size(800,800);
smooth();
background(30);

// draw
for (int x=12;x<width;x=x+gap) {
  for (int y=8;y<height;y=y+gap) {
    if(x%8==0 || x%4==0){
      stroke(255-(y/2.1));
    }else{
      stroke(y/7);
    }
    point(x,y);
    point(x-2,y);
    point(x-4,y);
    point(x-6,y);
    point(x,y+2);
    point(x,y+4);
    point(x,y+6);
  }
}


