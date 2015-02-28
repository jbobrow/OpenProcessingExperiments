
/*
 Andor Salga
 May 2014
*/

int sideLength = 130;
float rot = 0.0f;
float pause = 0.0f;
float wobble = 0.0f;
int col = 0;

float triangleHeight = sin(60.0f * DEG_TO_RAD) * sideLength;
float halfHeight = triangleHeight/2.0f;
  
PVector pv0 = new PVector(-sideLength/2.0f, + halfHeight);
PVector pv1 = new PVector(0, -triangleHeight + halfHeight);
PVector pv2 = new PVector(sideLength/2.0f, 0 + halfHeight);

void setup()
{
  size(400, 400);
}

void draw()
{
  noStroke();
  fill(0, 30);
  rect(0, 0, width * 2, height * 2);
  translate(width/2, height/2);

  noFill();
  stroke(255);
  triangle(pv0.x, pv0.y, pv1.x, pv1.y, pv2.x, pv2.y);

  if (pause > 0) {
    pause -= 1.0f;
  }
  else {
    rot  += 0.08f;
  }

  if ( rot > (240.0f * DEG_TO_RAD )) {
    rot = 0.0f;
    col++;
    pause = 50.0f;
    wobble = 100.0f;
  }
  
  drawTriangle(pv0, 0);
  drawTriangle(pv1, 1);
  drawTriangle(pv2, 2);
}

void setColor(int index)
{
  fill(   0xFF000000 | (color(255) & (0x00440000 >> 8 * (index % 3))));
  stroke( 0xFF000000 | (color(255) & (0x00FF0000 >> 8 * (index % 3))));
}

void drawTriangle(PVector pivot, int index)
{
  pushMatrix();
  translate(pivot.x, pivot.y);
  rotate((-120.0f + (index * 120.0f))* DEG_TO_RAD - rot);

  setColor(col + index);
  triangle(   0, 0, 
              sideLength/2.0f, sin(60.f * DEG_TO_RAD) * sideLength,
              sideLength,      0);
              
  popMatrix();
}
