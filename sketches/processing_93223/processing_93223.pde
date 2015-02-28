
size(200,200);
int i;
for(i=0; i<200; i+=15){
line(0, 0, i+200,i*2);
}
noStroke();
colorMode(RGB, 100);
for (int x = 0; x < 200; x++) {
  for (int j = 0; j < 200; j++) {
    stroke(x, j, 0);
    point(x, j);
  }
}
