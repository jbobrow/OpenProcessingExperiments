
import controlP5.*;

ControlP5 controls;
boolean debug;

int particleSize;
int particleRate;
int blurRadius;

ArrayList particles;
PImage canvas;
PImage oldCanvas;
float startX, startY;
color brush;

void setup() {
  size(500, 500);
  
  debug = false;
  controls = new ControlP5(this);
  controls.hide();
  controls.addSlider("particle size", 0, 50, 2, 15, 15, 100, 10);
  controls.addSlider("particle spawn rate", 0, 50, 15, 15, 30, 100, 10);
  controls.addSlider("blur radius", 0, 50, 2, 15, 45, 100, 10);
  
  particleSize = 2;
  particleRate = 25;
  blurRadius = 2;
  
  particles = new ArrayList();
  
  canvas = createImage(width, height, RGB);
  oldCanvas = createImage(width, height, RGB);
  oldCanvas.loadPixels();
  for(int y = 0; y < height; y++)
  {
    for(int x = 0; x < width; x++)
    {
      oldCanvas.pixels[x + y * width] = color(255, 255, 255);
    }
  }
  oldCanvas.updatePixels();
}

void draw() {
  oldCanvas.loadPixels();
  for(int n = particles.size() - 1; n >= 0; n--)
  {
    particle p = (particle)particles.get(n);
    p.vx *= 0.94;
    p.vy *= 0.94;
    p.x += p.vx;
    p.y += p.vy;
    if(abs(p.vx) < 1.3 && abs(p.vy) < 1.3)
    {
      particles.remove(n);
      continue;
    }
    if(p.x < 1 || p.x > width - 1 || p.y < 1 || p.y > height - 1)
    {
      particles.remove(n);
      continue;
    }
    if(abs(p.vx) > 0 || abs(p.vy) > 0)
    {
      if(p.vx > p.vy)
      {
        if(p.y < height - p.y)
          p.vy -= 0.1 * 1 / sqrt(sq(p.vx) + sq(p.vy));
        else
          p.vy += 0.1 * 1 / sqrt(sq(p.vx) + sq(p.vy));
      }
      else
      {
        if(p.x < width - p.x)
          p.vx -= 0.1 * 1 / sqrt(sq(p.vx) + sq(p.vy));
        else
          p.vx += 0.1 * 1 / sqrt(sq(p.vx) + sq(p.vy));
      }
    }
    
    for(int y = (int)(p.y - particleSize / 2); y <= (int)(p.y + particleSize / 2); y++)
    {
      for(int x = (int)(p.x - particleSize / 2); x <= (int)(p.x + particleSize / 2); x++)
      {
        oldCanvas.pixels[x + y * width] = p.c;
      }
    }
    /*oldCanvas.pixels[(int)p.x + 1 + (int)p.y * width] = p.c;
    oldCanvas.pixels[(int)p.x - 1 + (int)p.y * width] = p.c;
    oldCanvas.pixels[(int)p.x + ((int)p.y + 1) * width] = p.c;
    oldCanvas.pixels[(int)p.x + ((int)p.y - 1) * width] = p.c;*/
  }
  oldCanvas.updatePixels();
  canvas.loadPixels();
  System.arraycopy(oldCanvas.pixels, 0, canvas.pixels, 0, oldCanvas.pixels.length);
  canvas.updatePixels();
  fastblur(canvas, blurRadius);
  image(canvas, 0, 0);
}

class particle {
  float x, y, vx, vy;
  color c;
  
  particle(float ax, float ay, float avx, float avy, color ac) {
    x = ax;
    y = ay;
    vx = avx;
    vy = avy;
    c = ac;
  }
}

void controlEvent(ControlEvent e) {
  if(e.controller().name() == "blur radius")
  {
    blurRadius = (int)e.controller().value();
  }
  if(e.controller().name() == "particle spawn rate")
  {
    particleRate = (int)e.controller().value();
  }
  if(e.controller().name() == "particle size")
  {
    particleSize = (int)e.controller().value();
  }
}

void mousePressed() {
  startX = mouseX;
  startY = mouseY;
  brush = color(random(255), random(255), random(255));
}

void mouseDragged() {
  if(!debug)
  {
    PVector v = new PVector(mouseX - startX, mouseY - startY);
    v.normalize();
    v.mult(random(1, 12));
    for(int i = 0; i < particleRate; i++)
    {
      particles.add(new particle(mouseX + random(-10, 10), mouseY + random(-10, 10), v.x + random(-0.1, 0.1), v.y + random(-0.1, 0.1), brush));
    } 
  }
}

void keyPressed() {
  if(keyCode == 116)
  {
    if(debug)
      controls.hide();
    else
      controls.show();
    debug = !debug;
  }
}

void fastblur(PImage img,int radius){
  if (radius<1){
    return;
  }
  int w=img.width;
  int h=img.height;
  int wm=w-1;
  int hm=h-1;
  int wh=w*h;
  int div=radius+radius+1;
  int r[]=new int[wh];
  int g[]=new int[wh];
  int b[]=new int[wh];
  int rsum,gsum,bsum,x,y,i,p,p1,p2,yp,yi,yw;
  int vmin[] = new int[max(w,h)];
  int vmax[] = new int[max(w,h)];
  int[] pix=img.pixels;
  int dv[]=new int[256*div];
  for (i=0;i<256*div;i++){
     dv[i]=(i/div); 
  }
  
  yw=yi=0;
 
  for (y=0;y<h;y++){
    rsum=gsum=bsum=0;
    for(i=-radius;i<=radius;i++){
      p=pix[yi+min(wm,max(i,0))];
      rsum+=(p & 0xff0000)>>16;
      gsum+=(p & 0x00ff00)>>8;
      bsum+= p & 0x0000ff;
   }
    for (x=0;x<w;x++){
    
      r[yi]=dv[rsum];
      g[yi]=dv[gsum];
      b[yi]=dv[bsum];

      if(y==0){
        vmin[x]=min(x+radius+1,wm);
        vmax[x]=max(x-radius,0);
       } 
       p1=pix[yw+vmin[x]];
       p2=pix[yw+vmax[x]];

      rsum+=((p1 & 0xff0000)-(p2 & 0xff0000))>>16;
      gsum+=((p1 & 0x00ff00)-(p2 & 0x00ff00))>>8;
      bsum+= (p1 & 0x0000ff)-(p2 & 0x0000ff);
      yi++;
    }
    yw+=w;
  }
  
  for (x=0;x<w;x++){
    rsum=gsum=bsum=0;
    yp=-radius*w;
    for(i=-radius;i<=radius;i++){
      yi=max(0,yp)+x;
      rsum+=r[yi];
      gsum+=g[yi];
      bsum+=b[yi];
      yp+=w;
    }
    yi=x;
    for (y=0;y<h;y++){
      pix[yi]=0xff000000 | (dv[rsum]<<16) | (dv[gsum]<<8) | dv[bsum];
      if(x==0){
        vmin[y]=min(y+radius+1,hm)*w;
        vmax[y]=max(y-radius,0)*w;
      } 
      p1=x+vmin[y];
      p2=x+vmax[y];

      rsum+=r[p1]-r[p2];
      gsum+=g[p1]-g[p2];
      bsum+=b[p1]-b[p2];

      yi+=w;
    }
  }
}

