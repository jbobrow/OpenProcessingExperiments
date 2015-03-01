
float a= 40.0;
float b= 30.2;
if (a>10 || b<50) {
  strokeWeight (20);
  line (40,0, 50, height);
}
else if (a<10 && b>1000) {
  strokeWeight (10);
  ellipse (30, 20, a, b);
}


