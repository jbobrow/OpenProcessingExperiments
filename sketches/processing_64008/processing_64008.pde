
// initilize the square coordinates and colors
int[] x = new int[50];
int[] y = new int[x.length];
int[] col = new int[x.length];

// initialize the circle coordinates, size, and speed
int bX,bY;
int bSize;
int bXSpeed, bYSpeed;

// initialize the background color
color bgCol = color(0,0,0);

void setup() {
  size(400,400);
  
  // set the stroke to white and 3-pixels thick
  stroke(255);
  strokeWeight(3);
  
  // change the color mode to HSB
  colorMode(HSB,360,100,100,100);
  
  // set the x, y, and colors for you background squares
  for(int i=0;i<x.length;i++) {
    x[i] = int(random(width));
    y[i] = int(random(height));
    col[i] = int(random(360));
  }
  
  // set the ball coordinates, size and speed
  bX = int(random(width));
  bY = int(random(height));
  bSize = 60;
  bXSpeed = int(random(-3,3)); if (bXSpeed < 0) { bXSpeed -= 2; } else { bXSpeed += 2; }
  bYSpeed = int(random(-3,3)); if (bYSpeed < 0) { bYSpeed -= 2; } else { bYSpeed += 2; }

  smooth();
  frameRate(30);
  
  noCursor();
}

void draw() {
  background(bgCol);
  
  // draw your background squares
  for(int i=0;i<x.length;i++) {
    fill(col[i],75,100);
    rect(x[i],y[i],30,30);
  }
  
  // draw the ball
  fill(norm(abs(width/2 - bX),0,360)*360,75,100,80);
  ellipse(bX,bY,bSize,bSize);
  // draw duplicates for edge overlap
  ellipse(bX+width,bY,bSize,bSize);
  ellipse(bX-width,bY,bSize,bSize);
  ellipse(bX,bY+height,bSize,bSize);
  ellipse(bX,bY-height,bSize,bSize);
  // move the ball
  bX += bXSpeed;
  bY += bYSpeed;
  // ball wraparound
  if (bX < 0)       bX = bX + width;
  if (bX > width)   bX = bX - width;
  if (bY < 0)       bY = bY + height;
  if (bY > height)  bY = bY - height;
  
  if ((frameCount % 50) == 0) {
    // change the colors for you background squares
    for(int i=0;i<x.length;i++) {
      x[i] = int(random(width));
      y[i] = int(random(height));
      col[i] = int(random(360));
    }
  }
  if ((frameCount % 100) == 0) {
    bXSpeed = int(random(-3,3)); if (bXSpeed < 0) { bXSpeed -= 3; } else { bXSpeed += 3; }
    bYSpeed = int(random(-3,3)); if (bYSpeed < 0) { bYSpeed -= 3; } else { bYSpeed += 3; }
  }
  if ((frameCount % 150) == 0) {
    // change the background color
    bgCol = color(int(random(360)),75,100);
  }
}

void mousePressed() {
  bX = int(random(width));
  bY = int(random(height));
}

