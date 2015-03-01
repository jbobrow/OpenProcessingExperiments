
float rotationR=0;
float rotationL=0;
float speed = 1.5;
float nPos = 0;
float nInc = 0.015;
float nX;
float nY;
boolean forward = false;
boolean flapping = true;
PFont font;
void setup() {
  size(600, 600, P3D);
  font= loadFont("AppleCasual-48.vlw");
  strokeWeight(4);
}

void draw() {
  background(255, 128, 0);
  drawText();
  nX = noise(nPos)*500;
  nY = noise(nPos+5)*500;
  translate(nX, nY);
  butterfly();
  if (flapping == true) {
    nPos= nPos + nInc;
  }
}

void butterfly() {

  wings();
  //body
  fill(25, 214, 0);
  pushMatrix();
  translate(0, 0, 20);
  ellipse(0, 0, 20, 100);
  translate(0, 0, 1);
  //head
  ellipse(0, -50, 30, 30);
  //antenna
  line(10, -63, 20, -80); 
  line(-10, -63, -20, -80);
  //eyes
  point(-4, -55);
  point(4, -55);
  popMatrix();
} 

void wings() {
  // wings
  fill(nX,random(50),nY);
  pushMatrix();
  rotateY(radians(rotationR));
  triangle(0, 0, 75, -75, 75, 75);
  popMatrix();

  pushMatrix();
  rotateY(radians(rotationL));
  triangle(0, 0, -75, -75, -75, 75);
  popMatrix();

  if (flapping == true) {
    if (forward == true) {
      rotationR = rotationR + speed; // rotationR+=speed
      if (rotationR > 60) {
        forward = false;
      }
    } 
    else { 
      rotationR = rotationR-speed;
      if (rotationR < -30) { 
        forward = true;
      }
    }
  }
  rotationL=map(rotationR, 60, -30, -60, 30);
  
}

void mousePressed() {
  float d = dist(mouseX, mouseY, nX, nY);
  if ( d<50 ) {
    flapping = !flapping;
  }
}

void drawText() {
  if( flapping == true) {
    fill(0,50,255);
    textFont(font,30);  
    text("Click on the Butterfly to make him stop!", 20, 40);
}
  else {
    fill(255,0,0);
    textFont(font,20);
    text("Click again to let him go!", nX+25, nY - 80);
  }
}



