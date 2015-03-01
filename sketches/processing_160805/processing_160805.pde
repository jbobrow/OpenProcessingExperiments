
size(300,300);

for (int x = 0; x < 300; x++) {
  float n = norm(x,0.0,300.0);
  float y = 1 - pow(n,4);
  y *= 300;
  point(x,y);
}
  
  
  
  



