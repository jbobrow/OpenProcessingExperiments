
//Mira A | Ticklish Penguin | CP1 | Mods 16/17

/**
Left click to cause random movement. <br>
Right click to reset.
*/

//location of circles
int a = 150;
int b = 150;
int c = 100;
int d = 150;
int e = 200;
int f = 150;

//location of lines
int g = 30;
int h = 60;
int i = 90;
int j = 120;
int k = 150;
int l = 180;
int m = 210;
int n = 240;
int o = 270;

//location of rectangle
int p = 20;
int q = 20;
int r = 40;
int s = 40;

void setup()
{
  size (300, 300);
  smooth ();
}

void draw()
{
  //random movement
  one();
  //cirlces
  two();
  //lines
  three();
  //rectangles
  four();
  //reset
  mouseClicked();
}

void one()
{
  //background
  noStroke();
  fill(0, 0, 0, 1);
  rect(0, 0, 300, 300);
  //random movement
  if (mousePressed == true && mouseButton == LEFT)
  {
    //random movement of circles
    a = a + int (random (-5, 5));
    b = b + int (random (-5, 5));
    c = c + int (random (-5, 5));
    d = d + int (random (-5, 5));
    e = e + int (random (-5, 5));
    f = f + int (random (-5, 5));

    //random movement of lines
    g = g + int (random (-5, 5));
    h = h + int (random (-5, 5));
    i = i + int (random (-5, 5));
    j = j + int (random (-5, 5));
    k = k + int (random (-5, 5));
    l = l + int (random (-5, 5));
    m = m + int (random (-5, 5));
    n = n + int (random (-5, 5));
    o = o + int (random (-5, 5));

    //random movement of rectangles
    p = p + int (random (-5, 5));
    q = q + int (random (-5, 5));
    r = r + int (random (-5, 5));
    s = s + int (random (-5, 5));
  }
}

void two()
{
  //filled circles
  fill(255);
  ellipse (a, b, 30, 30);
  ellipse (c, d, 30, 30);
  ellipse (e, f, 30, 30);

  //circles
  stroke (255);
  strokeWeight(1);
  noFill();
  ellipse (a, b, 50, 50);
  ellipse (c, d, 50, 50);
  ellipse (e, f, 50, 50);
}

void three()
{
  line (g, 0, g, 300);
  line (h, 0, h, 300);
  line (i, 0, i, 300);
  line (j, 0, j, 300);
  line (k, 0, k, 300);
  line (l, 0, l, 300);
  line (m, 0, m, 300);
  line (n, 0, n, 300);
  line (o, 0, o, 300);
}

void four()
{
  //larger rectangle
  rect(p, q, 260, 260);

  //smaller rectangle
  rect(r, s, 220, 220);
}

void mouseClicked()
{
  //reset
  if (mouseButton == RIGHT)
  {  
    //reset circles
    a = 150;
    b = 150;
    c = 100;
    d = 150;
    e = 200;
    f = 150;

    //reset lines
    g = 30;
    h = 60;
    i = 90;
    j = 120;
    k = 150;
    l = 180;
    m = 210;
    n = 240;
    o = 270;

    //reset rectangles
    p = 20;
    q = 20;
    r = 40;
    s = 40;
  }
}
