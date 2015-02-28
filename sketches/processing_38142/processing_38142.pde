
size(300, 300);
//rewrite of blurry feather, making a ghostly triangular imprint
translate(width/2,height/2);
smooth();
noStroke();
background(16, 39, 106);
for (int x =0; x<=width;x+=5) {
 rectMode(CORNERS);
  fill(70, 154, 58, 20);
  rect(-x/2, -x/2, x, x);
  pushMatrix();
  rotate(PI/4);
  ellipseMode(CORNERS);
  fill(95, 35, 180, 30);
  ellipse(-x/2, -x/2, x, x);
  popMatrix();
}


