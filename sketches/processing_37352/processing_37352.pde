
size(300, 300);
smooth();
noFill();
colorMode(HSB, 100);

for (float x=0; x<=width; x+=5) {
  stroke(x, 50, 50);
  strokeWeight(5);
  point(x, x);
}
//a string of points cuts the composition diagonally,
//providing a touch of color

for (float x=0; x<=250; x+=2) {
  //the miniscul spacing between ellipses 
  //creates an illusion
  float y=0;
  strokeWeight(1);
  stroke(width, 50, 50);
  ellipse(width/2, height/2, x, x);
}

stroke(0);
strokeWeight(20);
point(width*7/8, height*1/8);
point(width*1/8, height*7/8);
//the dots balance the composition


