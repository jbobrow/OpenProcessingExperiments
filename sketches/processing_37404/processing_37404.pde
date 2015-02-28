
size (300, 300);
background(28, 84, 173);

for (float x=50; x<=270; x+=10) {//keep everything between 50 and 270
  stroke(61, 144, 7);
  strokeWeight(2);
  line(x, x, 170, x);//all figures start from the same point
  noStroke();
  fill(234, 117, 21);
  ellipse(x, x, 10, 10);
  println(x);
}


