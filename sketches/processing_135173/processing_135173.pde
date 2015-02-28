
float x, y;
float d;
color rosso = color(255, 0, 0);
color blu   = color(0, 0, 255);


// ///////////////////////////////////////////////////////////// SETUP
void setup() {
  size(400, 400);
  frameRate(30);
  smooth();
  d = 0.0;
  
}



// ////////////////////////////////////////////////////////////// DRAW
void draw() {
  background(d);
  disegnaMirino(rosso, width/2, height/2);
  disegnaMirino(blu, mouseX, mouseY);

  
}

// ///////////////////////////////////////////////////////////////////
void mouseMoved() {
  x = limitaCoordinata(mouseX);
  y = limitaCoordinata(mouseY);
  d = valutaDistanza(width/2, height/2, mouseX, mouseY);
  //println(x + " - " + y + " - " + d);
}


// /////////////////////////////////////////////////// FUNZIONI CUSTOM
float limitaCoordinata(float a) {
  if (a > width) 
    a = width;
  else if (a < 0)
    a = 0;
  return a;
} 


float valutaDistanza(int x1, int y1, int x2, int y2) {
  float dist = sqrt(( x2 - x1)*(x2 - x1) + (y2- y1)*(y2 - y1) );
  return mappaDistanza(dist);
}


float mappaDistanza(float d) {
  return map(d, 0, 283, 0, 255);
}

void disegnaMirino(color c, float pointX, float pointY) {
  
  pushMatrix();
  translate(pointX, pointY);
  
  strokeWeight(7);
  stroke(c);
  noFill();
  ellipse(0, 0, 50, 50);
  
  pushMatrix();
  rotate(radians(45));
  strokeWeight(5);
  line(0, 15, 0, 35);
  line(0, -15, 0, -35);
  line(15, 0, 35, 0);
  line(-15, 0, -35, 0);
  popMatrix();
  popMatrix();
}
