
float x=0;
float y = 0;
float a = 0;

void setup() {
  size(400, 400);
  smooth();
  y=height/2;
  background(0);
  noStroke();
}

void draw() 
{
  background(0);
  
  if(x>width){
    x=0; 
  }
  ellipse(x, y, 20, 20);
  x+=2;
  
}


