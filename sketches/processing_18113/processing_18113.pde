

size(250,250);

int a = 5;
int b = 10;

for (int i=0; i<500; i += 15){
  smooth();
  strokeWeight(2);
  stroke(5);
  fill(255,0,0,10);
  ellipse(125,125,a+i,b+i);
  }

