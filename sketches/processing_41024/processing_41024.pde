

size (400,400);
background(150);
smooth();
 
for(int x=0; x<=400; x+=10) {
  line(x,0,400,x);
  line(0,x,x,400);
  fill(255,0,0);
  ellipse(x,x,10,10);
}

