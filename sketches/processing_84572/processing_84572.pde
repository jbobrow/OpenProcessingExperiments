
background(0);

for (int x=0; x<100; x++) {
  float n = norm (x, 0.0, 100.0);
  float y = (1- pow(n, 2));
  y*=100;

  fill(255, x+y);
  rectMode(CENTER);
  rect (x, y, x/4, y/4); 
  rect (width-x, height-y, x/4, y/4);
  rect (0, 0, x/4, y/4);
  
  rect (x, 0, x/4, y/4);
  rect (0, y, x/4, y/4);
  
  rect (0, height-y, x/4, y/4);
  rect (width-x, 0, x/4, y/4);
  
  rect (x, height-y, x/4, y/4);
  rect (width-x, y, x/4, y/4);
}
