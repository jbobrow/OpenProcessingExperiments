
/* 
  Daniel C. Young
  Lines #1
  09/24/2011
*/
 
// variables
int gap=15;

// setup
size(800,800);
smooth();
background(0);

// draw
for(int x=10;x<width;x=x+gap){
  for(int y=10;y<height;y=y+gap){
    int offset=50;
    if(y%80==0 || x%160==0){
      stroke(255);
    }else{
      stroke(30);
    }
    line(width/2-offset,height/2,height,y);
    line(width/2+offset,height/2,x,0);
    line(width/2-offset,height/2,x,width);
    line(width/2+offset,height/2,0,y);
  }
}
stroke(0);
strokeWeight(18);
line(0,height/2,width,height/2);

