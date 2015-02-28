
size(500,500);
smooth();
background(0);

noFill();
noStroke();
colorMode(HSB,500);

for (int i = 0; i <=width; i=i+10) {
  for (int j = 0; j <=height; j=j+20) {
   stroke(i,j,100);
   rect(0, 0, i, j);
   rect(i,j, 15,10);

    }
  }



