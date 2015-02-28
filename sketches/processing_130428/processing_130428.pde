
int xInc = 25; //increases the x value by 25 every loop
int yInc = 25; //increases the y value by 25 every loop

// the below values set the position of the triangle
//while s set's the type of triangle. 
int s = 1;
int y = 0;
int x = 0;

//float[] r = {(PI/2), (3*PI/2), (PI), (2*PI)};

//the size of the rectangle within the square mold
int z = 25;

void setup()
{
size(800,800);
}
void draw() {
noStroke();
fill(0);
background(255);
for (x = 0; x < width; x += xInc){
  
for (y = 0; y < height; y += yInc){
  
 s = int(random(0,4));
if (s == 1){
//  rotate(r[int(random(-1,4))]);
  triangle(x, y - 25, x - 25, y - 25, x - 25, y);
  }
if (s == 2){
  triangle(x, y, x, y - 25, x - 25, y - 25);
}
if (s == 3){
     triangle(x, y, x - 25, y, x - 25, y - 25);
  }
if (s == 4){
     triangle(x, y - 25, x, y, x - 25, y);
  }
   noLoop();
 
}
}
}

void keyPressed()
{
  if (key == ENTER)
  {
      loop();
    }
}


 


