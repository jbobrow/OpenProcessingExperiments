
PFont font = createFont ("Arial", 12);

void setup ()
{
  size (600, 200);
  smooth();
  textFont (font, 12);
}

void draw ()
{
  background (#57385c);
  drawRaster();
}

void drawRaster ()
{
  int numberOfElements = 10;
  float rectWidth = float(width) / numberOfElements;
  
  int i = 0;

  while (i < numberOfElements)
  {
    float x = i*rectWidth;
    float y = height/2;
    
    
    // rechteck ----------------------------
    fill (#ffedbc);
    stroke (#A75265);
    strokeWeight (3);
    
    rect (x, y, rectWidth, 100);
    
    
    // text ----------------------------------
    fill (255);
    text ("x = \n" + nf (i, i < 10 ? 1 : 2) + "x \nrectWidth", x, 40);
    
    i = i + 1;
  }
  
  // general text --------------------------------
  
  fill (255);
  text ("Elements: " + nf (numberOfElements, 2), 5, 20);
}
