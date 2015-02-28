
import java.util.*;

int numSources = 3;
int[] sources;
color[] scolors;
boolean[] flip;
int sheight = 0;
ArrayList<FPixel> fpixels;
float t = 0;
int zoom = 8;
PImage sediment;
PImage black;
int tick = 0;
boolean startPan = false;
float lastTime = 0;

class FPixel {
  int x;
  int y;
  int size;
  color col;
  
  FPixel(int x, int y, int size, color col) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.col = col;
  }
  
}

void setup() {
  size(480, 200);
  background(0);
  sources = new int[numSources];
  fpixels = new ArrayList<FPixel>();
  scolors = new color[numSources];
  flip = new boolean[numSources];
  for (int i = 0; i < numSources; i++) {
    sources[i] = floor(random(width/zoom));
    scolors[i] = color(random(400), random(400), random(400));
  }
  sediment = createImage(width, height, ARGB);
  //sediment.mask(sediment);
}

void setRegion(PImage img, int x, int y, int w, int h, color c, float lerp) {
  for (int j = y; j < y+h; j++) {
    if (j >= 0 && j < img.height) {
      for (int i = x; i < x+w; i++) {
        if (i >= 0 && i < img.width) {
          img.pixels[j * img.width + i] = lerpColor(img.pixels[j * img.width + i], c, lerp);
        }
      }
    }
  } 
}

void draw() {
  float m = millis();
  if (tick % 3 == 0) {
    sediment.loadPixels();
    background(0);
    for (int i = 0; i < numSources; i++) {
      int s = sources[i];
      
      //if (random(1) < 0.1) {
      if (lastTime < m - 1000) {
        fpixels.add(new FPixel(s, sheight, floor(random(3)), scolors[i]));
        
        int diff = (noise(i, s/100.0, t/500.0) < 0.5 ? -1 : 1);
        s = (flip[i] ? s + diff : s - diff);
        if (s < 0) {
          s = 0;
          flip[i] = !flip[i];
        }
        if (s > width/zoom - 1) {
          s = width/zoom - 1;
          flip[i] = !flip[i];
        }
        sources[i] = s;
      }
      fill(scolors[i]);
      noStroke();
      rect(s*zoom, sheight*zoom, zoom, zoom);
      if (random(1) < 0.001) {
        scolors[i] = color(random(400), random(400), random(400));
      }
    }
    
    Iterator<FPixel> itr = fpixels.iterator();
    while(itr.hasNext()) {
      FPixel p = itr.next();
      color c = p.col;
      color rc = color(red(c) + random(50), green(c) + random(50), blue(c) + random(50));
      fill(rc);
      rect(p.x*zoom, p.y*zoom, p.size * zoom, p.size * zoom);
      fill(rc, 150);
      rect(p.x*zoom, (p.y-p.size)*zoom, p.size * zoom, p.size * zoom);
      fill(rc, 70);
      rect(p.x*zoom, (p.y-p.size*2)*zoom, p.size * zoom, p.size * zoom);
      p.y++;
      if (p.y >= (height/zoom)-1 || ((sediment.pixels[(p.y+1) * zoom * width + p.x * zoom] >> 24) & 0xFF) > 0) {
        
        setRegion(sediment, 0, 0, sediment.width, sediment.height, color(0, 0), 0.002);
        setRegion(sediment, p.x * zoom, p.y * zoom, p.size * zoom, p.size * zoom, rc, 1);
        
        if (p.y * zoom < height/2) {
          startPan = true;
        }
        itr.remove();
      }
    }
    
    if (startPan && tick % 300 == 0) {
      for (int j = sediment.height-1; j >= 0; j--) {
        for (int i = 0; i < sediment.width; i++) {
          if (j == 0) {
            sediment.pixels[j * sediment.width + i] = 0;
          } 
          else {
            sediment.pixels[j * sediment.width + i] = sediment.pixels[(j-1) * sediment.width + i]; 
          }
        }
      }
    }
    
    sediment.updatePixels();
    image(sediment, 0, 0);
    t++;
    
    if (lastTime < m - 1000) {
      lastTime = millis();
    }
    filter(DILATE);
  }
  
  tick++;
}
