
size(200, 200);
background(255);
for(int i=1; i<65; i=i+12) {
  if(i>45) {
    stroke(190, 10, 0);
  }
  else {
    stroke(0);
    }
    line(20, i*4,80, i*3);
}
