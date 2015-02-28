
float x1, x2, x3, x4, y1, y2, y3, y4;
int tolerance = 600;
float speed = .005;
int count = 0;
float xoff = .004; 


void setup() {
  size(600, 600);
  noFill();
  background(100);
}

void draw() {

//  first pass through this makes background, then turns off.
  if (count < 1) {
    bg();
    count++;
  }

// this prints associated beziers on top of background gradient
  fill(0,51,0,0); 
  strokeWeight(1);
  stroke(0, 50);
  x2 = map(noise(speed*frameCount), 0, 1, -tolerance, width+tolerance);
  x1 = map(noise(speed*frameCount+5), 0, 1, -tolerance, width+tolerance);
  x4 = map(noise(speed*frameCount+10), 0, 1, -tolerance, width+tolerance);
  x3 = map(noise(speed*frameCount+15), 0, 1, -tolerance, width+tolerance);
  y2 = map(noise(speed*frameCount+20), 0, 1, -tolerance, height+tolerance);
  y1 = map(noise(speed*frameCount+25), 0, 1, -tolerance, height+tolerance);
  y4 = map(noise(speed*frameCount+30), 0, 1, -tolerance, height+tolerance);
  y3 = map(noise(speed*frameCount+35), 0, 1, -tolerance, height+tolerance);
  bezier(x1, y1, x2, y2, x3, y3, x4, y4);

  stroke(153, 51, 255, 30);
  x1 = map(noise(speed*frameCount), 0, 1, -tolerance, width+tolerance);
  x2 = map(noise(speed*frameCount+5), 0, 1, -tolerance, width+tolerance);
  x3 = map(noise(speed*frameCount+10), 0, 1, -tolerance, width+tolerance);
  x4 = map(noise(speed*frameCount+15), 0, 1, -tolerance, width+tolerance);
  y1 = map(noise(speed*frameCount+20), 0, 1, -tolerance, height+tolerance);
  y2 = map(noise(speed*frameCount+25), 0, 1, -tolerance, height+tolerance);
  y3 = map(noise(speed*frameCount+30), 0, 1, -tolerance, height+tolerance);
  y4 = map(noise(speed*frameCount+35), 0, 1, -tolerance, height+tolerance);
  bezier(x1, y1, x2, y2, x3, y3, x4, y4);
}

void bg() {
  noStroke();
  for (int i = 0; i<width; i+=5) {
    for (int j = 0; j<height; j+=5) {
//      fill(240+map(noise(.01), 0, 1, 0, 10), map(noise(xoff*i, xoff*j), 0, 1, 200, 255), 245);
      fill(map(noise(xoff*i, xoff*j), 0, 1, 220, 255));
      rect (i, j, 5, 5);
    }
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
      noLoop();
  } else if (mouseButton == RIGHT) {
    noiseSeed(frameCount);
    loop();
    bg();
    draw();
  }
}


