
size(500,500);
smooth();
background(0);

noFill();
colorMode(HSB,300);

strokeWeight(.5);

for (int i = 0; i <=width; i=i+20) {
  for (int j = 0; j <=height; j=j+20) {
   stroke(i,j,255);
   ellipse(width/2, height/2, i, j);

    }
  }



