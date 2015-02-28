
int change = 1;
int x = 5;

void setup()
{
  size(300,300);
  noFill();
  background(0,0,0);
  smooth();
}

void draw()
{
  
//ellipses rotated (neon purple color)
  fill(0,0,0,8);
  rect(0,0,300,300);
  noFill();
  translate(150,150);
  rotate(PI/4);
  ellipse(10,x,150,60);
  rotate(PI/4);
  ellipse(10,x,150,60);
  rotate(PI/4);
  ellipse(10,x,150,60);
  rotate(PI/4);
  ellipse(10,x,150,60);
  rotate(PI/4);
  ellipse(10,x,150,60);
  rotate(PI/4);
  ellipse(10,x,150,60);
  rotate(PI/4);
  ellipse(10,x,150,60);
  rotate(PI/4);
  ellipse(10,x,150,60);
  x = x + change;

//ellipses moving in; changes to turquoise
  if (x > 200)
  {
    change = change - 1 ;
    stroke(60,233,247);
  }
  
// ellipses changes to neon purple
  if (x < 10)
  {
    x = x + 1;
    stroke(224,43,234);
  } 
}
