
size(200,200);
background(255);
strokeWeight(5);

line (20,10,100,10);

for (int i=10; i<100; i=i+15) {
  line(20, i*4, 100, i*2);
}
