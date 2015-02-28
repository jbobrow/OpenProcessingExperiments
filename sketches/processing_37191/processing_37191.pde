
 size (700, 200);
background(255);

for (int i=1; i<70; i=i+1) {
  float rw = i*10;
  float t = random(50,70);
  float rh = t+random(1,10); 

  ellipse (rw, rh, 5, 5);
}

