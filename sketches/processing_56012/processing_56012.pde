
size(480, 480);
smooth();
strokeWeight(2);
for (int i=20; i<400; i+=60) {
  line(i, 0, i+40, 100);
 line(i, 200, i+40, 100);
 line(i+40, 300, i, 200);
 line(i, 400, i+40, 300);
 line(i+40, 500, i, 400);
}


