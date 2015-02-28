
float x0, y0, w0, h0, w0PreDrag, h0PreDrag;
float x1, y1, r1;
int mouseOriginX, mouseOriginY;
int dragX, dragY;
PFont fnt;
boolean activated;

void setup() {
  size(600, 400);
  x0 = 200; y0 = 300; w0 = 50; h0 = 30;
  x1 = 300; y1 = 200; r1 = 50; 
  fnt = createFont("Arial",16,true);
  ellipseMode(RADIUS);
  activated = false;
}

void mouseMoved() {
  if (!activated) {
    return;
  }
  x0 = mouseX;
  y0 = mouseY;
  loop();
}

void mouseClicked() {
  activated = !activated;
  loop();
}

void mousePressed() {
  mouseOriginX = mouseX;
  mouseOriginY = mouseY;
  w0PreDrag = w0;
  h0PreDrag = h0;
}

void mouseDragged() {
  w0 = abs(w0PreDrag+mouseX-mouseOriginX);
  h0 = abs(h0PreDrag+mouseY-mouseOriginY);
  activated = true;
  mouseMoved();
}

void draw() {
  background(255);
  if (!activated) {
    textFont(fnt,16);
    fill(128);
    text("Click to activate",10,20);
    for (int x = 0; x < width; x++) {
      color d=color(110*x/width+128, 110*x/width+128, 110*x/width+128);
      set(x, 0, d);  
    }
    for (int y = 0; y < height; y++) {
      color d=color(110*y/height+128, 110*y/height+128, 110*y/height+128);
      set(0, y, d);  
    }
  }

  // Translate so that ellipse is centered at (0, 0)
  float xTranslate = -x0;
  float yTranslate = -y0;
  float c = x1 + xTranslate;
  float d = y1 + yTranslate;

  float x, y;
  if ((c/w0)*(c/w0) + (d/h0)*(d/h0) <= 1.0) {
    // Early out: center of circle is inside of the ellipse
    x = c;
    y = d;
  } else {
    // Swap axes if necessary so that the vertical axis is the ellipse major axis
    float a = w0;
    float b = h0;
    boolean swapAxes = false;
    if (a < b) {
      swapAxes = true;
      float temp = a;
      a = b;
      b = temp;
      temp = c;
      c = d;
      d = temp;
    }

    // Scale so that the horizontal radius of the ellipse is 1
    float scaleDivisor = a;
    b = scaleDivisor/b; // Reciprocal of ellipse vertical radius
    c = 1.0/scaleDivisor*c; // Circle center horizontal coordinate
    d = 1.0/scaleDivisor*d; // Circle center vertical coordinate
    float r = 1.0/scaleDivisor*r1; // Circle radius

    // Change signs of coordinates so that the circle center is on the first quadrant
    boolean flipHorizontal = false;
    if (c < 0) {    
      c = -c;
      flipHorizontal = true;
    }
    boolean flipVertical = false;
    if (d < 0) {
      d = -d;
      flipVertical = true;
    }  

    // Directly calculate the point (x, y) on the ellipse from which a line to the center
    // of the circle is perpendicular to the tangent of the ellipse at (x, y)
    float e = b*b*(b*b)*(c*c);
    float f = b*b*(b*b) - b*b*2 + 1.0;
    float g = e - f + (d*d)*(b*b);
    float h = b*b*c;
    float i = b*b*h - h;
    float j = 72*(f*e)*g + 2*(g*g*g) - 108*e*(i*i) + 108*f*(i*i) + 36*g*(i*i);
    float k = 12*(i*i) + g*g - 12*(f*e);
    float s = j*j - 4*k*k*k;
    float q = pow(j + sqrt(s), 1.0/3.0);
    float m = b*b - 1;
    float n = 1.0/m;
    float o = 1.0/3.0*g/f + pow(2.0, 1.0/3.0)/3.0*(g*g)*(n*n)/q + pow(4.0, 1.0/3.0)/6.0*q*(n*n);
    float s3 = (e - g)*(n*n) + o;
    float p = sqrt(s3);
    float s2 = (2*e - g)*(n*n) - o - ((h + h)*((e - g)*n*(n*n) - 2.0/m))/p;
    x = h/(m + m) - 0.5*p + 0.5*sqrt(s2);
    y = sqrt(1.0 - x*x)/b;
    if (x != x || y != y) {
      textFont(fnt,16);
      fill(0);
      text("Out of floating point precision",10,390);   
    }

    // Reverse flips etc.
    if (flipVertical) {
      y = -y;
    }  
    if (flipHorizontal) {    
      x = -x;
    }
    x *= scaleDivisor;
    y *= scaleDivisor;
    if (swapAxes) {
      float temp = x;
      x = y;
      y = temp;
    }
  }
  x -= xTranslate;
  y -= yTranslate;

  // Display result
  if ((x1-x)*(x1-x) + (y1-y)*(y1-y) < r1*r1) {
    fill(255,0,0);
    noStroke();
    ellipse(x, y, 5, 5);
  }
  noFill();
  stroke(128);
  line(x, y, x1, y1);
  stroke(0);
  ellipse(x0, y0, w0, h0); // Ellipse
  ellipse(x1, y1, r1, r1); // Circle

  noLoop();
}
