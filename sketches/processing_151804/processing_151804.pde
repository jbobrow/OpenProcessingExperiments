
PFont font = createFont ("Arial", 16);

void setup ()
{
  size (600, 200);
  smooth();

  textFont (font, 16);
}

void draw ()
{
  background (#57385c);


  drawNoiseLine (40, width-40, height/2, 80, 50);


  float x = mouseX;
  x = constrain (x, 40, width-40);
  
  drawEllipse (x, height/2, 80, 50);
  
  drawArrow (40, width-40, 150);
}

void drawArrow (float startX, float endX, float y)
{
  strokeWeight (1);
  stroke (#ffedbc);
  fill (#ffedbc);
  
  line (startX, y, endX, y);
  triangle ( endX, y, endX-10, y-8, endX-10, y+8);
  
  text ("time", startX, y + 20);
}

void drawEllipse (float x, float startY, float amplitude, float noiseScale)
{
  float y = startY - noise (x/noiseScale)*amplitude;
  fill (#ffedbc);
  stroke (#A75265);
  strokeWeight (3);

  ellipse (x, y, 20, 20);
}

void drawNoiseLine (float startX, float endX, float startY, float amplitude, float noiseScale)
{
  noFill();
  stroke (#ffedbc);
  strokeWeight (3);

  float x = startX;
  beginShape();
  while (x < endX)
  {
    float y = startY - noise (x/noiseScale)*amplitude;
    vertex (x, y);
    x = x +1;
  }
  endShape();
}



void mousePressed ()
{
  noiseSeed (int (random (100000)));
}

