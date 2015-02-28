
size(400, 400);
background(0);
smooth();

for(int ellipseSize = 600; ellipseSize > 1; ellipseSize-=20){
  strokeWeight(1);
  stroke(255);
  noFill();
  ellipse(200,200,ellipseSize,ellipseSize);
}
for(int ellipseSize = 600; ellipseSize > 1; ellipseSize-=50){
  strokeWeight(2);
  ellipse(200,200,ellipseSize,ellipseSize);
}
for(int ellipseSize = 600; ellipseSize > 1; ellipseSize-=100){
  strokeWeight(3);
  stroke(255,0,0);
  ellipse(200,200,ellipseSize,ellipseSize);
}

