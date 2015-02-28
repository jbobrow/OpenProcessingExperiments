
size(300, 300);
background(55, 200, 25); // creating grass

for (int y=15;y<=height;y=y+30) {
  fill(240, 230, 250-y*2);
  strokeWeight(y/30);
  ellipse (10+y, y+120, y, 20); //creating eggs and stepping stones
}

for (int x=0;x<=width;x=x+10) {
  strokeWeight(x/45);
  fill(155, 5, 100-x); //coloring fence
  rect(x, 0, x, x+10); //creating fence
}


