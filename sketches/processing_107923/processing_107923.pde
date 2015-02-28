
ArrayList rects;
Rect2D r;

void setup()
{
  size(800,500);
  background(255);
  noStroke();
  frameRate(30);
  
  rects = new ArrayList();
  r = new Rect2D(250,100,550,400);
  r.cMode = 7;
  rects.add(r);
}

void draw()
{
  
  int i,ri;
  fill(255,255,255,127);
  rect(-1,-1,width+1,height+1);
//  background(255);
  
  ri = 0;
  
  for(i=0;i<rects.size();i++){
    r = (Rect2D)rects.get(i);
    r.drawRect();
  }
  
  if(15<frameCount){
    for(i=0;i<500;i++){
      ri = int(rects.size()*random(1)*random(1));
      r = (Rect2D)rects.get(ri);
      if(256<r.s && r.mode == 0){
        if(0.5<random(1) && 2 <= r.w){
          splitRectV(ri);
          i = 500;
        }else if(2 <= r.h){
          splitRectH(ri);
          i = 500;
        }
      }
    }
  }
}

void splitRectV(int index)
{
  Rect2D rCash;
  if(index < rects.size() && rects.size()<500){
    rCash = (Rect2D)rects.get(index);
    rects.remove(index);
    rects.add(new Rect2D(rCash.x,rCash.y,rCash.x+rCash.w/2,rCash.y+rCash.h));
    rects.add(new Rect2D(rCash.x+rCash.w/2,rCash.y,rCash.x+rCash.w,rCash.y+rCash.h));
  }
}

void splitRectH(int index)
{
  Rect2D rCash;
  if(index < rects.size() && rects.size()<500){
    rCash = (Rect2D)rects.get(index);
    rects.remove(index);
    rects.add(new Rect2D(rCash.x,rCash.y,rCash.x+rCash.w,rCash.y+rCash.h/2));
    rects.add(new Rect2D(rCash.x,rCash.y+rCash.h/2,rCash.x+rCash.w,rCash.y+rCash.h));
  }
}

void mouseClicked()
{
  int i;
  boolean reset = true;
  for(i=0;i<rects.size();i++){
    r = (Rect2D)rects.get(0);
    
    if(r.mode < 4){
      r.mode = 2;
      reset = false;
    }
    
    rects.remove(0);
    rects.add(r);
  }
  if(reset){
    background(255);
    rects = new ArrayList();
    rects.add(new Rect2D(250,100,550,400));
  }
}
class Rect2D
{
  int x,y,w,h,x0,y0,x1,y1,s,t;
  int beforeX,beforeY;
  color fillColor;
  float rate;
  float vx,vy;
  int mode,cMode;
  Rect2D(int a0,int b0,int a1,int b1)
  {
      x0 = min(a0,a1);
      y0 = min(b0,b1);
      x1 = max(a0,a1);
      y1 = max(b0,b1);
      x = min(x0,x1);
      y = min(y0,y1);
      w = abs(x1-x0);
      h = abs(y1-y0);
      s = w*h;
      t = 128;
      
      beforeX = x;
      beforeY = y;
            
      mode = 0;
      cMode = int(random(8));
      
      calcV();
      calcS();
      rate = min((w+0.01)/(h+0.01),(h+0.01)/(w+0.01));
  }
  
    void drawRect()
  {
    float len0 = 0;
    float len1 = 0;
  
    fillColorSet();
    fill(fillColor);
    switch(mode) {
    case 0:
      rect(x, y, w, h);
      if (s<256) {
        mode=1;
        beforeX = x;
        beforeY = y;
      }
      break;
  
    case 1:
      x += vx;
      y += vy;
      if (width<x) {
        x=-w;
        morePale();
      }
      if (x<-w) {
        x=width;
        morePale();
      }
      if (height<y) {
        y=-h;
        morePale();
      }
      if (y<-h) {
        y=height;
        morePale();
      }
      rect(x, y, w, h);
      break;
  
    case 2:
      len0 = dist(x, y, beforeX, beforeY);
      if (t<127) {
        t++;
      }
  
      if (len0<6) {
        x = beforeX;
        y = beforeY;
        mode = 4;
      }
      else {
        len1 = dist(x+vx, y+vy, width/2, height/2)-dist(x, y, width/2, height/2);
          x += vx;
          y += vy;
          if (width<x) {
            x=-w;
          }
          if (x<-w) {
            x=width;
          }
          if (height<y) {
            y=-h;
          }
          if (y<-h) {
            y=height;
          }
        if (len1<1) {
          mode = 3;
        }
      }
      rect(x, y, w, h);
      break;
  
    case 3:
      len0 = dist(x, y, beforeX, beforeY);
      if (t<127) {
        t++;
      }
      if (len0<6) {
        x = beforeX;
        y = beforeY;
        mode = 4;
      }else{
        if (64<len0) {
          x = int(0.97*x + 0.03*beforeX + random(-1,1));
          y = int(0.97*y + 0.03*beforeY + random(-1,1));
        }else{
          x = int((x+beforeX)/2 + random(-1,1));
          y = int((y+beforeY)/2 + random(-1,1));
        }
      }
      rect(x, y, w, h);
      break;
  
    case 4:
      if (t<127) {
        t++;
      }
      rect(x, y, w, h);
      break;
    }
  }
  
  void calcV()
  {
    float len = dist((x0+x1)/2,(y0+y1)/2,width/2,height/2);
    vx = int(4*((x0+x1-width)/2)/len);
    vy = int(4*((y0+y1-height)/2)/len);
  }
  
  void calcS()
  {
    s = w*h;
  }
  
  void morePale()
  {
    if(1<t){
      t = t/2;
    }
  }
  
  void fillColorSet()
  {
    switch(cMode){
      case 0:
        fillColor = color(255,  0,  0,t);
        break;
      case 1:
        fillColor = color(255,159,  0,t);
        break;
      case 2:
        fillColor = color(255,223,  0,t);
        break;
      case 3:
        fillColor = color( 63,175, 95,t);
        break;
      case 4:
        fillColor = color(127,195, 31,t);
        break;
      case 5:
        fillColor = color( 31,175,207,t);
        break;
      case 6:
        fillColor = color(239, 63,159,t);
        break;
      case 7:
        fillColor = color(127,127,127,t);
        break;
    }
  }
}
