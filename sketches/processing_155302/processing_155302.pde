
/*
**  click canvas to toggle between animated and 'mouse'-mode
*/
float rectSize = 40;  
float counter = 0; 
boolean animated = true;  

void setup() {
  size(400, 400); 
  background(255); 
  smooth();
}

void draw() {

  fill(255, 15); 
  rect(0, 0, width, height);  

  float cellNum = 0;     
  for (float x = rectSize/2; x < width; x += rectSize) {
    for (float y = rectSize/2; y < height; y += rectSize) {      
      drawRect(x, y, cellNum);
      cellNum++;
    }
  }
  counter++;
}

void drawRect(float _mx, float _my, float _cnum) {
  float mx = _mx; 
  float my = _my; 
  float ax1, ay1, ax2, ay2, cx1, cy1; 
  float factor;  

  factor = sin(radians(counter + _cnum));  
  strokeWeight(2);
  stroke(0);
  noFill();    

  beginShape();
  ax1 = mx - rectSize/2; 
  ay1 = my - rectSize/2;
  ax2 = mx + rectSize/2; 
  ay2 = my - rectSize/2;
  cx1 = mx; 
  if (animated) {
    cy1 = map(factor, -1, 1, my, my - rectSize);
  } else {
    cy1 = map(mouseY, 0, height, my, my - rectSize);
  }  
  vertex(ax1, ay1); 
  bezierVertex(cx1, cy1, cx1, cy1, ax2, ay2);
  ax2 = mx + rectSize/2; 
  ay2 = my + rectSize/2;
  if (animated) {
    cx1 = map(factor, -1, 1, mx, mx + rectSize);
  } else {
    cx1 = map(mouseX, 0, width, mx, mx + rectSize);
  }  
  cy1 = my; 
  bezierVertex(cx1, cy1, cx1, cy1, ax2, ay2);
  ax2 = mx - rectSize/2; 
  ay2 = my + rectSize/2; 
  cx1 = mx; 
  if (animated) {
    cy1 = map(factor, -1, 1, my, my + rectSize);
  } else {
    cy1 = map(mouseY, 0, height, my, my + rectSize);
  } 
  bezierVertex(cx1, cy1, cx1, cy1, ax2, ay2);
  ax2 = mx - rectSize/2; 
  ay2 = my - rectSize/2; 
  if (animated) {
    cx1 = map(factor, -1, 1, mx, mx - rectSize);
  } else {
    cx1 = map(mouseX, 0, width, mx, mx - rectSize);
  }  
  cy1 = my; 
  bezierVertex(cx1, cy1, cx1, cy1, ax2, ay2);
  endShape();
}

void mouseReleased() {
  animated = !animated;
}



