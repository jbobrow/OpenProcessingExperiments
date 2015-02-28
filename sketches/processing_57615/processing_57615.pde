
// draw birds or other things if you want

// palette engine
// pixel engine
// tools
// hotkey
// loadsave
// resize window

/*
// keys
 
 1,2,3,4... palettes
 hold key to open a swatch for that color
 gives +- hue, brightness, saturation, etc
 
 z secondary color
 
 q,e,r,t,f.. tools
 selection
 pen
 ellipse
 rect
 line
 
 w,a,s,d movement
 arrow keys do same thing
 
 mouse
 m1 place color
 m2 place secondary
 wheel zoom
 
 tab palette editor
 "quantize"
 "sort"
 "ramp"
 "load"
 "save"
 
 alpha fade everything
 animations
 transform color
 
 v1.
 tools
 palette
 
 v2.
 layers
 
 v3.
 animation
 
 */

String settingsFile = "./b.i.r.d.s";
String defaultSettings[] = {
  "image.png", "1024", "768"
};

// o fuk static global class wut u kno bout me
PGraphics render;
PGraphics img;
PGraphics amask;
palette p;
keymanager keyman;
color c1;
color c2;
cursr curs;
boolean doonce = false;

float zoom;
PVector offset;

void setup()
{
  // setup
  size(640, 480);

  /*String data[] = loadStrings(settingsFile);
   if (data == null)
   saveStrings(settingsFile, defaultSettings);
   else
   {
   //img = loadImage(data[0]);
   }*/
  zoom = 1.0;
  offset = new PVector(0, 0);
  curs = new cursr(1.0);
  keyman = new keymanager();
  render = createGraphics(256, 256, P2D);
  img = createGraphics(256, 256, P2D);
  amask = createGraphics(256, 256, P2D);
  //amask.fill(color(255));
  //amask.rect(0,0,255,255);

  c1 = color(255, 0, 0);
  c2 = color(0, 255, 255);

  p = new palette();
  p.set(0, color(255, 0, 0));
  p.set(1, color(0, 255, 0));
  p.set(2, color(0, 0, 255));
}

void draw()
{
  if (!doonce)
  {
    //frame.setUndecorated(true);
    doonce = true;
  }

  background(128);
  keyman.update();

  pushToScreen(null);
  noFill();
  stroke(0);
  //imageMode(CENTER);
  //rect(-img.width/2, -img.height/2, img.width, img.height);
  //rect(0, 0, img.width, img.height);
  img.mask(amask);
  image(img, 0, 0);
  popMatrix();
}

void keyPressed()
{
  keyman.keydown();
}

void keyReleased()
{
  keyman.keyup();
}

void pushToScreen(PGraphics sur)
{
  if (sur == null)
  {
    pushMatrix();
    translate(offset.x, offset.y);
    scale(zoom, zoom);
  }
  else
  {
    sur.pushMatrix();
    sur.translate(offset.x, offset.y);
    sur.scale(zoom, zoom);
  }
}

void pushFromScreen(PGraphics sur)
{
  if (sur == null)
  {
    pushMatrix();
    scale(1/zoom, 1/zoom);
    translate(-offset.x, -offset.y);
  }
  else
  {
    sur.pushMatrix();
    sur.scale(1/zoom, 1/zoom);
    sur.translate(-offset.x, -offset.y);
  }
}


