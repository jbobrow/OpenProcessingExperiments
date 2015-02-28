
int diameter = 8;
 
  size(300, 300);
  background(#99CCFF);
  fill(0);
     
  int x = 100;
  int y = 100;
  int d = 100;
  
  x = x + 100;
  y = y + 100;
  d = d + 100;
   
  diameter = diameter * diameter * diameter;
  println(diameter);
   
  
  fill(96,96,96, 128);
  noStroke();
  rectMode(CORNER);
  stroke(0);
  rect(width/-8, height/-8, x, y);
  
  fill (0,0,205, 200);
  noStroke();  
  triangle(0, height*.5, 0, height, width*.5, height);

  
  strokeWeight(50);
  line(0,0,width,height);
  strokeWeight(1);
  
  




