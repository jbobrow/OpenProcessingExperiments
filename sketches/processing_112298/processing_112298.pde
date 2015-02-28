
size(500,500);
smooth();
noFill();
 size(500, 500);
background(160, 247, 94, 30);
 
 
for (int x=10; x<=width; x+=10) {
  for (int y=10; y<=width; y+=10) {
    stroke(50, 237, 153);
    strokeWeight(5);
    fill(22, 134, 141, 120);
    rect (x, y, width/2, height/2);
    rotate(3);
  }
}



