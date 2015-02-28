
/* pattern
 */

Xena A, B, C, D, E, F, G, H, I, J;
float z;

void setup ()
{
  size(500, 500);
  smooth();
  noStroke();

  A = new Xena();
  A.r = 5;
  A.v = 1000;

  B = new Xena();
  B.r = 5;
  B.v = 1000;

  C = new Xena();
  C.r = 5;
  C.v = 1000;

  D = new Xena();
  D.r = 5;
  D.v = 1000;

  E = new Xena();
  E.r = 5;
  E.v = 1000;

  F = new Xena();
  F.r = 5;
  F.v = 1000;

  G = new Xena();
  G.r = 5;
  G.v = 1000;

  H = new Xena();
  H.r = 5;
  H.v = 1000;

  I = new Xena();
  I.r = 5;
  I.v = 1000;

  J = new Xena();
  J.r = 5;
  J.v = 1000;

  A.rx = 250;
  A.ry = 250;
  B.rx = 250;
  B.ry = 250;
  C.rx = 250;
  C.ry = 250;
  D.rx = 250;
  D.ry = 250;
  E.rx = 250;
  E.ry = 250;
  F.rx = 250;
  F.ry = 250;
  G.rx = 250;
  G.ry = 250;
  H.rx = 250;
  H.ry = 250;
  I.rx = 250;
  I.ry = 250;
  J.rx = 250;
  J.ry = 250;
}

