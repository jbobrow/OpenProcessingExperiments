
PImage gradient, bufor;
int offset=0, i=0, ox=65536, oy=65536;
float nma=0;

void setup() {
  size(640, 480);
  fill(255, 0, 128);
  gradient = loadImage("gradient.png");
  gradient.loadPixels();
  noiseDetail(20, 0.68);
}

void draw() {
  float s = (key=='+') ? 0.001 : (
    (key=='-') ? 0.01 : 0.003162278
  );
  
  int offsetM = min(height, offset+32);
  float xx,yy,v,vv,zlo,FOUR_PI=2*TWO_PI;
  loadPixels();
  for(int y=offset; y<offsetM; ++y)
    for(int x=0; x<width; ++x) {
      xx = float(x+ox) * s;
      yy = float(y+oy) * s;
      
      float n = sin(noise(yy/8, xx/8, 241)*10);
      if(key=='d'){
        pixels[i++] = color(n*255);
        continue;
      }
      
      zlo = noise(0, xx/4, yy/4);
      zlo = cos(zlo * TWO_PI) / 2 - 0.5;
      zlo = cos(asin(zlo) * 2 + TWO_PI);
      zlo = (cos((zlo+5)*HALF_PI) + 1) / 2;
      
      v = noise(xx, yy);
      if(mousePressed)
        v = lerp(v, noise(noise(xx, yy), noise(yy, xx)), zlo / 2);
      
      vv = noise(yy, xx, 133);
      vv = 1 - abs(vv - 0.5) * 2;
      vv = (cos(vv * FOUR_PI - TWO_PI) + 1) / 2;
      vv = asin(vv) / HALF_PI;
      vv = 1 - vv;
      
      v = (cos(v * FOUR_PI - TWO_PI) + 1) / 2;
      v = asin(v) / HALF_PI;
      
      if(key=='z')
        v=vv;
      else
        v = lerp(v, vv, n*0.9);
      
      if(v<0)v=0;
      if(v>1)v=1;
      if(zlo<0)zlo=0;
      if(zlo>1)zlo=1;
      
      pixels[i++] = gradient.pixels[
        int(v*255) + int(zlo*255) * 256
      ];
    }
  updatePixels();
  
  offset += 32;
  if(offset>=height) {
    offset=0;
    i=0;
  }
}

void mouseClicked() {
  ox += mouseX - (width / 2);
  oy += mouseY - (height / 2);
}

