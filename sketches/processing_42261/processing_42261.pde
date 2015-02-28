
size(300, 300);
smooth();
background(0);
strokeWeight(1);


for (int i=0; i<150; i+=5) {
  stroke(205, 140, 149);
  line(i, 0, i, 300);
}


for (int i=0; i<150; i+=5) {
  stroke(176, 23, 31);
  line(i, 300, 300, i);
}


