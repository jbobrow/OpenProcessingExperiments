
/**
 * Final project for Introduction to Computational Arts.
 *
 * The screen shows a drawing of a man in outer space. Pressing the space bar will
 * give it a neon light effect after which the man explodes and dissolves into space.
 *
 * Dec 2013  
 * Friso Schutte
 */
 
import ddf.minim.*;


// separate layer for the man
PGraphics manlayer;

PImage mangreenneon;
PImage spaceImage;

Minim minim;
AudioSample audioShortcircuit;
AudioSample audioExplosion;

// states 
// (somehow enum does not seem to work in my version of Processing,
//  so I'll use constants int instead)
final int STATE_NORMAL = 0;
final int STATE_GLOWING = 10;
final int STATE_READY_TO_MORPH = 20;
final int STATE_MORPHING = 30;
final int STATE_FINISHED_MORPHING = 40;

// time in millis at which point state started (so we can set delays)
int finishedMorphingTime;
int readyToMorphTime;
int explosionTriggeredTime;

// for reversing the morph direction
boolean reverseMorph; // trigger to set in reverse direction
boolean isReversedMorph; // indicates morph direction

// boolean paused state is handiest for pausing the motion (handy for making screenshots)
boolean paused;

// current state the system is in
int state;

int strokeWeight = 2;
color strokeColor = color(28,211,39);  // green

// offset for adjusting the position of the man on the screen
int imgOffsetX = 150; 
int imgOffsetY = 0;

// load the lines into a separate class called MBezier (wrapper for bezier)
MBezier[] beziers;
MyMorphBezier[] morphBeziers;

// renderer must be JAVA2D for export to applet 
String renderer = JAVA2D;

void setup() {
  size(800,800, renderer);
  smooth();
  strokeWeight(strokeWeight);
  noFill();
  // offset to match with image is 120, 50
  beziers = loadBeziers(mancoordinates, 2, 120 +imgOffsetX, 50 +imgOffsetY);
  
  manlayer = drawManlayer(beziers);
  
  spaceImage = loadImage("space3.png");
  mangreenneon = loadImage("manstaand1-neongreen.png");  //img is 400x800
  
  minim = new Minim(this);
  audioExplosion = minim.loadSample("explosion2.wav");
  audioShortcircuit = minim.loadSample("shortcircuit3.wav");
}

void draw() {
  if (paused) return;
  
  background(spaceImage);
  switch (state) {
    case STATE_GLOWING: {
       if (frameCount % 5 != 0) image(mangreenneon, imgOffsetX,imgOffsetY);
       break;
    }
    case STATE_READY_TO_MORPH: {
       image(manlayer, 0, 0);
       if (frameCount % 10 != 0) image(mangreenneon, imgOffsetX,imgOffsetY);
       // wait for 1 sec before really morphing
       int timePassed = millis() - readyToMorphTime;
       int WAIT_TIME = 1600;
       if (timePassed > WAIT_TIME) {
         state = STATE_MORPHING;
         audioExplosion.trigger();
         explosionTriggeredTime = millis();
       }
       break;
    }
    case STATE_MORPHING: {
      // build in delay to synchronize audio with graphics
      int timePassed = millis() - explosionTriggeredTime;
      int WAIT_TIME = 300;
      if (timePassed < WAIT_TIME) {
        image(manlayer, 0, 0);
        if (frameCount % 5 != 0) image(mangreenneon, imgOffsetX,imgOffsetY);
      } else {
         boolean allPartsFinished = true;
         for (MyMorphBezier m : morphBeziers) {
            if (reverseMorph) m.reverse();
            boolean finished = m.update();
            if (!finished) {
               allPartsFinished = false;
            } else {
              m.reset();
            }
         }
         reverseMorph = false;
         if (allPartsFinished) {
           state = STATE_FINISHED_MORPHING;
           finishedMorphingTime = millis();
           //println("Morphing duration: "+(finishedMorphingTime-readyToMorphTime));
         }
      }
      break;
    }
    case STATE_FINISHED_MORPHING: {
       // wait for 1 sec before going back to normal, unless we're in reversed mode
       if (isReversedMorph) {
         state = STATE_NORMAL;
       } else {
         int timePassed = millis() - finishedMorphingTime;
         int WAIT_TIME = 1000;
         if (timePassed > WAIT_TIME) {   
           state = STATE_NORMAL;
         }
       }
       break;
     }  
     default:  //case STATE_NORMAL:
      image(manlayer, 0, 0);
  }
}
 
