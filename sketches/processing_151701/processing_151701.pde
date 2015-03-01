
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
  int margin = 30;      // abstand zum Fensterrand
  int padding = 10;     // abstand der rechtecke zueinander
  
  int totalSpace = width - 2*margin - (numberOfElements-1)*padding;
  float rectWidth = float(totalSpace) / numberOfElements;
   
  int i = 0;
 
  while (i < numberOfElements)
  {
    float x = margin + i*(rectWidth+padding);
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
  text ("Elements: " + nf (numberOfElements, 2) + ", Margin: " + nf (margin, 2) + "px, Padding: " + nf (padding, 2) + "px", margin, 20);
}
