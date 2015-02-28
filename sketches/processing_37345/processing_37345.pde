
size(300,300);
background(0);

for(int x=-300; x<width; x+=30){
  noFill();
  stroke(255);
  arc(x, x, 600, 600, 0, PI/2);
  strokeWeight(2);
  fill(255,0,0);
  ellipse(x+17, x+17, 42, 42);
  smooth();
}

