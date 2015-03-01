


void setup() {
  size(600, 200);
  smooth();

  frameRate (30);
}


void draw()
{
  background(#57385c);
  noStroke();
  fill (#ffedbc);
 
  int x = 0;
  while (x < width)
  {
    float y = 50 + noise (x / 80.0) * 100;
   // noise generiert werte zwischen 0 und 1
   // 50 ist der startwert von y
   // 100 ist die amplitude, also wie hoch schlägt die Kurve aus

    ellipse (x, y, 6, 6);

    x = x + 6;
  }
}

