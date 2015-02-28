
size(250, 250);
background(#2E2822);
noStroke();

smooth();
noFill();
stroke(#61A88B);
for (int i=-20; i<180; i+=40){
  for  (int j=120; j>30; j-=10){
  ellipse(i,i,j,j);
}
}
noFill();
stroke(#8ED052);
for (int i=-70; i<120; i+=40){
  for  (int j=100; j>30; j-=10){
  ellipse(i+70,i,j,j);
}
}
noFill();
stroke(#FFDB64);
for (int i=30; i<210; i+=40){
  for  (int j=100; j>30; j-=10){
  ellipse(i-70,i,j,j);
}
}
noFill();
stroke(#F28B52);
for (int i=80; i<500; i+=40){
  for  (int j=100; j>30; j-=10){
  ellipse(i-140,i,j,j);
}
}


