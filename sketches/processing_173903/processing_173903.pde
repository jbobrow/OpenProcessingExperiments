

//==========================================================
// sketch:   PG_SketchStarter.pde   -   by Gerd Platl
//
// Start a sketch by clicking on a sketch thumbnail...
//
// v1.0  2014-11-30  inital release
//
// tags:  sketch, start, select, menu, processing, click      
//==========================================================

final String www = "http://www.openprocessing.org/sketch/";

final String sketchIds[]
= { 
  "171308", "156044", "155380", "144424", 
  "135709", "126600", "92756" , "83423" , 
  "81870" , "63979" , "61394" , "59697" , 
  "49387" , "48157" , "45539" , "22251"
};

final int sketches = sketchIds.length;

PImage thumbnails[] = new PImage[sketches];

void setup()
{
  println (">>> SketchStarter v1.0 <<<");
  size (400, 400);
  frameRate(10);
  // create all thumbnail adresses
}

void draw()
{
  if (frameCount <= sketches)
  { // load thumbnail images
    int index = frameCount-1;
    String addr = www + "thumbnail/" + sketchIds[index] + " /cache.png";
    thumbnails[index] = loadImage(addr);
    println ("load image " + index + ": " + addr);
  }

  // draw thumbnails   
  int imgCount = min(frameCount-1, sketches);
  for (int si = 0; si < imgCount; si++)
  {
    image (thumbnails[si], (si % 4) * 100, int(si / 4) * 100);
  }
  text ((getSketchIndex()+1), mouseX + 4, mouseY - 4);
}

int getSketchIndex()
{
  return int(mouseX / 100) + int(mouseY / 100) * 4;
}

void mouseReleased()
{
  int si = getSketchIndex();
  if (si < 16)
  {
    String addr = www + sketchIds[si];
    println (si + ": start sketch  " + addr);
    link(addr, "_new");       // open a new window/tab...
  }
}

