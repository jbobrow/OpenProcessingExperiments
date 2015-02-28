
size(400, 400);
background(255);
smooth();
int s = 40;

for (int x = 0; x <= 8; x++){
  line(s+(x*s), s, s, s+((8-x)*s));
}
