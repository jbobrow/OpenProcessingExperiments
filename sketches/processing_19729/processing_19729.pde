
size(250,250);
smooth();
background(#cbaaa1);

//bubble boxes (outer to inner)
float x=0,y=0,x1=0,y1=0;
for(int a=0; a<7000; a++){
  stroke(255);
  x=random(0,250);
  y=random(0,250);
  point(x,y);
}

for(int a=0; a<5000; a++){
  stroke(255);
  x=random(50,240);
  y=random(50,240);
  point(x,y);
}

for(int a=0; a<2000; a++){
  stroke(255);
  x=random(120,200);
  y=random(120,200);
  point(x,y);
}

for(int a=0; a<2000; a++){
  stroke(255);
  x=random(160,190);
  y=random(160,190);
  point(x,y);
  
}

// grainy??

