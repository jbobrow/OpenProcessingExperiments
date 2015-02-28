
//copyright Joanne Lo jylo 2014
  
  //variable declaration
float x,y;
float wd,ht;
float xDist,yDist;
float easingCoef;

void setup()
{
  size(400,400);
  noCursor();
}

void draw ()
{
  //background(0);
  fill(255,0,0);
  
  x=mouseX;
  y=mouseY;
  wd=width-mouseX;
  ht=height-mouseY;
  

  
  fill(200,0,0);
  ellipse(x,y,0.8*wd,0.8*ht);
  
  for (int i = 0; i < 100; i++) {
  float r = random(-50, 50);
  println(r);
}
  
}


