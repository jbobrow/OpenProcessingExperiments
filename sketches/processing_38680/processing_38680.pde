
int renderMode = 1;

void setup() {
  size (450, 450);
  smooth();// place smooth() here as it only needs to be called once
}

void draw() {
  if ( renderMode == 1) {
    background(200, 200, 20);// make sure to draw the background
    // or smooth() want matter because the anti aliasing will build
    // up and create pixelated edges

    totem(width/2, 2*height/3, 200, 150);
    totem(width/6, height/4, -100, 50);
    totem(5*width/6, height/4, -100, 250);

    // I added another rendering mode because I saw your step sketch
    // and wanted to try something neat
  }
  else if ( renderMode == 2 ) {
    float d = random( 10, 50);
    float x = random(-d / 2, width + (d / 2) );
    float y = random(-d / 2, height + (d / 2) );
    float c = map( x + y, -100, (width + height) + 100, 0, 255);

    totem(x, y, d, c);
  }
}

void totem(float x, float y, float d, float col) {
  pushStyle();// use push and pop style to keep fill() and stroke()
  // calls from interfering with other fill() and stroke() calls
  // this is just incase, because of the problem with openProcessing
  //Orb
  noStroke();
  fill(5, 5, col);
  ellipse(x, y, d, d);
  fill(5, 5, col+100);
  ellipse(x+.05*d, y-.05*d, .85*d, .85*d);
  fill(220, 220, col+200);
  ellipse(x+.25*d, y-.25*d, .2*d, .2*d);

  //Curves
  beginShape();
  fill(200, 200, col+50);
  noStroke();
  vertex(x+.05*d, y+.5*d);
  bezierVertex(x+.05*d, y+.45*d, x+.1*d, y+.4*d, x+.15*d, y+.4*d);
  vertex(x+.15*d, y+.4*d);
  bezierVertex(x+.1*d, y+.4*d, x, y+.35*d, x, y+.25*d );
  vertex(x, y+.25*d);
  bezierVertex(x, y+.35*d, x-.1*d, y+.4*d, x-.15*d, y+.4*d);
  vertex(x-.15*d, y+.4*d);
  bezierVertex(x-.1*d, y+.4*d, x-.05*d, y+.45*d, x-.05*d, y+.5*d);
  vertex(x-.05*d, y+.5*d);
  bezierVertex(x-.6*d, y+.5*d, x-.7*d, y, x-.5*d, y-.25*d);
  vertex(x-.5*d, y-.25*d);
  bezierVertex(x-.45*d, y-.35*d, x-.3*d, y-.5*d, x-.5*d, y-.95*d);
  vertex(x-.5*d, y-.95*d);
  bezierVertex(x-.33*d, y-.5*d, x-.48*d, y-.35*d, x-.53*d, y-.25*d);
  vertex(x-.53*d, y-.25*d);
  bezierVertex(x-.73*d, y, x-.63*d, y+.5*d, x-.08*d, y+.85*d);
  vertex(x-.08*d, y+.85*d);
  bezierVertex(x-.13*d, y+.7*d, x-.18*d, y+.65*d, x, y+.6*d);
  vertex(x, y+.6*d);
  bezierVertex(x+.18*d, y+.65*d, x+.13*d, y+.7*d, x+.08*d, y+.85*d);
  vertex(x+.08*d, y+.85*d);
  bezierVertex( x+.63*d, y+.5*d, x+.73*d, y, x+.53*d, y-.25*d);
  vertex(x+.53*d, y-.25*d);
  bezierVertex(x+.48*d, y-.35*d, x+.33*d, y-.5*d, x+.5*d, y-.95*d);
  vertex(x+.5*d, y-.95*d);
  bezierVertex(x+.3*d, y-.5*d, x+.45*d, y-.35*d, x+.5*d, y-.25*d);
  vertex(x+.5*d, y-.25*d);
  bezierVertex(x+.7*d, y, x+.6*d, y+.5*d, x+.05*d, y+.5*d);
  vertex(x+.05*d, y+.5*d);
  endShape();

  //Inner Curve
  beginShape();
  fill(50, 50, col-100);
  noStroke();
  //Middle Edges
  vertex(x+.05*d, y+.5*d);
  bezierVertex(x+.03*d, y+.45*d, x+.08*d, y+.4*d, x+.13*d, y+.4*d);
  vertex(x+.13*d, y+.4*d);
  bezierVertex(x+.08*d, y+.4*d, x-.02*d, y+.35*d, x, y+.275*d );
  vertex(x, y+.275*d);
  bezierVertex(x+.02*d, y+.35*d, x-.08*d, y+.4*d, x-.13*d, y+.4*d);
  vertex(x-.13*d, y+.4*d);
  //Left Side
  bezierVertex(x-.08*d, y+.4*d, x-.03*d, y+.45*d, x-.03*d, y+.5*d);
  vertex(x-.05*d, y+.5*d);
  bezierVertex(x-.6*d, y+.5*d, x-.7*d, y, x-.5*d, y-.25*d);
  vertex(x-.5*d, y-.25*d);
  bezierVertex(x-.45*d, y-.35*d, x-.3*d, y-.5*d, x-.5*d, y-.95*d);
  //Left Edge
  vertex(x-.5*d, y-.95*d);
  bezierVertex(x-.32*d, y-.5*d, x-.47*d, y-.35*d, x-.52*d, y-.25*d);
  vertex(x-.52*d, y-.25*d);
  bezierVertex(x-.715*d, y, x-.615*d, y+.5*d, x-.08*d, y+.83*d);
  vertex(x-.08*d, y+.83*d);
  //Middle Cut
  bezierVertex(x-.125*d, y+.7*d, x-.18*d, y+.65*d, x, y+.6*d);
  vertex(x, y+.6*d);
  bezierVertex(x+.18*d, y+.65*d, x+.125*d, y+.7*d, x+.08*d, y+.83*d);
  vertex(x+.08*d, y+.83*d);
  //Right Edge
  bezierVertex( x+.615*d, y+.5*d, x+.72*d, y, x+.52*d, y-.25*d);
  vertex(x+.52*d, y-.25*d);
  bezierVertex(x+.475*d, y-.35*d, x+.325*d, y-.5*d, x+.5*d, y-.95*d);
  vertex(x+.5*d, y-.95*d);
  //Right Side
  bezierVertex(x+.3*d, y-.5*d, x+.45*d, y-.35*d, x+.5*d, y-.25*d);
  vertex(x+.5*d, y-.25*d);
  bezierVertex(x+.7*d, y, x+.6*d, y+.5*d, x+.05*d, y+.5*d);
  vertex(x+.05*d, y+.5*d);
  endShape();
  popStyle();
}

void keyPressed() {
  if ( key == '1' ) {
    renderMode = 1;
  }
  else if ( key == '2' ) {
    renderMode = 2;
  }
}


