
background(242, 7, 51);
size(800, 800);
for (int i = 0; i < 640; i+=1) {
  for (int j = 0; j < 640; j+=2) {
    color c = color((i^j) * 0.25);
    set(80+i, 80+j, c);
  }
}


