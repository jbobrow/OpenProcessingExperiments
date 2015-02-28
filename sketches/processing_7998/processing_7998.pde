
/**
 * spxlImageMasks
 * 2010-03-03 by subpixel
 * http://subpixels.com
 *
 * Playing with the PImage.mask() method
 *
 * CONTROLS
 * [SPACE] toggle paused
 * [TAB] toggle ("debug") panel
 * [1234567] random image for layer 1-7
 * [qwertyu] random mask for layer 1-7
 * [asdfghj] toggle active state for layer 1-7
 * [+]/[-] increase/decrease number of layers in use
 *
 * The above keyboard commands can all be achieved by
 * mouse position and clicking:
 * - right click for pause
 * - click near bottom of mask thumbnail to deactivate layer
 * - click upper right panel image (green) to increase layers
 * - click lower right panel image (red)   to decrease layers
 */

final int MAX_LAYERS = 7;
int numLayers = 4;

final int NUM_IMGS = 20;
final int NUM_MSKS = 10;

PImage[] imgs = new PImage[NUM_IMGS];
PImage[] msks = new PImage[NUM_MSKS];

int[] solid; // Used to "undo" mask operation

boolean paused = false;
boolean debug  = false;

int[] imgNo = new int[MAX_LAYERS];
int[] mskNo = new int[MAX_LAYERS];
boolean[] active = new boolean[MAX_LAYERS];

void setup()
{
  size(640, 480);
  frameRate(1);
  ellipseMode(RADIUS);
  colorMode(HSB, 360, 1, 1, 1);
  smooth();
  
  NumberFormat nf = new DecimalFormat("000");
  
  for (int i = 0; i < NUM_IMGS; i++)
  {
    String fileName;

    fileName = "image" + nf.format(i+1) + ".jpg";    
    println("Loading imgs["+i+"]: "+fileName);
    imgs[i] = requestImage(fileName);
  }

  for (int i = 0; i < NUM_MSKS; i++)
  {
    String fileName;

    fileName = "mask" + nf.format(i+1) + ".png";    
    println("Loading msks["+i+"]: "+fileName);
    msks[i] = requestImage(fileName);
  }
  
  // Create a "solid" alpha channel to "undo" mask() operations
  solid = new int[width*height];
  for (int i = 0; i < solid.length; i++) solid[i] = 255;
  
  for (int layer = 0; layer < MAX_LAYERS; layer++)
    active[layer] = true;
}

void draw()
{
  background(0);

  // Note: redraw() called on key presses, so can get here when paused
  if (!paused)
  {
    for (int layer = 0; layer < MAX_LAYERS; layer++)
    {
      do { imgNo[layer] = rnd(NUM_IMGS); } while (imgs[imgNo[layer]].width <= 0);
      do { mskNo[layer] = rnd(NUM_MSKS); } while (msks[mskNo[layer]].width <= 0);
    }
  }
    
  int dbw = width / (numLayers + 1);
  int dbh = height / (numLayers + 1);
  
  if (debug)
  {
    noStroke();
    // Lower row (masks): white background
    fill(0, 0, 1);
    rect(0, dbh, width, dbh);
    
    // Upper right: green (increase numLayers)
    fill(0xff00ff00); // Green
    rect(numLayers * dbw, 0, dbw, dbh);
    
    // Lower right: red (reduce numLayers)
    fill(0xffff0000); // Red
    rect(numLayers * dbw, dbh, dbw, dbh);
  }

  for (int layer = 0; layer < numLayers; layer++)
  {
    PImage img, msk;

    img = imgs[imgNo[layer]];
    msk = msks[mskNo[layer]];
    
    if (debug)
    {
      img.mask(solid);
      image(img, layer * dbw,   0, dbw, dbh); // Solid image

      msk.mask(msk);
      image(msk, layer * dbw,   0, dbw, dbh); // Overlay mask on image
    }

    // Apply mask to image    
    img.mask(msk);
  
    if (debug)
    {
      // Masked image preview on black if not active
      if (!active[layer])
      {
        int x0 = layer * dbw;
        int x1 = x0 + dbw - 1;
        fill(0xff000000);
        noStroke();
        rect(x0, dbh, dbw, dbh);
        stroke(0xffff0000);
        strokeWeight(1);
//        line(x0, 0, x1, dbh - 1);
//        line(x0, dbh - 1, x1, 0);
        line(x0, dbh, x1, dbh + dbh - 1);
        line(x0, dbh + dbh - 1, x1, dbh);
      }
      
      image(img, layer     * dbw, dbh, dbw, dbh); // Masked image

      image(img, numLayers * dbw,   0, dbw, dbh); // Combined upper
      image(img, numLayers * dbw, dbh, dbw, dbh); // Combined lower
    }
  
    for (int row = debug ? 2 : 0; row < 3; row++)
    {
      for (int col = 0; col < 4; col++)
      {
        pushMatrix();
        float x = (col + 0.5) * width  / 4 + random(-20, 20);
        float y = (row + 0.5) * height / 3 + random(-20, 20);
        translate(x,y);
        
        if (layer == 0)
        {
          float h = random(360);
          float s = random(0.8, 1);
          float b = random(0.8, 1);
          fill(h, s, b, 1);
          stroke(h, s, b * 0.75, 0.75);
          strokeWeight(14);
          float radius = random(width / 15, width / 10);
          ellipse(0, 0, radius, radius);
        }
        
        if (active[layer])
        {
          rotate(random(TWO_PI));
          scale(random(0.1, 0.3));
          image(img, -img.width>>1, -img.height>>1);
        }
        
        popMatrix();
      }
    }
  }

//  beginShape(QUADS);
//  texture(img);
//  vertex(x1,y1,0, 0,0);
//  vertex(x2,y1,0, img.width,0);
//  vertex(x2,y2,0, img.width,img.height);
//  vertex(x1,y2,0, 0,img.height);
//  endShape();
}

