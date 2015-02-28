
size(600, 600);
smooth();
background(0);


for (int a = 0; a < 100; a=a+10) {
  for (int i = 0; i < 100; i=i+10) {
    for (int z = 3; z<=18; z=z+1) {
      for (int x = 4; x<=width; x=x+20) {
        for (int y = 4; y<=width; y=y+20) {
          stroke(a,i,0);
          point (x, 2+y*4);
        }
      }
      rotate(z);
    }
  }
}


