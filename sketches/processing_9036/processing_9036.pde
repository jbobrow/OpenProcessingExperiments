
/*
 * Spark Shower
 * David Zwarg - david.a@zwarg.com
 *
 * A simulation of sparks showering off the mouse. Dragging the cursor across the canvas
 * generates 'sparks' off the background.  They shower down and glow down to embers 
 * as they age.
 */

//import processing.opengl.*;

// the sparks thrown
Spark[][] sparks;
int idx;

void setup() {
  size(500, 500, P3D);
  sparks = new Spark[width][];
  idx = 0;
  background(0);
}

void draw() {
  // instead of setting the background everytime
  // fade the current drawing out a tiny bit
  fill(0,50);
  rect(0,0,width,height);
  
  // draw all sparks
  for (int i=0;i<sparks.length;i++) {
    if (sparks[i] != null) {
      for (int j=0;j<sparks[i].length;j++)
        sparks[i][j].draw();
    }
  }
}

void mouseDragged() {
  // create a new set of sparks for the current position
  sparks[idx] = new Spark[50];
  for (int i=0;i<sparks[idx].length;i++) {
     sparks[idx][i] = new Spark(mouseX, mouseY, pmouseX, pmouseY);
  }
  // increment the count of sparks
  idx = (idx + 1) % sparks.length;
}

class Spark {
  color from = color(255,255,0);
  color to = color(60,0,0);
  // position
  float x, y;
  // velocity
  float u, v;
  // intensity
  float i;
  // age
  int age;
  
  public Spark(int mX, int mY, int pX, int pY) {
    i = random(sqrt((mX-pX)*(mX-pX)+(mY-pY)*(mY-pY)));
    x = (mX + pX) / 2;
    y = (mY + pY) / 2;
    // random dir for sparks
    u = random(-10,10);
    v = random(-10,10);
  }
    
  public void draw() {
    float x1 = i * cos(u);
    float y1 = i * sin(v) + 0.05 * age * i; 
    // if the position won't move by 1 px or more, don't draw
    if ( x1 < 1 && y1 < 1 )
      return;
    // if the spark is too old, don't draw
    if ( age > 100 )
      return;
      
    color lerped = lerpColor(from,to, age/100f); 
    stroke(lerped);
    beginShape(LINES);
    vertex((int)x,(int)y);

    // the next x coordinate
    x += x1;
    y += y1;
    i *= 0.99;
    
    vertex((int)x,(int)y);
    endShape();

    // age a little
    age++;
  }
}

