
//Robb Godshaw
//Variable Faces
float
skullSize, 
chinSize, 
noseProm, 
nostrilPitch, 
manHeight, 

offset = 1, offsetb = 10, offsetc = 20, offsetd = 30, offsete = 40, n1, 
R = 255, G = 195, B = 170 ;


void setup() {
  size(500, 500);
  smooth();
  noStroke();
}

void draw() {
  background(5);

  noStroke();
  head();
  tone();

  skullSize = flowb (90, 120);
  chinSize = flowc (20, 60);
  noseProm = flowd (15, 65);
  nostrilPitch = flowe (80, 120);
  manHeight = flowc(-height/7, -height/14);
}

void mousePressed() {
  diagram();
}

void head() {
  translate(-width/19, manHeight);

  fill(R, G, B);
  ellipseMode(RADIUS);
  ellipse(width/2, height/2, skullSize, skullSize);
  ellipse(width/2+skullSize-chinSize, height/2+skullSize+chinSize, chinSize, chinSize);

  beginShape();

  vertex(width/2+6*skullSize/7, 3*height/7);
  vertex(width/2+skullSize+noseProm, height/2 +nostrilPitch);
  vertex(width/2+skullSize, height/2 +nostrilPitch);
  vertex(width/2+skullSize, height/2+skullSize+chinSize );
  vertex(width/2+skullSize-chinSize, height/2+skullSize+2*chinSize );
  vertex(width/2-2*skullSize/3, height/2+skullSize+2*chinSize );
  vertex(width/2-3*skullSize/4, height/2 );

  endShape();

  translate(width/19, - manHeight);
} 

void diagram() {

  stroke(0);
  xhair(width/2, height/2);
  stroke(0, 255, 0);
  xhair(width/2+6*skullSize/7, 3*height/7);
  xhair(width/2+skullSize+noseProm, height/2 +nostrilPitch);
  xhair(width/2+skullSize, height/2 +nostrilPitch);
  stroke(255, 0, 0);
  xhair(width/2+skullSize, height/2+skullSize+chinSize );
  stroke(255, 0, 255);
  xhair(width/2+skullSize-chinSize, height/2+skullSize+2*chinSize );
  stroke(0, 255, 255);
  xhair(width/2-2*skullSize/3, height/2+skullSize+2*chinSize );
  stroke(255, 255, 0);
  xhair(width/2-3*skullSize/4, height/2 );
  
}

void xhair(float xX, float yY) { //crosshairs
  float inset = 100;
  line(0+inset, yY, width-inset, yY);
  line(xX, 0+inset, xX, height-inset);
}

void tone() { //I referenced http://www.makehuman.org/forum/viewtopic.php?f=8&t=1529 for this formula.
  B = flowb(140, 180);
  R = B * 1.5;
  G = B * 1.15;
}

//I tried to make one, but they flowed toghether, so I made a bunch. This doesn't look ideal.

float flow(float low, float high) {
  offset = offset + 0.011; //this increments the offset with which the noisey line is read
  return (noise(offset) * (high-low)) + low;//this scales the noise value to match its application.
}

float flowb(float low, float high) {
  offsetb = offsetb + 0.01; //this increments the offset with which the noisey line is read
  return (noise(offsetb) * (high-low)) + low;//this scales the noise value to match its application.
}

float flowc(float low, float high) {
  offsetc = offsetc + 0.013; //this increments the offset with which the noisey line is read
  return (noise(offsetc) * (high-low)) + low;//this scales the noise value to match its application.
}
float flowd(float low, float high) {
  offsetd = offsetd + 0.014; //this increments the offset with which the noisey line is read
  return (noise(offsetd) * (high-low)) + low;//this scales the noise value to match its application.
}
float flowe(float low, float high) {
  offsete = offsete + 0.007; //this increments the offset with which the noisey line is read
  return (noise(offsete) * (high-low)) + low;//this scales the noise value to match its application.
}
