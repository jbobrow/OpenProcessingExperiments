

noStroke();
colorMode(RGB, 100);
for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 100; j++) {
    stroke(i, j, 0);
    point(i, j);
  }
}

//ellipse(56, 46, 55, 55);

int x,y;
x=30; y=50;
noStroke();
colorMode(HSB, 100);
for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 100; j++) {
    if ( (i-x)*(i-x)+(j-y)*(j-y)<2500) {
      stroke(i, j, 100);
      point(i, j);
    }
  }
}
                
