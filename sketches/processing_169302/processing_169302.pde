
//A present to the Learn To Code With Us, Culver City (Original Flavor)
//from Learn To Code With Us, Pasadena (Minty Fresh)
//have fun refactoring, it is a scary mess! 

//Carlyn Maw
//2014/10/28
//https://creativecommons.org/about/cc0

//eyes drawn with triangle from
//https://www.processing.org/examples/regularpolygon.html


void setup() {
  size(400, 400);
}

void draw() {
  int bkg = random(0,30);
  int y_r = random(240,255);
  int y_g = random(216,230);
  int y_b = random(62,162);
  color pumpkin = color(250, 162, 62);
  color stem = color(105, 117, 84);
  
  background(bkg);
  noStroke();
  
  //pumpkin
  fill(pumpkin);
  ellipseMode(CENTER);
  ellipse(200, 220, 360, 320);
  
  //eyes
  fill(y_r, y_g, y_b);
  pushMatrix();
  translate(width*0.70, height*0.5);
  rotate(0.523598776);
  polygon(0, 0, width*0.15, 3); 
  popMatrix();

  pushMatrix();
  translate(width*0.30, height*0.5);
  rotate(0.523598776);
  polygon(0, 0, width*0.15, 3); 
  popMatrix();
  
  //mouth
  arc(width*0.50, height*0.68, width*0.60, width*0.25, 0, PI, TWO_PI, OPEN);

  //tooth  
  fill(pumpkin);
  rect(width*0.60, height*0.68, width*0.08, width*0.07);  
  
  //stem
  fill(stem);
  beginShape();
  vertex(width*0.40, 40);
  vertex(width*0.60, 20);
  vertex(width*0.60, height*0.25);
  vertex(width*0.40, height*0.25);
  endShape(CLOSE);
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}



