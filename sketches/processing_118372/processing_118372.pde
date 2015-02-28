
size(510, 510);
background(255);
stroke(0);
fill(0);
smooth();

for (int x=0; x<=width; x++) { 
  stroke(0, x, 255, 64);
  line(0, 0, x, height);

  stroke(255, x, 0, 64);
  line(0, height, x, 0);
}

for (int i=width/2; i<=width; i++) { 
  stroke(0, i, 255, 64);
  line(0, i, width, 0);
  
  stroke(255, i,0, 64);
  line(0, width,i, 0);
}
for (int n=width/2; n<=width; n++) { 
  stroke(0, n, 255, 64);
  line(0, 0, n, height);
  stroke(255, n,0, 64);
  line(0, 0, height, n);
}


