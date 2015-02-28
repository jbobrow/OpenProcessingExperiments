
color g_clrBG = #eeeeee;
color g_clrTheme = #1a7ab0;

class Bubble{
  color fillClr = g_clrTheme;
  float w,h;
  int currentFrame;
  int animationLength;

  Bubble(){
    // default: animation length = 48 frames, start at frame zero, width and height: 100x100px
    animationLength = 48;
    currentFrame = 0;
    w = 100;
    h = 100;
  }

  // animating, simply means increasing the currentFrame counter
  void step(){
    currentFrame++;
  }

  // returns the current size factor (0..1) of the animated bubble, based on the currentFrame counter
  float currentSizeFactor(){
      return sin(PI*0.7*currentFrame/animationLength);
  }
  
  float currentWidth(){
      return w * currentSizeFactor();
  }

  float currentHeight(){
      return h * currentSizeFactor();
  }

  void draw(){
    // initialize visual style (color/stroke/fill)
    noStroke();
    fill(fillClr);
    // draw the bubble, plain and simple
    ellipse(0, 0, currentWidth(), currentHeight());
  }
}

class Ring{
  float x,y,w,h;
  Bubble inner, outer;
  
  Ring(float _x, float _y, float _w, float _h){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    inner = new Bubble();
    outer = new Bubble();

    outer.w = w;
    outer.h = h;
    
    inner.fillClr = g_clrBG;
    float thickness = random(5,15);
    inner.w = outer.w - thickness;
    inner.h = outer.h - thickness;
    // give the outer bubble's animation a head-start of 10 frames
    // to give the ring animation a more dynamic feel (grows thinner and thicker)
    outer.currentFrame = 10;
  }
  
  // step to the next frame of the animated ring
  void step(){
    inner.step();
    outer.step();
  }

  // draw the current frame of this animated ring
  void draw(){
    // save current matrix state for later restoration
    pushMatrix();
      // move drawing position to the position of this ring
      translate(x, y);
      
      // I'm not sure why, but for the in-browser version of this sketch,
      // the inner bubble has to bedrawn FIRST to be drawn on top of the outer bubble.
      // This doesn't seem to make sense but it works

      // draw inner ("empty") bubble
      inner.draw();
      // draw outer (bigger) Bubble
      outer.draw();
    // restore matrix to original state (undo the translate movement)
    popMatrix();
  }
}

ArrayList<Ring> g_rings;
Ring ring1;

void setup(){
  size(400, 300, P3D);
  //  frameRate(24);
  // enable anti-aliasing
  smooth();

  ring1 = new Ring(0, 0, 100, 100);
  g_rings = new ArrayList<Ring>();
}

void mouseClicked() {
  float size = random(50, 150);
  Ring newRing = new Ring(mouseX, mouseY, size, size);
  g_rings.add(newRing);
}

void draw(){
  background(g_clrBG);

  ring1.x = mouseX;
  ring1.y = mouseY;

  ring1.draw();
  ring1.step();
  
  for(Ring ring : g_rings){
    ring.draw();
    ring.step();
  }
}
