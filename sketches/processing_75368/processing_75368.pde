
//otesanek

void setup()
{
  size(400, 400);
  background(255);
  fill(200, 20);
  noStroke();
  frameRate(8);
}


void draw()
{
  background(255);
  tri();
}

void tri()
{
  float x = random(width/2-20, width/2+20);
  float y = random(height/2-20, height/2+20);

  for (int i = 0; i < 8; i++)
  {

    float cntrl = random (40, width-40);
    float cntrl2 = random (40, height-40);
    
    float mx = constrain(mouseX, 0, width-40);
    float my = constrain(mouseY, 0, height-40);

    beginShape(TRIANGLES);
    vertex(x, y);
    vertex(cntrl, cntrl2);
    cntrl = random (mx, mx+40);
    cntrl2 = random (my, my+40);
    vertex(cntrl, cntrl2);
    cntrl = random (mx, mx+40);
    cntrl2 = random (my, my+40);
    vertex(cntrl, cntrl2);
    cntrl = random (mx, mx+40);
    cntrl2 = random (my, my+40);
    vertex( cntrl, cntrl2);
    cntrl = random (mx, mx+40);
    cntrl2 = random (my, my+40);
    endShape();
  }
}


