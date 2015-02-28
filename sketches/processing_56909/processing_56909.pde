
size(400,400);
background(40,200,50);
int diam=10;
noFill();
stroke(0);
while (diam<width) {
  ellipse(width/2, height/2, diam, diam);
  diam+=5;
}

