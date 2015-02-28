
void setup ()
{
  int mysize = 25;
  float mynextsize = 500;
  size(500,500);
  println(width);
  background(255);
  
  stroke(0);
  strokeWeight(1);
  line(0,0,mynextsize,mynextsize);
  line(0,mynextsize,mynextsize,0);
  
  fill(255,0,0);
  rect(220, 220, 60, 60);
  
  smooth();
  fill(255);
  ellipse(250, 250, 40, 40);
  
  smooth();
  noFill();
  bezier(0,0,mynextsize,0,0,mynextsize,mynextsize,mynextsize);
  
  smooth();
  fill(255,255,0);
  ellipse(100, 100, 100, 100);
  
  smooth();
  fill(0);
  ellipse(80, 90, mysize, mysize);
  
  smooth();
  fill(0);
  ellipse(120, 90, mysize, mysize);
  
  smooth();
  strokeWeight(4); 
  noFill();
  bezier(70, 120,  90, 140,  110, 140,  130, 120);
}

void draw ()
{
  //Do not put anything here yet
}

