
void setup()
  {
  size (800,400);
  fill(0,0,0);
  rect(0,0,width/2,height);
  fill(255,255,255);
  rect(width/2, 0, width/2, height);
  }

void draw(){  
int i = 0;
while (i < width/2) 
  {
  fill(255,0,0);
  rect(i, 0, 10, 10);
  rect(i, height-10, 10, 10);
  i = i + 5;
  }
  //vertical
  int y = 0;
while (y < height-5) 
  {
  rect(0,y,10,10);
  rect(width/2-5,y,10,10);
  y = y + 5;
  }
  
for (int a = 0; a < width/2; a = a+15){
  {
  fill(0,0,255);
  ellipse(width/2+a, height-a, 20, 20);
  ellipse(width/2+a, a, 20, 20);
  }
}
}
  




