
int y = 200;
int x = 0;
int z = 1;

void setup () {
  size (400,400);
  background(255);
}
 
void draw (){
  line(0,200, x, y);
  x++;

  if (x >= 100) {
  fill(200);
  ellipse (200, 200, 200, 200);
  }

  if (x >= 150) {
  fill(150);
  ellipse (200, 200, 150, 150);
  }
  if (x >= 200) {
  fill(100);
  ellipse (200, 200, 100, 100);
  
  if (x >= 250 ) {
  fill(50);
    ellipse (200, 200, 50, 50);
  
  }
   if (x >= 390 && x == 400) {
  fill(50);
    ellipse (200, 200, 50, 50);
  
  }
  
  else if (x >= 400) {
  line(0, z, width, z);
  z = z + 2;
 

  }
  

  }
 println(x,y);
  
}




