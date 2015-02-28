
size(300, 300);
background(0);
smooth();

for(int i=0; i<300; i++) {
  float r = random(50);
  stroke(r*10);
  line(0, i, 50+r, i);
  for ( int randompos =5; randompos < 100; randompos+=5) {
      for ( int x = 50; x < 255; x +=10) {
        rotate(radians(i));
        stroke(x, x, x);
        rect(randompos, randompos, 50, 50);
      }
   }
}

