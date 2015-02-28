
size(600, 600);
background(#CBCBCB);

//noStroke();
stroke(#FFFFFF);
fill(#6FFF29,20);

for (int i = 0; i < (width-40); i = i+20) {
  ellipse(width/2,height/2, i, height-40);
}

fill(#29AFFF,10);
for (int i = 0; i < (width-40); i = i+20) {
  ellipse(width/2,height/2, width-40, i);
}





