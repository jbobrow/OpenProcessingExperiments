
// star attributes
PVector[] points;
int n;
float rad;
int[] skips;

// color attributes
float strokeHue, strokeSaturation, strokeBrightness, strokeAlpha;
float fillHue, fillSaturation, fillBrightness, fillAlpha;
float strokeWt;
boolean colored = false;

void setup()
{
  size(640, 640, JAVA2D);
  smooth();
  noLoop();
  colorMode(HSB);
  refresh();
}

void keyPressed() {
  if (key==' ') refresh();
  if (key=='c') {
    colored = !colored;
    redraw();
  }
}

void mousePressed() {
  if (mouseX < 44 && mouseY < 19) refresh();
  if (mouseX < 44 && mouseY > 19 && mouseY < 40) { 
    colored = !colored;
    redraw(); 
  }
}

void refresh()
{
  n = (int) random(8, 24);        // sets number of points on the star

  // randomizes number of skips to make in drawing each segment 
  do {
    skips = new int[] { 
      (int) random(1, n), (int) random(1, n), (int) random(1, n)
    };
  } 
  while ( n % skips[2] == 0);

  // star's radius
  rad = random(width/3, width/2-50);

  // initialize the stars points
  points = new PVector[n];
  for (int i = 0; i < n; i++) {
    float ang = lerp(0, TWO_PI, (float) i/n);
    points[i] = new PVector( rad * cos(ang), rad * sin(ang) );
  }

  // initialize stroke and fill colors, and stroke weight
  strokeHue = random(255);
  strokeSaturation = random(150, 255);
  strokeBrightness = random(150, 250);
  strokeAlpha = random(120, 220);
  
  fillHue = (strokeHue + 128) % 255;    // pick complementary hue
  fillSaturation = random(150, 255);
  fillBrightness = random(150, 250);
  fillAlpha = random(10, 40);
  
  strokeWt = random(0.7, 2);

  redraw();
}

void draw()
{
  background(255);   
  fill(0);
  text("new one", 5, 16);
  text("toggle color", 5, 32);

  translate(width/2, height/2);
  
  // set color
  strokeWeight(strokeWt);
  if (colored) {
    stroke(strokeHue, strokeSaturation, strokeBrightness, strokeAlpha);
    fill(fillHue, fillSaturation, fillBrightness, fillAlpha);
  } else {
    stroke(strokeHue, strokeSaturation, 0, strokeAlpha);
    fill(fillHue, fillSaturation, 0, fillAlpha);
  }

  int idx1 = 0;
  do {
    int idx2 = (idx1 + skips[0]) % n;
    int idx3 = (idx1 + skips[1]) % n;
    int idx4 = (idx1 + skips[2]) % n;
    
    beginShape();
      curveVertex(points[idx1].x, points[idx1].y);
      curveVertex(points[idx2].x, points[idx2].y);
      curveVertex(points[idx3].x, points[idx3].y);
      curveVertex(points[idx4].x, points[idx4].y);
    endShape(CLOSE);
  
    bezier( points[idx1].x, points[idx1].y, 
            points[idx2].x, points[idx2].y, 
            points[idx3].x, points[idx3].y, 
            points[idx4].x, points[idx4].y );


    idx1 = idx3;
  } 
  while (idx1 != 0); 
}

