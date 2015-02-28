
int x;
int y; 

void setup(){
  size(450,400);
  background(112,111,139);
  fill(82,164,173);
  ellipse(310,120,70,70);

  x=50;
  y=50;
}

void draw(){
  fill(82,164,173);
  triangle(x,y,20,360,width,height);
  x = x + 1;
  if ( x > 350){
    x = 350;
  }
  
  y = y + 1;
    if (y > 360){
    y = 360;
  }
}






