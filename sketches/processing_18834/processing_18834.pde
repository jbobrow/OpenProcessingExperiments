
int Window = 540;
int [] LeafRGB = new int[40];


void setup() {
  size(Window,Window);
  
  background(82,52,12);
  noStroke();
  smooth();
  frameRate(120);

  for(int i = 0 ; i < LeafRGB.length ; i++)
  {
    if( i % 3 == 1)
      LeafRGB[i] = int(random(50,190));
    else if( i % 3 == 0)
      LeafRGB[i] = int(random(200,255));
    else
      LeafRGB[i] = int(random(0,50));

  }
}

void draw() {

  //background(82,52,12,200);
  drawOneLeaf();
}

void drawOneLeaf() {

  PVector pA = new PVector(-0.5,0.0); // leaf end
  PVector pB = new PVector(0.5,0.0); // right end

  PVector pG1 = makeControlPoint(-0.25,-0.15,0.15,-0.05,-0.15,0.0);
  PVector pG2 = makeControlPoint(0.25,-0.15,0.15,-0.05,-0.15,0.0);
  PVector pH1 = makeControlPoint(-0.25,-0.15,0.15,0.05,0.0,0.15);
  PVector pH2 = makeControlPoint(0.25,-0.15,0.15,0.05,0.0,0.15);

  float yMove = random(0,0.35);

  if( random(100) > 80)
  {
    yMove = -yMove;
  }

  pG2.y += yMove;
  pG2.y += yMove;

  color leafColor = makeLeafColor();
  fill(leafColor);

  translate(Window/2,Window/2);

  float xTrans = random(-Window,Window);
  float yTrans = random(-Window,Window);
  translate(xTrans,yTrans);

  float scaleFactor = random(0.6,1.0);
  scale(scaleFactor*Window/8);
  float rotationAngle = random(0,360);
  rotate(radians(rotationAngle));

  beginShape();
  vertex(pA.x,pA.y);
  bezierVertex(pG1.x,pG1.y,pG2.x,pG2.y,pB.x,pB.y);
  bezierVertex(pH2.x,pH2.y,pH1.x,pH1.y,pA.x,pA.y);
  endShape();
}

PVector makeControlPoint(float x, float dxlo, float dxhi, float y, float dylo, float dyhi)
{
  float px = x + random(dxlo,dxhi);
  float py = y + random(dylo,dyhi);
  PVector t = new PVector(px,py);
  return (t);
}

color makeLeafColor() {
  int w = int(random(LeafRGB.length/4));
  color clr = color(LeafRGB[w*3],LeafRGB[1+(w*3)],LeafRGB[2+(w*3)],random(200,250));

  return clr;
}

