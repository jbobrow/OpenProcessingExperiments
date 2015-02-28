
size (400, 400);
for(int i = 0; i < 400; i = i + 10){
  for(int j = 0; j < 400; j = j + 10){
    fill(255,0,0);
    triangle(j, i, 200, 200, i, j);
  }
}
