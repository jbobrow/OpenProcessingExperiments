
size(500, 500);
smooth();
background(255);

//column circle
fill(5);
for (int y = 0; y < height+45; y +=40) {
  fill(255, 120);
  ellipse(0, y, 40, 40);
}

//row circle
for (int x = 0; x < width+45; x +=40) {
  fill(255, 120);
  ellipse(x, 0, 40, 40);
}

//column small circle
for (int t = 30; t <=height; t +=12) {
  for (int e = 30; e <=width; e +=12) {
    fill(255, 15);
    ellipse(t, e, 12, 12);
  }
}



