
size(800,800);
background(0);
stroke(255,60);
for(int i=0; i<height; i++){
  float r= random(10);
  strokeWeight(r);
  float offset = r *.0;
  line(i^4,800, i+offset,i);

}


stroke(0,60);
for(int i=0; i<width; i++){
  float r= random(10);
  strokeWeight(r);
  float offset = r *.0;
  line(i^4,800, i^90,i+200);

}