void draw ()
{
  fill(0, 12);
  rect(-10, -10, 9000, 9000);
  A.show();
  A.move();
  B.show();
  B.move();
  C.show();
  C.move();
  D.show();
  D.move();
  E.show();
  E.move();
  F.show();
  F.move();
  G.show();
  G.move();
  H.show();
  H.move();
  I.show();
  I.move();
  J.show();
  J.move();


  if (mousePressed == true)
  {
    fill(100, 10000, 100);
    stroke(#62FF15);
    line(A.rx, A.ry, mouseX, mouseY);
    line(B.rx, B.ry, mouseX, mouseY);
    line(C.rx, C.ry, mouseX, mouseY);
    line(D.rx, D.ry, mouseX, mouseY);
    line(E.rx, E.ry, mouseX, mouseY);
    line(F.rx, F.ry, mouseX, mouseY);
    line(G.rx, G.ry, mouseX, mouseY);
    line(H.rx, H.ry, mouseX, mouseY);
    line(I.rx, I.ry, mouseX, mouseY);
    line(J.rx, J.ry, mouseX, mouseY);
  }
  if (mousePressed == false)
  {

    fill(100, 10000, 100);
    stroke(#00FF12,0);
    line(A.rx, A.ry, mouseX, mouseY);
    line(B.rx, B.ry, mouseX, mouseY);
    line(C.rx, C.ry, mouseX, mouseY);
    line(D.rx, D.ry, mouseX, mouseY);
    line(E.rx, E.ry, mouseX, mouseY);
    line(F.rx, F.ry, mouseX, mouseY);
    line(G.rx, G.ry, mouseX, mouseY);
    line(H.rx, H.ry, mouseX, mouseY);
    line(I.rx, I.ry, mouseX, mouseY);
    line(J.rx, J.ry, mouseX, mouseY);
    A.rx = mouseX;
    A.ry = mouseY;
    B.rx = mouseX;
    B.ry = mouseY;
    C.rx = mouseX;
    C.ry = mouseY;
    D.rx = mouseX;
    D.ry = mouseY;
    E.rx = mouseX;
    E.ry = mouseY;
    F.rx = mouseX;
    F.ry = mouseY;
    G.rx = mouseX;
    G.ry = mouseY;
    H.rx = mouseX;
    H.ry = mouseY;
    I.rx = mouseX;
    I.ry = mouseY;
    J.rx = mouseX;
    J.ry = mouseY;
    fill(random(5), random(100), random(300));
    ellipse(mouseX,mouseY,6,6);
  }

  if (A.rx < -25)
  {
    A.rx = 600;
  }
  if (A.rx > 625)
  {
    A.rx = 0;
  }
  if (A.ry < -25)
  {
    A.ry = 600;
  }
  if (A.ry > 625)
  {
    A.ry = 0;
  }
  if (C.rx < -25)
  {
    C.rx = 600;
  }
  if (C.rx > 625)
  {
    C.rx = 0;
  }
  if (C.ry < -25)
  {
    C.ry = 600;
  }
  if (C.ry > 625)
  {
    C.ry = 0;
  }
  if (D.rx < -25)
  {
    D.rx = 600;
  }
  if (D.rx > 625)
  {
    D.rx = 0;
  }
  if (D.ry < -25)
  {
    D.ry = 600;
  }
  if (D.ry > 625)
  {
    D.ry = 0;
  }
  if (B.rx < -25)
  {
    B.rx = 600;
  }
  if (B.rx > 625)
  {
    B.rx = 0;
  }
  if (B.ry < -25)
  {
    B.ry = 600;
  }
  if (B.ry > 625)
  {
    B.ry = 0;
  }
  if (E.rx < -25)
  {
    E.rx = 600;
  }
  if (E.rx > 625)
  {
    E.rx = 0;
  }
  if (E.ry < -25)
  {
    E.ry = 600;
  }
  if (E.ry > 625)
  {
    E.ry = 0;

    if (F.rx < -25)
    {
      F.rx = 600;
    }
    if (F.rx > 625)
    {
      F.rx = 0;
    }
    if (F.ry < -25)
    {
      F.ry = 600;
    }
    if (F.ry > 625)
    {
      F.ry = 0;
    }
    if (G.rx < -25)
    {
      G.rx = 600;
    }
    if (G.rx > 625)
    {
      G.rx = 0;
    }
    if (G.ry < -25)
    {
      G.ry = 600;
    }
    if (G.ry > 625)
    {
      G.ry = 0;
    }
    if (H.rx < -25)
    {
      H.rx = 600;
    }
    if (H.rx > 625)
    {
      H.rx = 0;
    }
    if (H.ry < -25)
    {
      H.ry = 600;
    }
    if (H.ry > 625)
    {
      H.ry = 0;
    }
    if (I.rx < -25)
    {
      I.rx = 600;
    }
    if (I.rx > 625)
    {
      I.rx = 0;
    }
    if (I.ry < -25)
    {
      I.ry = 600;
    }
    if (I.ry > 625)
    {
      I.ry = 0;
    }
    if (J.rx < -25)
    {
      J.rx = 600;
    }
    if (J.rx > 625)
    {
      J.rx = 0;
    }
    if (J.ry < -25)
    {
      J.ry = 600;
    }
    if (J.ry > 625)
    {
      J.ry = 0;
    }
  }    
  ellipse(mouseX, mouseY, 4, 4);
  fill(500, 100, 100);
  text("Click & hold to Diverge, Z for green frame, X for red frame, C for white Frame", -2, 498);
  fill(100, 100, 500);
  text("Click & hold to Diverge, Z for green frame, X for red frame, C for white Frame", -2.5, 498);
  fill(100, 100, 500);
  text("By Kevin Nguyen", 0,10);
  z = z + 1;
  if ( z > 620)
  {
    z = 0;
  }
  if ( z < -20)
  {
    z = 600;
  }
}


class Xena
{
  float x, y;
  float rx, ry;
  int r;
  int v;

  void show()
  {
    fill(random(20), random(500), random(100));
    ellipse(rx, ry, r, r);
    rx = rx + random(-10, 10);
    ry = ry + random(-10, 10);
  }  

  void move()
  {
    x += ( mouseX - width/2  ) * 0.001 * v;
    y += ( mouseY - height/2 ) * 0.001 * v;
  }
}
void keyPressed()
{
  if (key == 'z')
  {
    fill(100, 10000, 100);
    stroke(#00FA2B);
    line(0, 0, mouseX, mouseY);
    line(250, 0, mouseX, mouseY);
    line(500, 0, mouseX, mouseY);
    line(500, 250, mouseX, mouseY);
    line(500, 500, mouseX, mouseY);
    line(0, 250, mouseX, mouseY);
    line(250, 500, mouseX, mouseY);
    line(0, 500, mouseX, mouseY);
    noStroke();
  }

  if (key == 'x')
  {
    fill(100, 10000, 100);
    stroke(#FC0F0F,311);
    line(0, 0, mouseX, mouseY);
    line(250, 0, mouseX, mouseY);
    line(500, 0, mouseX, mouseY);
    line(500, 250, mouseX, mouseY);
    line(500, 500, mouseX, mouseY);
    line(0, 250, mouseX, mouseY);
    line(250, 500, mouseX, mouseY);
    line(0, 500, mouseX, mouseY);
    noStroke();
    A.rx = mouseX;
    A.ry = mouseY;
    B.rx = mouseX;
    B.ry = mouseY;
    C.rx = mouseX;
    C.ry = mouseY;
    D.rx = mouseX;
    D.ry = mouseY;
    E.rx = mouseX;
    E.ry = mouseY;
    F.rx = mouseX;
    F.ry = mouseY;
    G.rx = mouseX;
    G.ry = mouseY;
    H.rx = mouseX;
    H.ry = mouseY;
    I.rx = mouseX;
    I.ry = mouseY;
    J.rx = mouseX;
    J.ry = mouseY;
  }
   if (key == 'c')
  {
    fill(100, 10000, 100);
    stroke((551),(500),(1000));
    line(0, 0, mouseX, mouseY);
    line(250, 0, mouseX, mouseY);
    line(500, 0, mouseX, mouseY);
    line(500, 250, mouseX, mouseY);
    line(500, 500, mouseX, mouseY);
    line(0, 250, mouseX, mouseY);
    line(250, 500, mouseX, mouseY);
    line(0, 500, mouseX, mouseY);
    noStroke();
    A.rx = mouseX;
    A.ry = mouseY;
    B.rx = mouseX;
    B.ry = mouseY;
    C.rx = mouseX;
    C.ry = mouseY;
    D.rx = mouseX;
    D.ry = mouseY;
    E.rx = mouseX;
    E.ry = mouseY;
    F.rx = mouseX;
    F.ry = mouseY;
    G.rx = mouseX;
    G.ry = mouseY;
    H.rx = mouseX;
    H.ry = mouseY;
    I.rx = mouseX;
    I.ry = mouseY;
    J.rx = mouseX;
    J.ry = mouseY;
  }
}














