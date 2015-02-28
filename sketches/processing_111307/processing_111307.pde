
size(500,500);
smooth();
background(0);

noFill();
strokeWeight(.5);
stroke(255,50);
for (int i = 0; i <=width; i=i+50) {
  for (int j = 0; j <=height; j=j+5) {
   ellipse(i,j,500,500);
  }
}


