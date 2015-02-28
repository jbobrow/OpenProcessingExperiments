
//Brennda Daniela
size(200, 200);
background(#FCB2F3);
for (int i=35; i<170; i=i+25) {
  fill(i*i/100,30,40);
  noStroke();
  ellipse(i,60,40,40);
}
for(int i=-95; i<150; i=i+10){
stroke(0);
fill(0);
ellipse(i+100, (i*i/190)+145, 9,9);
}
