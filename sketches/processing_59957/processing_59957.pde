
size(750,400);
background(#7D9EC0);
smooth();
strokeWeight(4);
stroke(#388E8E,10);
for (int i=0; i<=750; i+=10) {
  for (int y=0; y<=400; y+=10) {
    fill(i,y,i,20);
    rectMode(CORNERS);
    rect(i,y,450,y);
}
}

