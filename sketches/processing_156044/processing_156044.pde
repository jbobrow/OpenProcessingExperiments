

//==========================================================
// sketch: PG_Sand_Trickle_Down.pde - by Gerd Platl
//
// Basic code by C.Reas and B.Fry, Processing. page 340
//
// v1.0  2014-07-30  inital release
//       2014-07-31  working on...
//
// tags: sand, trickle, down, pixel, animation, faces
//
// tested with:   processing v1.5.1, v2.2.1
//==========================================================

/** Sand trickle down over famous faces.
Move mouse up and down to change verticle sand speed.
*/

int num = 80000;  
int[] x = new int[num];  
int[] y = new int[num]; 
int picIndex, maxpixel;
color sandColor = color (232,235,142);
PImage img;
//String names[];
String names[] = {
  "Albert_Einstein.png", 
  "Bruce_Willis.png",
  "Charlie_Chaplin.png", 
  "Marilyn_Monroe.png", 
  "Salvador_Dali.png"};

//--------------------------------------
void setup()
{
  size(480, 600);
  maxpixel = height * width;
  loadNextPicture();
}
//--------------------------------------
void draw()
{
  background(0);
  loadPixels();
  int offset = 0;
  for (int si = 0; si < num; si++)
  {
    color c = img.get(int(x[si]), int(y[si])); 
    float b = 0.8 - brightness(c) / 222.0;
    float speed = 0.05 + b*b;           
    y[si] += speed*(6+(mouseY *16) / height);                 
    offset = y[si]*width + x[si];
    if (offset < maxpixel)
      pixels[offset] = sandColor;
    else
    {                       
      //x[si] = 0;                               
      x[si] = round(random(width));
      y[si] = round(random(height));
    }
    
  }
  updatePixels();
}
//--------------------------------------
void restart()
{
  for (int si = 0; si < num; si++)
  {  
    x[si] = round(random(width));
    y[si] = round(random(height));
  }
  stroke(255);
}
//--------------------------------------
void loadNextPicture()
{
  // create dynamic file list 
//  File file = new File(dataPath(""));
//  names = file.list();
  
  picIndex = (picIndex+1) % names.length;
  String filename = names[picIndex];
  println ("loading "+filename);
  img = loadImage(filename);
  restart();
}
//--------------------------------------
void mousePressed()
{
  if (mouseButton == LEFT)
    loadNextPicture();
  else restart();
}
//--------------------------------------
void keyPressed()
{
  if      (key == 'r') restart();
  else if (key == 's') save ("TrickleDown.png");
  else loadNextPicture();
}


