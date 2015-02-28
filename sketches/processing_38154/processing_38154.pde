

   size(700,700); 
   background(68);

for(int i=0; i<700; i++) {
  float r = random(700);
  stroke(r*1);
  line(0, i, 100+r, i);
 }


