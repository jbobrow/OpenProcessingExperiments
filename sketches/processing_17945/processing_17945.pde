
size(250, 250);
background(#2F0750);
for(int x = 10; x < 400; x += 60) {
  for(int y = 10; y < 250; y += 20){
  smooth();
  noFill();
  strokeWeight(6);
  stroke(#FFFFFF, 40);
    ellipse(y, y, x, x);
  }
}
for(int x = 10; x < 400; x += 60) {
  for(int y = 10; y < 250; y += 20){
  smooth();
  noFill();
  strokeWeight(1.5);
  stroke(#9E7EB9, 200);
    ellipse(y, y, x, x);
  }
}


