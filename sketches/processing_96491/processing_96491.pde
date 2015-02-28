
size(200, 200);
background(255);
strokeWeight(3);
line(20, 10, 80, 10);

for (int x=10; x<100; x=x+15) {
  line(20, x*3, 80, x*2);
}