void keyPressed()
{
  int layer = -1;
  
  println(key);
  
  switch(key)
  {
    case ' ': togglePause(); break;
    case TAB: debug ^= true; break;

    case '1': case '2': case '3': case '4': case '5':
    case '6': case '7': case '8': case '9': case '0':
      rndImg("1234567890".indexOf(key));
      break;

    case 'q': case 'w': case 'e': case 'r': case 't':
    case 'y': case 'u': case 'i': case 'o': case 'p':
      rndMsk("qwertyuiop".indexOf(key));
      break;

    case 'a': case 's': case 'd': case 'f': case 'g':
    case 'h': case 'j': case 'k': case 'l': case ';':
      active["asdfghjkl;".indexOf(key)] ^= true;
      break;
    
    case '-': setLayers(numLayers - 1); break;
    case '+':
    case '=': setLayers(numLayers + 1); break;
  }
  
  redraw();
}

void mouseMoved()
{
  debug = mouseY < height * 0.75;
}

void mousePressed()
{
  redraw();

  if (mouseButton != LEFT)
  {
    togglePause();
    return;
  }
  
  if (!debug) return;
  
  int dbw = width / (numLayers + 1);
  int dbh = height / (numLayers + 1);
  
  if (mouseY > dbh * 2) return;

  int layer = mouseX / dbw;
  if (layer < 0 || layer >= MAX_LAYERS) return;
  
  if (layer == numLayers)
  {
    if (mouseY > dbh && numLayers > 1)
      setLayers(numLayers - 1);
    if (mouseY < dbh && numLayers < MAX_LAYERS)
      setLayers(numLayers + 1);
    return;
  }
  
  if (!active[layer])
  {
    active[layer] = true;
  }
  else if (mouseY < dbh)
  {
    rndImg(layer);
  }
  else if (mouseY > dbh * 1.7)
  {
    // Toggle activation by clicking near bottom
    active[layer] ^= true;
  }
  else
  {
    rndMsk(layer);
  }
}

void togglePause()
{
  paused ^= true;
  if (paused)
  {
    frameRate(30);
    noLoop();
  }
  else
  {
    frameRate(1);
    loop();
  }
}

void setLayers(int n)
{
  numLayers = constrain(n, 1, MAX_LAYERS);
}

void rndImg(int layer)
{
  if (0 <= layer && layer < MAX_LAYERS)
    imgNo[layer] = rndx(NUM_IMGS, imgNo[layer]);
  else
    println("rndImg(" + layer + "): illegal layer index");
}

void rndMsk(int layer)
{
  if (0 <= layer && layer < MAX_LAYERS)
    mskNo[layer] = rndx(NUM_MSKS, mskNo[layer]);
  else
    println("rndMsk(" + layer + "): illegal layer index");
}

int rnd(int n)
{
  return (int)random(n);
}

int rndx(int n, int x)
{
  int r = (int)random(n - 1);
  return r < x ? r : r + 1;
}


