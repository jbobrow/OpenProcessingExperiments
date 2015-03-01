
/* array variable anlegen */
color [] c = null;

void setup ()
{
  size (600, 200);
  smooth();
  /* array mit groesse initalisieren */
  initalizeArray();
  
  /* array-eintraege mit inhalt befuellen */
  writeValuesToArray();
}

void draw ()
{
  background (#57385c);

  stroke (255);
  strokeWeight (3);

  drawValues();
}

void initalizeArray() {
    c = new color [10];
}


void drawValues ()
{
  float xsteps = float (width) / c.length;
  int i = 0;
  while (i < c.length)
  {
    float x = i * xsteps + xsteps / 2;
    float y = height/2;
    
    /* inhalt eines array eintrages auslesen und in die variable cc schreiben */
    color cc = c [i];
    fill (cc);

    ellipse (x, y, 20, 20);

    i = i +1;
  }
}

void writeValuesToArray()
{
  int i = 0;
  while (i < c.length)
  {
    float r = random (0, 255);
    float g = random (0, 255);
    float b = random (0, 255);
    
    color currentColor = color(r, g, b);

    c[i] = currentColor ;
    i = i + 1;
  }
}


void mousePressed ()
{
  writeValuesToArray();
}