void keyPressed() {
  if (key == ' ') {
    state = STATE_GLOWING;
    audioShortcircuit.trigger();
  }
} 

void keyReleased() {
  if (key == 's' || key == 'S') {
    // Saves  frame as screen-000001.png, screen-000002.png, etc.
    saveFrame("screen-######.png");
  } else if (key == ' ' && (state == STATE_GLOWING || state == STATE_NORMAL)) {
    morphBeziers = loadMorphBeziers(beziers);
    state = STATE_READY_TO_MORPH;
    isReversedMorph = false;
    readyToMorphTime = millis();
  } else if (key == 'r' && state == STATE_MORPHING) {
    reverseMorph = true;
    isReversedMorph = !isReversedMorph;
  } else if (key == 'p') {
    paused = !paused;
  }
}



// extra functions and classes

// load a set of lines/beziers into an array of MBezier objects
MBezier[] loadBeziers(float[][] lines, float scale, float offsetX, float offsetY) {
  float[] r;
  MBezier[] b = new MBezier[lines.length];
  for (int i=0; i < lines.length; i++) {
    if (lines[i].length == 4) {
      // if only 4 points are provided than make straight bezier
      r = new float[] {
        lines[i][0],lines[i][1],lines[i][0],lines[i][1],
        lines[i][2],lines[i][3],lines[i][2],lines[i][3]
      };
    } else {
       // otherwise 8 points should have been provided which match a bezier
        r = lines[i];
    }
    // translate and scale
    for (int j=0; j < r.length; j++) {
      r[j] = r[j] * scale;
      if (j % 2 == 0) {
        r[j] = r[j] + offsetX;
      } else {
        r[j] = r[j] + offsetY;
      }
    }
    b[i] = new MBezier(r[0],r[1],r[2],r[3],r[4],r[5],r[6],r[7]);
   }  
  return b;
}

// create an array of MyMorphBezier objects morphing each
// MBezier in the given input to a random point on the canvas
// This function actually creates a method for morphing and you can choose anyway you like
// here considering that you can morph any bezier into any other bezier.
MyMorphBezier[] loadMorphBeziers(MBezier[] mbeziers) {
  float toX, toY;
  MBezier toBezier;
  MyMorphBezier[] m = new MyMorphBezier[mbeziers.length];
  for (int i=0; i < mbeziers.length; i++) {
    toX = random(width);
    toY = random(height);
    toBezier = new MBezier(toX,toY,toX-5,toY-5,toX+5,toY+5,toX,toY);
    m[i] = new MyMorphBezier(mbeziers[i], toBezier);
  }
  return m;
}

// draw the man on a separate PGraphics layer
// the man is drawn by several bezier curves, wrapped in the given array of MBezier objects
PGraphics drawManlayer(MBezier[] mbeziers) {
  //PGraphics layer = createGraphics(400,800, P2D);
  PGraphics layer = createGraphics(width, height, renderer);
  
  layer.beginDraw();
  layer.smooth();
  layer.stroke(strokeColor); 
  layer.strokeWeight(strokeWeight);
  layer.background(0,0);
  
  layer.noFill();
  float[] r;
  for (int i=0; i < mbeziers.length; i++) {
    r = mbeziers[i].getAsArray();
    layer.bezier(r[0],r[1],r[2],r[3],r[4],r[5],r[6],r[7]);
   }  
   layer.endDraw();
   return layer;
}



// wrapper class for beziers
class MBezier {
 // for elk punt hebben we een origin en current value
 // mbv origin kunnen we altijd terug naar waar hij vandaan kwam
 float x1,y1,x2,y2,x3,y3,x4,y4;
 float ox1,oy1,ox2,oy2,ox3,oy3,ox4,oy4;
 float[] asArray;
 MBezier (float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
   float maxX = max(new float[]{x1,x2,x3,x4});
   float maxY = max(new float[]{y1,y2,y3,y4});
   float minX = min(new float[]{x1,x2,x3,x4});
   float minY = min(new float[]{y1,y2,y3,y4});
   this.ox1=x1; this.ox2=x2;this.ox3=x3;this.ox4=x4;
   this.oy1=y1; this.oy2=y2;this.oy3=y3;this.oy4=y4;
   this.x1=x1; this.x2=x2;this.x3=x3;this.x4=x4;
   this.y1=y1; this.y2=y2;this.y3=y3;this.y4=y4;
   asArray = new float[] {x1,y1,x2,y2,x3,y3,x4,y4};
 }  
 float[] getAsArray() {
   return asArray; 
 }
}

