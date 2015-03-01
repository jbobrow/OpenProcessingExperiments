
size(200, 200);

background(134, 216, 219);

stroke(255, 0, 0);
strokeWeight(3);
for (int i = 20; i < 150; i +=10) {
  line(i, 20, 1, 180);
}
stroke(95, 95, 227);
strokeWeight(3);
for (int i = 20; i < 150; i +=10) {
  line(i, 20, i, 180);
}
stroke(226, 51, 237);
strokeWeight(3);
for (int i = 20; i < 90; i +=5) {
  line (20, i, 80, i+15);
}


