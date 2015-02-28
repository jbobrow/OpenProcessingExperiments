
//Parábola com Laços
size(200, 200);
background(0);
for (float a = 1.2; a < 200; a = a+1.7) {
  stroke(255);
  strokeWeight(5);
  point(a*14,a*a);
}