// class for the transformation of one bezier into another bezier
// the update() method draws the actual beziers on the main canvas
class MyMorphBezier {
  final int STEPS = 240;
  MBezier mb1,mb2;
  int i=0;
  // tuples of x,y symbolizing current position
  float[][] pos;
  // tuples of incX,incY symbolizing the increase for movement
  float[][] inc;
  
  boolean reverse;
  MyMorphBezier(MBezier mb1, MBezier mb2) {
    this.mb1 = mb1; this.mb2 = mb2;
    init(mb1, mb2);
  }
  void reverse() {
    i = STEPS -i;
    reverse = !reverse;
  }
  private void init(MBezier mb1, MBezier mb2) {
    i = 0;
     float dx1 = mb2.x1 - mb1.x1; 
     float dx2 = mb2.x2 - mb1.x2;
     float dx3 = mb2.x3 - mb1.x3;
     float dx4 = mb2.x4 - mb1.x4;
     float dy1 = mb2.y1 - mb1.y1; 
     float dy2 = mb2.y2 - mb1.y2;
     float dy3 = mb2.y3 - mb1.y3;
     float dy4 = mb2.y4 - mb1.y4;

     pos = new float[][]{
      {mb1.x1,mb1.y1}, {mb1.x2,mb1.y2}, {mb1.x3,mb1.y3}, {mb1.x4,mb1.y4}
     };
     inc = new float[][]{
      {mymap(dx1),mymap(dy1)}, {mymap(dx2),mymap(dy2)}, 
      {mymap(dx3),mymap(dy3)}, {mymap(dx4),mymap(dy4)}
     };      
  }
  // update() returns true if finished
  boolean update() {
     if (i < STEPS) {        
       for (int j=0; j < pos.length; j++) {
         float incX = inc[j][0];
         float incY = inc[j][1];
         if (reverse) { incX = -incX; incY = -incY;}
         pos[j][0] += incX;  // update x position
         pos[j][1] += incY;  // update y position
       }        
         i++;
     }
     stroke(strokeColor);
     bezier(pos[0][0],pos[0][1], pos[1][0],pos[1][1], pos[2][0],pos[2][1], pos[3][0],pos[3][1]);
     return (i >= STEPS);
  }
  void reset() {
    init(mb1, mb2);
  }
  private float mymap(float scale) {
     // map value 1 to from scale 0-100 to scale 0-scale
     return map(1, 0, STEPS, 0, scale);   
  }
}

// these are the coordinates for the man (crafted manually)
float[][] mancoordinates = new float[][] {
 {27,6,35,5},
 {35,5,37,15},
 {37,15,54,39,50,28,57,67},
 {44,57,67,70,48,75,46,87}, //schouder
 {26,9,32,21},
 {32,21,39,29},
 {30,28,47,30,47,30,50,38},
 {30,28,21,40},
 {21,40,26,55},
 {27,56,41,60},  //10
 {43,59,50,38},
 {21,41,21,54,21,52,23,57},
 {26,55,8,76,11,67,8,107},
 {8,107,16,126},
 {18,73,22,95},
 {22,95,15,104,24,110,16,125},
 {35,69,33,93},
 {25,96,31,94},
 {34,95,34,103,36,95,23,127},
 {16,125,22,129}, //20
 {16,126,10,132,12,128,10,140},
 {10,140,20,140},
 {23,131,20,138},
 {41,80,34,107,34,106,41,121},  //rug
 {46,87,45,106},
 {45,106,63,145,63,138,51,159},
 {48,135,51,146,50,153,36,156},  //bil
 {51,159,60,198},
 {60,198,73,208,70,212,72,265},
 {20,140,25,163,31,180,46,204},  //30
 {25,165,16,190},
 {16,191,16,205,10,197,9,235},
 {35,186,26,204,36,200,17,237},
 {20,232,27,235},
 {9,236,5,250,1,246,9,251},
 {9,251,21,245,24,241,27,236},
 {46,204,49,218,50,216,50,216},  //knie
 {47,202,54,200},
 {50,216,63,268},
 {63,268,45,280,45,279,53,283},  //40
 {72,265,77,274},
 {54,283,72,276,73,284,77,274}
};



