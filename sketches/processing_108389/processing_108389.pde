
size(400,400);
colorMode(HSB,600);
for (int i=0; i<=400; i++){
  for (int m=0; m<=400; m++){
    fill(i*m,i*m,i*m);
  ellipse(i*5, m*5, 5, 5);
}
}
