
size (500, 500);
background(47,50,89);
noStroke();

for (int i=0; i<width; i=i+90){
  for (int j = 0; j < height; j = j+90) {
  fill(176,1,41);
  ellipse(i, j, 80, 80);}}

for (int i=0; i<width; i=i+90){
  for (int j = 0; j < height; j = j+90) {
  fill(46,76,70);
  ellipse(i, j, 50, 50);
  
  fill(88,42,31);
  ellipse(j, i, 20, 20);
  
   fill(187,148,107);
  ellipse(j, i, 10, 10);
}
}

for (int i=0; i<550; i=i+60){

  fill(221,121,6);
  ellipse(i, i, 20, 20);
  
}





