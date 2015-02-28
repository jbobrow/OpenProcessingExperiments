
size(400, 400);
background(116, 193, 206);
int x = 0;
noStroke();
for(int i = 11; i <= 255; i += 51) {
  fill(129, 130, 87, i);
  rect(x, 200, 400, 60);
  x += 20;
}
