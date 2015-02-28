

float posS, posM, posH, bg, lines, totalMin;

void setup()  {
  size (640, 480);
  smooth();
}

void draw()  {
  
  float s = second();
  float m = minute();
  float h = hour();
  
  totalMin = (h * 60) + m;
  
  bg = map(totalMin, 0, 1439, 255, 0); 
  lines = abs(bg - 250);
  
  background(bg);
  stroke(lines);
  
  for (int i = 0; i < height; i = i + 5)  {
    line (0, i, 640, i);
  }
  
  posS = map(s, 0, 59, 0, width);
  posM = map(m, 0, 59, 0, height);
  posH = map(h, 0, 23, 0, height);
  
  for (int i = 0; i < width; i = i + 5)  {
    line (i, 0, posS, 480);
  }
  
  for (int i = 0; i < height; i = i + 5)  {
    line (0, i, 640, posM);
  }
  
  for (int i = 0; i < height; i = i + 5)  {
    line (640, i, 0, posH);
  }
}

