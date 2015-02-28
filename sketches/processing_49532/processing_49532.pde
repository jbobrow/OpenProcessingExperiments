

// sketch:   PG_TuringTunnel.pde
// purpose:  combination of a simple tunnel sketch with a turing pattern simulation
// version:  v1.0  2012-01-18
//
// for standard tunnel example see...  
//   http://processing.org/learning/topics/tunnel.html
// or for a tiny tunnel sketch
//   http://www.openprocessing.org/visuals/?visualID=3621
/*
keys:
[b] toggle bluring
[f] toggle fps
[h] toggle help
[m] toggle map
[o] toggle rotation
[p] change pattern
[r] reset
[s] save picture
[t] toggle turning simulation
[ ] blur once
[+],[-] change limits
[up],[down] change resolution
[left],[right] change iteration
*/

int ts = 512;  // 800   
PImage wallpaper;
int[] distances;
int[] angles;

void setup() 
{
  size(800, 600);
  frameRate (30);
  float w2 = width / 2.0;
  distances = new int[width*height];
  angles = new int[width*height];
  wallpaper = createImage(ts,ts,RGB);
  
  // prepare distances and angles
  for (int y=0, ni=0; y < height; y++)
  { float y1 = y - height * 0.5;
    float y2 = y1*y1;
    for (int x=0; x < width; x++, ni++) 
    { distances[ni] = (int) ((33 * ts / sqrt(sq(x - w2) + y2)) % ts);
      angles[ni] = (int) (0.5 * ts * atan2(y1, x - w2) / PI);
    }
  }
  resetTuring();
}

int shiftX = ts;
int shiftY = ts;

void tunnel(boolean animateTunnel)
{
  if (animateTunnel) 
  { shiftX = ts + frameCount;  
    shiftY = ts + frameCount*3;
  }
  loadPixels();
  for (int y = 0, ni = 0; y < height; y++) 
  { for (int x = 0; x < width; x++, ni++) 
    { int c_x = (distances[ni] + shiftX) % ts;
      int c_y = (angles[ni] + shiftY) % ts;
      pixels[ni] = wallpaper.pixels[c_x + c_y * ts];
    }
  }
  updatePixels();
}

boolean animateTunnel = true;
boolean simulateTuring = true;
boolean showMap = false;
boolean showHelp = false;
boolean showFPS = false;

void keyPressed()
{ 
  switch(key) 
  { case ' ': if (!simulateTuring) doTuring();  break;
    case 'f': showFPS = !showFPS;    break;
    case 'h': showHelp = !showHelp;  break;
    case 'm': showMap = !showMap;    break;
    case 'o': animateTunnel = !animateTunnel;    break;
    case 't': simulateTuring = !simulateTuring;  break;
    case 's': save("TuringTunnel.png");   break;
    default: keyPressed2();
  }
}

void draw()
{
  // draw img
  if (simulateTuring) doTuring();
  // draw wallpaper
  wallpaper.copy(img, 0,0, img.width, img.height, 0,0, wallpaper.width, wallpaper.height);
  // draw image
  tunnel(animateTunnel);
  // draw turing map   
  if (showMap) image(img, 22, 22);
  // draw help
  if (showHelp) text ("keys: +,-,b,f,h,m,o,p,r,s,t,cursor keys",20,14);
  // draw fps
  if (showFPS) text (round(frameRate) + " fps", width-60,20);
}


