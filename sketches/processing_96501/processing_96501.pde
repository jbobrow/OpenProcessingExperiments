
size(200, 200);
background(255);
strokeWeight(3);
line(20, 10, 70, 10);
for (int x=10; x<100; x=x+15) {
  stroke(102,205,170);
  if(x<60) {
    stroke(0);
  }
  line(20, x*3, 70, x*2);
}
