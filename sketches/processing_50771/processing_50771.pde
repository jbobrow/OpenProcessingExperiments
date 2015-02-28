
size(600,600);
background(0);
smooth();




stroke(94, 219, 157);
strokeWeight(3);
for (float x= 2; x < width; x*=1.05) {
  for (float y=2; y< height; y+=30) {
point(y,x);
  }
}


stroke(28, 56, 235, 95);
strokeWeight(4);
for (float x=4; x < width; x = x*1.15) {
  for (float y=2; y< height; y *=1.15) {
point(x, y);
  }
}

stroke(249, 23, 146, 95);
strokeWeight(6);
for (float x= 2; x < width; x*=1.15) {
  for (float y=20; y< height; y +=20) {
point(y,x);
  }
}





