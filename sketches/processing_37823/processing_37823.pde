
size(600, 400);
colorMode(RGB, width);
pushMatrix();
translate(width, height);
rotate(PI);


//sky
for (int x=0; x<width; x++) {
  for (int y=0; y<width; y++) {
    noSmooth();
    stroke(x, 30, y);
    point(x, y);
  }
}

//falling orbs
for (int x=0; x<width; x+=20) {
  for (int y=200; y<height; y+=40) {
    for ( int circsize=1; circsize<15; circsize+=5) {
      smooth();
      fill(width, width, 500, 300);
      strokeWeight(1);
      stroke(width,300);
      ellipse(x,random(y,400), circsize, circsize);
    }
  }
}

//buildings
for (int x=0; x<width; x+=100) {
  fill(0, 0, 0, 400);
  rect(x, 0, 100, random(150, 350));
}






