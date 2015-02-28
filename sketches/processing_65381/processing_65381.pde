
int m, n;
NoisePoint2D translate1, translate2;
Spiral spiral;
boolean usingColor = true;

void setup() 
{
  size(800, 800);
  smooth();
  colorMode(HSB);
  restart();
}

void restart()
{
  // try to number of elements (m*n) reasonable
  m = 10;    n = 10;
  while (m*n > 99 || m*n < 16) {
    m = (int) random(2, 10);
    n = (int) random(2, 10);
  }
  
  translate1 = new NoisePoint2D(new PVector(random(-300, 0), random(-300, 0)), 
                                new PVector(random(300), random(300)), 
                                random(0.0003));
  translate2 = new NoisePoint2D(new PVector(random(-300, 0), random(-300, 0)), 
                                new PVector(random(300), random(300)), 
                                random(0.0003));
  spiral = new Spiral();
}

void draw()
{
  fill(255);
  noStroke();
  text("new one", 5, 16);
  text("toggle color", 5, 38);

  PVector trans1 = translate1.next();
  PVector trans2 = translate2.next();

  pushStyle();
  fill(0, 125);
  rect(0, 0, width, height);
  popStyle();
  
  translate(width/2, height/2);
  for (int i = 0; i < m; i++)
  {
    pushMatrix();
    rotate(map(i, 0, m, 0, TWO_PI));
    translate(trans1.x, trans1.y);  
    for (int j = 0; j < n; j++)
    {
      pushMatrix();
      rotate(map(j, 0, n, 0, TWO_PI));
      translate(trans2.x, trans2.y);
      spiral.draw();
      popMatrix();
    }
    popMatrix();
  }  
}

void keyPressed() { 
  if (key==' ') restart();
  if (key=='c') usingColor = !usingColor;
}

void mousePressed() {
  if (mouseX < 50 && mouseY < 20) restart();
  if (mouseX < 75 && mouseY > 20 && mouseY < 40) usingColor = !usingColor;
}


// Draws a spiral around a single point
class Spiral
{
  NoisePoint2D margins;
  float h;
  float angleBoundary1 = 0, angleBoundary2 = 0, angleNoiseFactor;
  int n;

  Spiral() 
  {
    margins = new NoisePoint2D( new PVector(random(-350, 350), random(-350, 350)),   // minimum margin
                                new PVector(random(-350, 350), random(-350, 350)),   // maximum margin
                                random(0.001) );                                     // noiseFactor
    n = (int) random(6, 12);
    while (abs(angleBoundary1-angleBoundary2) < 12*PI) {
      angleBoundary1 = random(-24*PI, 24*PI);
      angleBoundary2 = random(-24*PI, 24*PI);
    }
    
    angleNoiseFactor = random(0.005);
    h = random(255);
  }

  void draw() 
  {    
    strokeWeight(3);
    if (usingColor) {
      fill(h, 255, 255, 25);
      stroke( (h + 127) % 255, 255, 255, 60);
    } else {
      fill(255, 15);
      stroke(120, 50);
    }
    
    PVector pmargins = margins.next();
    float maxAngle = lerp(angleBoundary1, angleBoundary2, noise(frameCount * angleNoiseFactor));

    pushMatrix();
    beginShape();
    for (int i = 0; i < n; i++) {
      float ang = map(i, 0, n, 0, maxAngle);
      float mx = map(i, 0, n, 0, pmargins.x);
      float my = map(i, 0, n, 0, pmargins.y);
      
      float x = mx * cos(ang);
      float y = my * sin(ang);
      curveVertex(x, y);
    }
    endShape();
    popMatrix();
  }
}


// this class models a single point moving in 2-d
// according to a noise() function with some margin
class NoisePoint2D
{
  PVector minpt, maxpt;
  float noiseFactor, noisex, noisey;

  NoisePoint2D(PVector minpt, PVector maxpt, float noiseFactor)
  {
    this.minpt = minpt;
    this.maxpt = maxpt;
    this.noiseFactor = noiseFactor;
    noisex = random(10);
    noisey = random(10);
  }

  PVector next()
  {
    noisex += noiseFactor;
    noisey += noiseFactor;
    return new PVector( map(noise(noisex), 0, 1, minpt.x, maxpt.x), 
    map(noise(noisey), 0, 1, minpt.y, maxpt.y) );
  }
}

