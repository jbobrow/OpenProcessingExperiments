
int size=0;
float x;
float y;

boolean circleIsShrinking = false;

void setup() {
  size(400, 400);
  smooth();  
  
}

void draw() {
  background(0);
  fill(x, 0, y);
  ellipse(width/2, height/2, size, size);
  x=random(width);
  y=random(height);
  
 
  if (circleIsShrinking) size--;
  else size++;
  
  
  if (size == 0 || size == 150) circleIsShrinking = !circleIsShrinking;
}
  
 

  

  
  



