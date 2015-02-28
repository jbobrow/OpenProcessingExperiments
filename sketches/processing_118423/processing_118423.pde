
size(510,510);
background(10);

for(int x = 0; x <= width; x += 4) {
  for(int y = 0; y <= height; y += 4) {
    stroke(255*2-y,255*2-y,255*2-y);
    line(0,y, y,y);
    stroke(x,x,x);
    line(x,x, width,x);
}
}

for(int i = 0; i <= width; i += 6) {
  stroke(255);
  
  line(i,height, 0,i);
  line(i,0, width,i);
}


