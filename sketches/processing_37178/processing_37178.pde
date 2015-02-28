
//Quiz Part A
size (500, 500);
smooth();
background(255);
strokeWeight(1);
float x;
for (x=320; x>=0; x=x-40) {
  line(x+40, 40, 40, 360-x);
}
