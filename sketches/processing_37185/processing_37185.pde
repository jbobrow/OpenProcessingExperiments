
size(400, 400);
background(255);
line (300, 10, 10, 10);
line(10, 300, 10, 10);
for (int i=1; i<5; i=i+1) {
  float rw = i;
  float rh = 300/rw;
  
  line (10, 300, 300/rw, 10);
}
