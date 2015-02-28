
PVector mouseP, pos, sPos, vector, nVector;
float rad, prop, distance, diameter, sDistance, strokeW;

void setup()
{
  size(400, 400);
  
  mouseP = new PVector();
  pos = new PVector();
  sPos = new PVector(width/2, height/2);
  vector = new PVector();
  nVector = new PVector();
  pos = sPos;
  diameter = 200;
  rad = diameter/2;
  strokeW = 1;
}

void draw()
{
  background(0);
  
  mouseP = new PVector(mouseX, mouseY);
  vector = PVector.sub(sPos, mouseP);
  distance = PVector.dist(pos, mouseP);
  sDistance = PVector.dist(sPos, mouseP);
  
  if (distance <= rad)
  {
    prop = (rad-sDistance)/rad;
    strokeW = map(prop, 0, 1, 1, 10);
    nVector = vector;

    nVector.mult(prop);
    pos = PVector.add(nVector, sPos);
  }
  
  else
  {
    pos = sPos;
    strokeW = 1;
  }
  
  fill(255);
  stroke(255);
//  strokeWeight(strokeW);
//  point(pos.x, pos.y);
  noStroke();
  ellipse(pos.x, pos.y, strokeW,strokeW);
  
  noFill();
  stroke(255);
  strokeWeight(1);
  ellipse(mouseP.x, mouseP.y, diameter, diameter);
  
}


