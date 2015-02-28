
int GS = 5;
ArrayList<ob> obstacs;
int t;
PFont f1;
PFont f2;
float cx;
float cy;
float pcx;
float pcy;
boolean grabbed = true;
int hiscore;
int pvscore;

void setup() {
  size(600, 450);
  fill(0);
  background(255);
  noStroke();
  f1 = loadFont("Gulim-40.vlw");
  f2 = loadFont("Gulim-20.vlw");
  obstacs = new ArrayList<ob>();
  smooth();
}

void draw() {
  ri();
  if(GS == 5) {
    textFont(f2);
    fill(255, 255, 255, 100);
    stroke(0);
    rect(0, 0, width-1, height-1);
    fill(0);
    st5();
    loadPixels();
    blur(3);
    updatePixels();
    translate(3, 0);
    st5();
    translate(-3, 0);
    if(keyPressed)
      GS = 0;
    t = 0;
  }
  if(GS == 0) {
    textFont(f1);
    stroke(0);
    fill(255, 255, 255, 100);
    rect(0, 0, width-1, height-1);
    fill(0);
    st();
    loadPixels();
    blur(3);
    updatePixels();
    translate(3, 0);
    st();
    translate(-3, 0);
    if(mousePressed&&mouseButton==RIGHT) {
      grabbed = true;
      GS = 1;
      cx = width/2;
      cy = height/2;
    }
    t = 0;
  }else if(GS == 1) {
    pvscore = t;
    if(t>10000)
      frameRate(1000000000);
    else
      frameRate(70);
    if(t%200==0||t%500==0)
      obstacs.add(new ob(t + width + 100));
    if(random(1000)>1000-float(t)/100)
      obstacs.add(new ob(t + width + 100, 100));
    if(t%10==0) {
      obstacs.add(new ob(t + width + 100, 5, 3, 3));
      obstacs.add(new ob(t + width + 100, 5, 3, height - 6));
    }
    fill(255, 255, 255, 60);
    stroke(0);
    rect(0, 0, width-1, height-1);
    fill(0);
    lipse();
    loadPixels();
    blur(2);
    updatePixels();
    translate(3, 0);
    lipse();
    lisp2();
    translate(-3, 0);
    fill(255);
    translate(-3, 0);
    text(t, 20, 60);
    fill(0);
    translate(3, 0);
    text(t, 20, 60);
    if(t>hiscore)
      hiscore = t;
    for(int i = obstacs.size()-1; i >= 0; i--) {
      if(obstacs.get(i).finished(t))
        obstacs.remove(i);
    }
    for(ob b:obstacs)
      if(b.intersects((int)cx, (int)cy, t)) {
        GS = 3;
        t = 0;
      }
  }else if(GS == 3) {
    fill(255, 255, 255, 20);
    rect(0, 0, width, height);
    if(t>40) {
      background(255);
      GS = 0;
    }
  }
  t++;
  pcx = cx;
  pcy = cy;
}

void ri() {
  if(grabbed) {
    
    cx = mouseX;
    cy = mouseY;
    
    /*
    float v = 3;
    if(keyPressed) {
      if(keyCode==UP)
        cy-=v;
      if(keyCode==DOWN)
        cy+=v;
      if(keyCode==LEFT)
        cx-=v;
      if(keyCode==RIGHT)
        cx+=v;
    }
    */
  } else {
    if(cx>10)
      cx--;
  }
}

void keyPressed() {
  if(key=='G'||key=='g')
    grabbed = !grabbed;
}

void mousePressed() {
  if(mouseButton==LEFT)
    grabbed = !grabbed;
}

void st() {
  text("High Score: " + hiscore, 70, 240);
  text("Previous Score: " + pvscore, 70, 180);
  text("Right click to start!", 70, 90);
}

void st5() {
  textFont(f1);
  text("Happy Mother's Day!", 10, 40);
  textFont(f2);
  text("This is a little game I made for you. Simply move\naround the black obstacles in your way.", 10, 100);
  text("But...\nYou do have a little help. You are able to teleport\nbetween places. To do this, find a safe location,\nthen click. Then move your mouse to the new\nlocation, and click again. Poof! You've teleported!\nPress any key to begin.", 10, 160);
}

void lisp2() {
  for(ob b:obstacs)
   b.disp(t);
}

void lipse() {
  stroke(0);
  strokeWeight(20);
  line(cx, cy, pcx, pcy);
  strokeWeight(0);
  noStroke();
  if(!grabbed) {
    noFill();
    stroke(0);
    ellipse(mouseX, mouseY, 20, 20);
  }
}

public class ob {
  float x;
  float y;
  float w;
  float h;
  public ob(int t0) {
    w = random(100);
    h = random(100);
    x = t0;
    y = random(height-h);
  }
  public ob(int t0, int s) {
    w = random(s);
    h = random(s);
    x = t0;
    y = random(height-h);
  }
  public ob(int t0, int w2, int h2, int y2) {
    w = w2;
    h = h2;
    x = t0;
    y = y2;
  }
  public void disp(int time) {
    fill(0);
    translate(-time, 0);
    rect(x, y, w, h);
    translate(time, 0);
  }
  boolean intersects(int mx, int my, int t) {
    return isCollidingCircleRectangle(mx+t, my, 10, x, y, w, h);
  }
  boolean finished(int time) {
    if(x-time < -w - 10)
      return true;
    return false;
  }
}

void blur(int dd) {
   int[] px = new int[pixels.length];
   for(int d=1<<--dd; d>0; d>>=1) {
      for(int x=0;x<width;x++) for(int y=0;y<height;y++) {
        int p = y*width + x;
        int e = x >= width-d ? 0 : d;
        int w = x >= d ? -d : 0;
        int n = y >= d ? -width*d : 0;
        int s = y >= (height-d) ? 0 : width*d;
        int r = ( r(pixels[p+w]) + r(pixels[p+e]) + r(pixels[p+n]) + r(pixels[p+s]) ) >> 2;
        int g = ( g(pixels[p+w]) + g(pixels[p+e]) + g(pixels[p+n]) + g(pixels[p+s]) ) >> 2;
        int b = ( b(pixels[p+w]) + b(pixels[p+e]) + b(pixels[p+n]) + b(pixels[p+s]) ) >> 2;
        px[p] = 0xff000000 + (r<<16) | (g<<8) | b;
      }
      arrayCopy(px,pixels);
   }
}

int r(color c) {return (c >> 16) & 255; }
int g(color c) {return (c >> 8) & 255;}
int b(color c) {return c & 255; }

boolean isCollidingCircleRectangle(
      float circleX,
      float circleY,
      float rad,
      float rectangleX,
      float rectangleY,
      float rectangleWidth,
      float rectangleHeight)
{
    float circleDistanceX = abs(circleX - rectangleX - rectangleWidth/2);
    float circleDistanceY = abs(circleY - rectangleY - rectangleHeight/2);
 
    if (circleDistanceX > (rectangleWidth/2 + rad)) { return false; }
    if (circleDistanceY > (rectangleHeight/2 + rad)) { return false; }
 
    if (circleDistanceX <= (rectangleWidth/2)) { return true; }
    if (circleDistanceY <= (rectangleHeight/2)) { return true; }
 
    float cornerDistance_sq = pow(circleDistanceX - rectangleWidth/2, 2) +
                         pow(circleDistanceY - rectangleHeight/2, 2);
 
    return (cornerDistance_sq <= pow(rad,2));
}

