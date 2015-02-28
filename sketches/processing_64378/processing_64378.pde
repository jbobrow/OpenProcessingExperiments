
size(360, 100);
translate(0,height/2);
for(int i=0; i<width; i++) {
  point(i,sin(radians(i)) * (height/4));
}
