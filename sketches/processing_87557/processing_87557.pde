
size(500, 500);
smooth();
strokeWeight(2);

for (int i=0; i < 500; i +=5) {
  line(i, 40, i + 20, 500);
  line(i +1/2, 0, i* 1/2, 500);
}



