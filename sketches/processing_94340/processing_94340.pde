

background(0);
size(1001, 1001);
stroke(175);
smooth();
noFill();

for ( int a=0; a<1100; a+=100) {
    ellipse(a, 0, 200, 200);
  ellipse(a, 100, 200, 200);
  ellipse(a, 200, 200, 200);
  ellipse(a, 300, 200, 200);
  ellipse(a, 400, 200, 200);
  ellipse(a, 500, 200, 200);
  ellipse(a, 600, 200, 200);
  ellipse(a, 700, 200, 200);
  ellipse(a, 800, 200, 200);
  ellipse(a, 900, 200, 200);
  ellipse(a, 1000, 200, 200);


}

for (int b=0; b<1100;b+=100){
line (b,0, b,1001);  
  line (0,b,1001,b);
}

