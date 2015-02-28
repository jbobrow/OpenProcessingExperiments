
float warp1y = 0;
float warp2y = 0;
float weft1x = 0;
float weft2x = 0;

void setup() {
  size(800, 800);
  frameRate(40);
  background(155);
}

void draw() {


  //warp1 

  fill(255);
  noStroke();
  fill (45, 149, 44);
  ellipse(width/3, warp1y, 60, 60);
  if (warp1y < height/3 ) {
    warp1y= warp1y+5;
  }
  else if (warp1y < (2 * height/3)) {
    warp1y = warp1y+15;
  }
  else {
    warp1y = warp1y+ 5;
  }
  //println(y);

  //Warp 2

  fill(255);
  noStroke();
  fill (45, 149, 44);
  ellipse(2 * width/3, warp2y, 60, 60);
  if (warp2y < height/3 ) {
    warp2y= warp2y+15;
  }
  else if (warp2y < (2 * height/3)) {
    warp2y = warp2y+1;
  }
  else {
    warp2y = warp2y+ 5;
  }

  //Weft 1

  noStroke();
  fill (255);
  ellipse(weft1x, height/3, 60, 60);
  if (weft1x < width/3 ) {
    weft1x= weft1x +15;
  }
  else if (weft1x < (2 * width/3)) {
    weft1x = weft1x + 5;
  }
  else {
    weft1x = weft1x+ 15;
  }

  //Weft 2  

  noStroke();
  fill (255);
  ellipse(weft2x, 2* height/3, 60, 60);
  if (weft2x < width/3 ) {
    weft2x= weft2x +2;
  }
  else if (weft2x < (2 * width/3)) {
    weft2x = weft2x + 10;
  }
  else {
    weft2x = weft2x+ 5;
  }
}



