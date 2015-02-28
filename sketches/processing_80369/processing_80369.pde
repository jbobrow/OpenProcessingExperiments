

//----------------------------------------------------------
//     file:  PG_Scrolling_Palette.pde
//     date:  v1.0  2012-11-24   initial release 
//   author:  Ing. Gerd Platl  
//  version:  tested with processing v2.0b6
//  purpose:  using the noise generator to create a color palette 
// handling:  Use left mouse button to change 'noiseDetail': 
//                  mouseY = octaves, mouseX = falloff[%]
//            Use right mouse button to change resolution:
//                  mouseX = deltaX
// see also:  Book: Processing - a programming handbook 
//                  for visual designers and artists, page 131
//----------------------------------------------------------
void setup()
{
  size(512, 400);
  textSize(52);
  text ("Scrolling Palette",40, 340);
  smooth();
}

float xnoise = 0.01;
float deltax = 0.01;
int octaves = 3;
float falloff = 0.5;

static int y1 = 136;  // diagram range
static int y2 = 280;  // y scroll left 
static int y3 = 380;  // y text

// draw a vertical line on the right side and scroll one pixel to the left
void draw()
{
  xnoise = xnoise + deltax;
  int red   = min(255,int (255 * noise(xnoise)));
  int green = min(255,int (255 * noise(xnoise+33)));
  int blue  = min(255,int (255 * noise(xnoise+77)));
  color col = color (red,green,blue);
  stroke(205);  line(width-1, 0, width-1, y1);
  stroke(0,0,222,50);  line(width-1, y1-8-blue/2,  width-1,y1-blue/2);
  stroke(0,222,0,50);  line(width-1, y1-8-green/2, width-1,y1-green/2);
  stroke(222,0,0,50);  line(width-1, y1-8-red/2,   width-1,y1-red/2);
  stroke(col);         line(width-1, y2, width-1, y1-1);
  //println (red +"  " +green +"  " +blue);
  // scroll picture one pixel to the left
  copy (1,0, width,y2, 0,0, width,y2);
}
void keyPressed()   { save("ScrollingPalette.png"); }
void mousePressed() { handleMouse(); }
void mouseDragged() { handleMouse(); }
void handleMouse()
{
  if (mouseButton == LEFT)
  { octaves = 1+(height-mouseY)*7/height;
    falloff =  float(mouseX)/width*0.5;
  }
  else if (mouseButton == RIGHT)
    deltax = 0.01 + 0.01 * mouseX / width;
  noiseDetail(octaves, falloff);

  noStroke();
  fill(205);
  rect(90, y3-16, 300, 20);
  fill(0);
  textSize(12);
  text ("deltaX"+nf(deltax,1,3),100, y3);
  text ("octaves="+octaves, 200, y3);
  text ("falloff="+round(falloff*100)+"%",300, y3);
}


