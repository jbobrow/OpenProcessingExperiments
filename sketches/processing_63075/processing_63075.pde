


size(600, 600);

smooth();
noFill();


for (int i=0; i<600; i=i+20) {
  for (int j=0; j<600; j=j+30) {
    stroke(0, 174, 188, 25);
    ellipse(width/3, height/3, i, j);
    stroke(0, 3, 155, 25);
    ellipse(400, 400, i, j);
    stroke(0, 174, 188, 25);
    ellipse(400, 200, i, j);
    stroke(0, 3, 155, 25);
    ellipse(200, 400, i, j);
  }
}



