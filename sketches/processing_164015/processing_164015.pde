
/**
 * Laura Esperanza Vela Bohorquez
 * Codigo: 20142284043
 * Clase: Tecnologia y Cognicion
 */
 
int rectX, rectY;      // Position of square button
int rectSize = 90;     // Diameter of rect
color rectColor, baseColor;
color rectHighlight;
color currentColor;
boolean rectOver = false;

void setup() {
  size(640, 360);
  rectColor = color(255, 255, 255);
  rectHighlight = color(125, 125, 125);
  baseColor = color(102);
  currentColor = baseColor;
  rectX = width/2-rectSize-10;
  rectY = height/2-rectSize/2;
}

void draw() {
  update(mouseX, mouseY);
  background(currentColor);
  
  if (rectOver) {
    fill(rectHighlight);
  } else {
    fill(rectColor);
  }
  stroke(255);
  rect(rectX, rectY, rectSize, rectSize);
}

void update(int x, int y) {
  if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
  } else {
    rectOver = false;
  }
}

void mousePressed() {
  if (rectOver) {
    currentColor = rectColor;
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

