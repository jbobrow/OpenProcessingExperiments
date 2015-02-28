
size(500, 500);
smooth();
background(255);



strokeWeight(10);
for (int x =0; x<= width; x+=10) {
  line(x,0,width-x,height);
  float r=map(x,0,width,0,255);
  stroke(r,255,255);
}

for (int x =0; x<= width; x+=10) {
  line(0,x,width,height-x);
  float r=map(x,0,width,0,255);
  stroke(r,255,255);
}


strokeWeight(1);
for (int x =0; x<= width; x+=10) {
  line(x,0,width-x,height);
  float r=map(x,0,width,0,255);
  stroke(255,r,255);
}

for (int x =0; x<= width; x+=10) {
  line(0,x,width,height-x);
  float r=map(x,0,width,0,255);
  stroke(255,r,255);
}


