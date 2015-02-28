
size(300, 300);
smooth();
noStroke();
background(16, 39, 106);
for (int x =0; x<=width;x+=5) {
  //with 5 interval, the blur effect remains, but the creating shapes aren't overly distinct
  fill(70, 154, 58, 10);
  ellipse(x/2, x/2, x, x); //Creates series of concentric circles from top left
  rectMode(CORNERS);
  fill(95, 35, 180, 30);//Since the circle is larger, I made the square more opaque
  rect(x/2, x/2, x, x);
}


