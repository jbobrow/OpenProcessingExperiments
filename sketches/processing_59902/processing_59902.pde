
size(600, 600);
smooth();
noFill();
background(240, 240, 250);
stroke(0, 190, 255);
for(int a=0; a<=100; a=a+10) {
  for(int b=0; b<=100; b=b+10) {
    ellipse(a, a, a*b, a*b);
    ellipse(2*b, a, a*b, a*b);
  }
}
strokeWeight(2);
for(int a=0; a<=100; a=a+12) {
  for(int b=0; b<=100; b=b+12) {
    stroke(0, 50+a, 250);
    if(a<50) {line(8*a, 6*b, 8*a+4, 6*b+a/5);
  }
  else {line(8*a, 6*b, 8*a+4, 6*b-a/5);
  }
  }
}
stroke(250, 60, 60);
strokeWeight(1);
for(int e=580; e<=620; e=e+10) {
    line(0, e, e-e/10, e/8);
  }



