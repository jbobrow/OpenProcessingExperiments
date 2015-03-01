
int eSize = 20;

size(400, 400);
colorMode(RGB, 400);
background(0, 0, 0);
noStroke();
smooth();             

for (int y =0; y <=400; y += 10) {
  for (int x = 0; x < 400; x+=10) {
    fill(100, 100, 100, 100);
    ellipse(x, y, eSize, eSize);
    fill(x^200, x^200, x^200, 100);
    ellipse(x, y, eSize, eSize);
  }
}

for (int x = 0; x < 400; x+=10) {
  fill(x, x, 10+x, 5);
  triangle(200, 150, 140, 250, 200, 250);

  arc(200, 250, 100, 200, TWO_PI-PI/2, TWO_PI);
  //arc(x, y, width, height, start, stop)
  //triangle(200,150,200,250,260,250);
}

  for (int y = 0; y <=200; y += 10) {
  for (int x = 0; x < 170; x += 10) {
    stroke(2*x, 2*x, 2*x);
    strokeWeight(2);
    ellipse(x, 360-x, 2, 2);
    //line(0, 300, 170, 200);

    stroke(200, 200, 200);
    line(170, 200, 200, 200);
    curve(200, 300, 200, 201, 250, 200, 240, 200);
  }
}

for (int x = 0; x < 400; x+=10) {
  stroke(400, 400^x, 400^x);
  strokeWeight(6);
  bezier(245, 195, 400, 195, 400, 245, 400, 245);
  stroke(400^x, 400, 400^x);
  bezier(245, 199, 400, 199, 400, 249, 400, 249);
  stroke(400^x, 400^x, 400);
  bezier(245, 203, 400, 203, 400, 253, 400, 253);
}



