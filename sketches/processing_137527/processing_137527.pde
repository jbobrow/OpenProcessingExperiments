
// Math 2: Curves
// Exercises

size(500,500);
background(255);

for (int x = 0; x <= 500; x++) {
  float n = norm(x, 0.0, 500.0);
  float y = pow(1-n,4);
  y *= 500;
  point(x,1);
}

for (int x = 0; x <= 500; x += 2) {
  float n = norm(x, 0.0, 500.0);
  float y = pow(n,8);
  y *= 500;
  rectMode(CENTER);
  stroke(255,50);
  fill(210,124,193,1);
  rect(x,y,100,100);
  fill(77,185,189,1);
  ellipse(x,y,200,200);
  fill(77,185,189,1);
  ellipse(x,y,400,400);
  stroke(77,185,189,50);
  line(0,height,x,y);
  stroke(210,124,193,50);
  line(width*0.5,height*0.5,x,y);
}


