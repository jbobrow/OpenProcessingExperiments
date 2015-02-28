
PVector vTop[];
PVector vBottom[];
float w;
float h;

void setup() 
{
    size(250,250);
    w = width/3.0;
    h = w / 6.0;
    vTop = new PVector[4];
    vBottom = new PVector[4];
    for (int i = 0; i < 4; ++i)
      {
        vTop[i] = new PVector(0,0,0);
        vBottom[i] = new PVector(0,0,0);
        vTop[i].z = vBottom[i].z = ((float)i/2.0) * PI;
//        vBottom[i].z = (vBottom[i].z + PI) % (2 * PI);
        vTop[i].x = cos(vTop[i].z) * w;
        vBottom[i].x = cos(vBottom[i].z) * w;
        vTop[i].y = sin(vTop[i].z) * h + (w / 2);
        vBottom[i].y = sin(vBottom[i].z) * h - (w / 2);
      }
}
    
void draw() {
  background(255);
  stroke(255,0,0);
  noFill();
  pushMatrix();
  translate(width/2, height/2);
  // draw the top;
  beginShape();
    {
      for (int i = 0; i < 4; ++i)
        {
          vertex(vTop[i].x, vTop[i].y);
        }
    }
  endShape(CLOSE);
  // draw the bottom;
  stroke(0,255,0);
  beginShape();
    {
      for (int i = 0; i < 4; ++i)
        {
          vertex(vBottom[i].x, vBottom[i].y);
        }
    }
  endShape(CLOSE);
  // connect the sides;
  stroke(0,0,255);
  line(vTop[0].x, vTop[0].y, vBottom[0].x, vBottom[0].y);
  line(vTop[3].x, vTop[3].y, vBottom[1].x, vBottom[1].y);
  line(vTop[2].x, vTop[2].y, vBottom[2].x, vBottom[2].y);
  line(vTop[1].x, vTop[1].y, vBottom[3].x, vBottom[3].y);
  popMatrix();
  update();
}

void update() {
  // update the top;
  for (int i = 0; i < 4; ++i)
    {
      vTop[i].z += 0.01;
      if (vTop[i].z > (2 * PI)) vTop[i].z -= 2*PI;
      vTop[i].x = cos(vTop[i].z) * w;
      vTop[i].y = sin(vTop[i].z) * h + (w / 2);
      // update the bottom while I'm in this loop too...;
      vBottom[i].z -= 0.01;
      if (vBottom[i].z < 0) vBottom[i].z += 2*PI;
      vBottom[i].x = cos(vBottom[i].z) * w;
      vBottom[i].y = sin(vBottom[i].z) * h - (w / 2);
    }
}
