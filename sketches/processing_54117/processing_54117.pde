
//Ayako Matsuda
//DESMA 28 Interactivity Workshop 6

float curves1, curves2, curves3;
float c, s, r1, g1, b1, r2, g2, b2, r3, g3, b3 ;
float eyeslocate;
float y;
float bodyheight1, bodyheight2, bodyheight3;
float pointx1, pointy1, pointx2, pointy2;
float toppoint1, toppoint2, toppoint3; 
float changex, changey;
float feet1, feet2, feet3;
float ring1, ring2, ring3;
float hat1, hat2, hat3;


void setup()
{
  size (800, 400);
  smooth ();
  noLoop();
}

void draw ()
{

  background (255);

  curves1= random (25.0, 120);
  curves2= random (25.0, 120);
  curves3= random (25.0, 120);
  toppoint1 = random (-10.0, 20.0);
  toppoint2 = random (-10.0, 20.0);
  toppoint3 = random (-10.0, 20.0);
  feet1 = random (-20, 20);
  feet2 = random (-20, 20);
  feet3 = random (-20, 20);
  bodyheight1 = random (100, 300);
  bodyheight2 = random (100, 300);
  bodyheight3 = random (100, 300);
  ring1 = random (10, 50);
  ring2 = random (10, 50);
  ring3 = random (10, 50);
  hat1 = random (20, 50);
  hat2 = random (20, 50);
  hat3 = random (20, 50);

  r1 = random (255);
  g1 = random (255);
  b1 = random (255);
  r2 = random (255);
  g2 = random (255);
  b2 = random (255);
  r3 = random (255);
  g3 = random (255);
  b3 = random (255);

scale (0.5);
translate (width/2,height/2);
  robot (width/2-100, height/2-100, curves1, s, color (r1, g1, b1), toppoint1, bodyheight1, ring1, hat1);
  robot (width/2+350, height/2-100, curves2, s, color (r2, g2, b2), toppoint2, bodyheight2, ring2, hat2);
  robot (width/2-550, height/2-100, curves3, s, color (r3, g3, b3), toppoint3, bodyheight3, ring3, hat3);
}

void robot (float x, float cy, float curvature, float s, color c, float toppoint, float bodyheight, float ring, float hat) 
{
  pushMatrix();
  translate (x, cy);
  y = 100.0 + changey;
  changex= random (100);
  strokeWeight(6);
  noFill();
  beginShape();
  vertex(100 - changex, y);
  bezierVertex(0.0, y-curvature, 20.0, 10.0+toppoint, 100.0, toppoint);
  bezierVertex(180.0, 10.0+toppoint, 200.0, y-curvature, 100+changex, y);
  endShape(CLOSE);

  if (changex>=75)
  {
    ellipse (55, 70, 15, 15);
    ellipse (145, 70, 15, 15);
  }
  else if (changex<75 && changex> 10)
  {
    ellipse (55, toppoint+(y-toppoint)/2, 15, 15);
    ellipse (145, toppoint+(y-toppoint)/2, 15, 15);
  }

  else 
  {
    ellipse (55, toppoint+(y-toppoint)/3, 15, 15);
    ellipse (145, toppoint+(y-toppoint)/3, 15, 15);
  }

  //head
  beginShape();
  vertex (100 - hat, toppoint-5);
  vertex (100+ hat, toppoint-5);
  vertex (100+ hat, toppoint);
  vertex (100- hat, toppoint);
  endShape (CLOSE);

  beginShape();
  vertex (90, toppoint-5);
  vertex (100, toppoint-50);
  vertex (110, toppoint-5);
  endShape (CLOSE);

  fill (c);
  ellipse (100, toppoint-70, ring, ring); 

  //body
  beginShape();
  vertex (100 - changex, y);
  vertex (100+changex, y);
  vertex (200.0, y + bodyheight);
  vertex (0.0, y + bodyheight);
  endShape (CLOSE);

  strokeWeight(20);
  stroke (200);
  noFill();
  //arm
  //right
  beginShape();
  vertex(100+changex, y);
  bezierVertex(y + bodyheight, y + bodyheight/3, 
              y + changex*2, y + bodyheight/3, 
              150 + changex*2, y+ bodyheight/2);
  endShape();

  //left
  beginShape();
  vertex (100 - changex, y);
  bezierVertex(y -bodyheight, y + bodyheight/3, 
              y- changex*2, y+ bodyheight/4, 
              50 - changex*2, y+ bodyheight/2);
  endShape();

  stroke (0);
  strokeWeight (6);
  fill(c);
  //shoulder
  ellipse (100 - changex, y, 30, 20);
  ellipse (100+changex, y, 30, 20);

  popMatrix();
}

void mouseReleased()
{
  redraw();
}


