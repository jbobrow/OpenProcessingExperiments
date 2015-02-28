
//5)8x8 checkerboard
void setup() {
size(400,400);
smooth();
 
}
 
void draw() {
  for (int x=0; x<400; x+=50){
  //line(x,y,x,y+len);
  for (int y=0; y<400; y+=50)
  {
  //line(x,y,x+len,y);
  if ((x+y) % 4 == 0) {
   fill(0);
  } else {
    fill(255, 3, 3);
    }  
    rect(x, y, 100, 100);
 
    }
  }
}


