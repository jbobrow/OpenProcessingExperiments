

//==========================================================
// sketch:  ProcessingInfo.pde    
//          show helpful diagrams of processing 2 
// descr.:  Processing is going more and more complex.
//          Therefore here a sketch to display some helpful diagrams for easier coding... 
// version: v1.0  2013-07-17   initial release
//          v1.1  2013-12-30   PVector added
//          v1.2  2014-05-13   text + font handling added
//                2014-07-10   material, light & camera handling added
//                2014-07-10   working on...
// link:    http://www.openprocessing.org/sketch/135709
// tags:    processing 2, language, help, syntax, info, information, diagram, overview
//==========================================================

String title = ">>> ProcessingInfo v1.2 <<<";

String imageNames[] = {"P2Info01.png", "P2Info02.png", "P2Info03.png"
                     , "P2Info04.png", "P2Info05.png", "P2Info06.png"
                     , "P2Info07.png", "P2Info08.png"};
                     
PImage bgImage, image1, image2;

int imageCount = imageNames.length;
int imageIndex = 0;
int xpos = -1;
int ypos = -1;
//----------------------------------------------------------
void setup()
{
  size (600,800);
  println (title);
  frameRate(10);
  bgImage = createImage(width,height,ARGB);
  selectImage (0);
}
//----------------------------------------------------------
void draw()
{
  background(bgImage);
  if (!mousePressed)
    drawSelectionTriangle();  
}
//----------------------------------------------------------
void selectImage(int image_index)
{
  imageIndex = ((image_index + imageCount) % imageCount);
  image1 = createImage(width,height,ARGB);
//  String filename = dataPath(imageNames[imageIndex]);
  String filename = imageNames[imageIndex];
  println (filename);
  image1 = loadImage(filename);
  println ("selectImage: " + imageIndex + "  size: "+image1.width+"*"+image1.height);
  bgImage.copy(image1, 0,0,image1.width, image1.height, 0,0, bgImage.width, bgImage.height);
}
//----------------------------------------------------------
void arrow (int x,int xd)
{ 
  int y = height / 2;
  triangle(x,y, x+xd,y-xd, x+xd,y+xd); 
}
//----------------------------------------------------------
// draw transparent left/right triangle symbol
void drawSelectionTriangle()
{
  int xw = width / 14;
  fill(128,128);
  noStroke();
  int x = -width / 2 + 10;
  if (mouseX > 0 && mouseX < xw) arrow(0, xw);
  else if ((mouseX > width - xw) && mouseX < width) arrow( width, -xw);
}
//----------------------------------------------------------
void keyPressed()
{
  println (" keyPressed: " + keyCode  + " '" + key + "'  " + int(key)+ "    CODED="+(key == CODED));
  if (key == CODED) 
  {
    switch (keyCode)
    {        case  33:  selectImage (imageIndex-1);  // page up
      break; case  34:  selectImage (imageIndex+1);  // page down
      break; case  37:  selectImage (imageIndex-1);  // cursor left
      break; case  38:  selectImage (imageIndex-1);  // cursor up
      break; case  39:  selectImage (imageIndex+1);  // cursor right
      break; case  40:  selectImage (imageIndex+1);  // cursor down
    }
  }
  else if (key == 8) selectImage (imageIndex-1);
  else               selectImage (imageIndex+1);
}
//----------------------------------------------------------
void mousePressed()
{
  if (xpos < 0) xpos = mouseX;
  if (ypos < 0) ypos = mouseY;
}
//----------------------------------------------------------
void mouseReleased()
{
  //println("xd=" + (xpos-mouseX) + "  yd=" + (ypos-mouseY));
  if      (mouseY - ypos < -20) selectImage (imageIndex-1);
  else if (mouseY - ypos > +20) selectImage (imageIndex+1);
  else if (mouseX - xpos < -20) selectImage (imageIndex-1);
  else if (mouseX < width / 2)  selectImage (imageIndex-1);
  else                          selectImage (imageIndex+1);
  xpos = -1;
  ypos = -1;
}


