
float spacing = 60, elSize = 60, cfactor;
int spots, totalSpots, color1 = 160, color2 = 180;
float theta = 0, elrad = elSize/2;
float pt1 = QUARTER_PI, pt2 = PI + QUARTER_PI, pt3 = HALF_PI + QUARTER_PI, pt4 = TWO_PI - QUARTER_PI;
int dotsize = 36, alph = 240;

void setup() {
  size(500, 500);
  colorMode(HSB);
  rectMode(CENTER);
  spots = int(width/spacing) - 1;
  totalSpots = spots * spots;
  cfactor = 255.0/totalSpots;
  background(0, 0, 0);
  strokeWeight(2);
  noFill();
}

void draw() {
  background(0, 0, 0);
  for (int y = spots ; y > 0; y--) {
    for (int x = spots; x > 0; x--) {
      stroke(0, 0, 255, 42);
      noFill();
      pushMatrix();
      translate(x*spacing, y*spacing);
      rotate(calcrot2(x, y));
      ellipse(0, 0, elSize, elSize);

      stroke(160, 255, 255, alph);
      line(elrad * cos(pt1), elrad * sin(pt1), elrad * cos(pt2), elrad * sin(pt2));
      ellipse(elrad * cos(pt1), elrad * sin(pt1), dotsize, dotsize);
      ellipse(elrad * cos(pt2), elrad * sin(pt2), dotsize, dotsize);

      stroke(210, 255, 255, alph);
      line(elrad * cos(pt3), elrad * sin(pt3), elrad * cos(pt4), elrad * sin(pt4));
      ellipse(elrad * cos(pt3), elrad * sin(pt3), dotsize, dotsize);      
      ellipse(elrad * cos(pt4), elrad * sin(pt4), dotsize, dotsize);

      popMatrix();
    }
  }
  theta+=2;
  if (theta == 360) { 
    theta = 0;
  }
}

float calcrot2(int x, int y) {
  if (x % 2 == 0) {
    if (y % 2 == 0) {
      return(radians(theta-90));
    } 
    else {
      return(radians(-theta));
    }
  } 
  else {
    if (y % 2 == 0) {
      return(radians(-theta));
    } 
    else {
      return(radians(theta-90));
    }
  }
}

