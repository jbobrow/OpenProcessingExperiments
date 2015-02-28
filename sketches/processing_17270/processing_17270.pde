
size(300, 300);
background(142,175,175);

strokeWeight(3);
stroke(50, 20, 40);
for (int x = -10; x < 300; x += 10) {
  smooth();
  line(x, 0, x+15, 300);
}
strokeWeight(4);
stroke (180,200,30);
for(int x = - 18; x < 300; x += 10) {
  line (x, 0, x+30, 300);
}
