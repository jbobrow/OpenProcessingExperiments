
/*
http://xkcd.com/688/
*/

void setup() {
  size(260, 200);
  background(255);
  stroke(0);
  strokeWeight(2);
  smooth();
  ellipseMode(CENTER);

  // Fun! Your sans font may be different from mine,
  // giving you slightly different amounts of black.
  textFont(createFont("sans", 10));
  textAlign(LEFT, CENTER);
  textLeading(10);
}

float f = 0; // f = the fraction of the image that's black
float fAngle = 145; // fAngle = the angle of the pie slice
float pieSize = 150;
PVector pieLoc = new PVector(160, 100);

void draw() {
  background(255);
  
  noFill();
  stroke(0);
  rect(10, 10, width-20, height-20); // the frame border
  ellipse(pieLoc.x, pieLoc.y, pieSize, pieSize); // the pie border
  
  // the "black" pie slice
  fill(0);
  arc(pieLoc.x, pieLoc.y, pieSize, pieSize, 
      radians(fAngle)-(f*PI), 
      radians(fAngle)+(f*PI));
  
  // graph labels
  text("FRACTION OF\nTHIS IMAGE\nWHICH IS WHITE", 20, 30);
  text("FRACTION OF\nTHIS IMAGE\nWHICH IS BLACK", 20, height-40);
  
  // lines from the text to the pie slices
  line(94, 31, 110, 31);
  line(110, 31, 124, 50);
  line(85, 160, 95, 160);
  line(95, 160, 114, 142);
  stroke(255);
  line(105, 151, 114, 142);
  
  // recalculate the fraction: THE MAGIC IS RIGHT HERE
  f = fraction();
}

// Watch it re-adjust:
void mouseClicked() {
  f = 0;
}

float fraction() {
  float sum = 0;
  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    // 255 - the brightness of this pixel: 
    // because we want the black amount, not the white
    sum += 255-brightness(pixels[i]);
  }
  
  // Divide by pixels.length to average it, and by 255 to scale it to (0..1).
  return sum / (255 * pixels.length);
}

