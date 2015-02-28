
//import processing.opengl.*;
//import javax.media.opengl.GL;
//PGraphicsOpenGL pgl;
//GL gl;
import toxi.math.*;
import toxi.color.*;

float randSeg;
float randWeight;
float randLoc;
float maxLen;
int refresh;
int randBranches;
ArrayList flakes;
boolean pause;
PGraphics pg;
PGraphics bg;
int maxFlakes = 50;
int maxCache = 60;
int numCached;

float zoom = 0.7;
float full = .3;
int xRes = 200;
int yRes = 200;

PImage[] tex = new PImage[maxCache];
boolean[] usedTex = new boolean[maxCache];


PFont font;

void setup() {
  frameRate(30);
  for (int i = 0;i < maxCache;i++) {
    usedTex[i] = false;
  }  
  numCached = 0;
  maxLen = 50;
  noCursor();
  noStroke();
  imageMode(CENTER);  
//  size(int(screen.width * full),int(screen.height * full),OPENGL);
  size(int(screen.width * full),int(screen.height * full),P2D);
  textureMode(NORMALIZED);
//  pgl = (PGraphicsOpenGL) g; //processing graphics object
//  gl = pgl.beginGL(); //begin opengl
//  gl.setSwapInterval(1); //set vertical sync on
//  pgl.endGL(); //end opengl

  bg = createGraphics(width,height,P2D);
  ColorGradient grad = new ColorGradient();
  grad.addColorAt(0,TColor.newHSV(0.65,0.7,0.3));
  grad.addColorAt(height,TColor.newHSV(0.6,.3,.6));
  ColorList l=grad.calcGradient(0,height);
  int y=0;
  bg.beginDraw();
  bg.loadPixels();
  for(Iterator i=l.iterator(); i.hasNext();) {
    TColor c=(TColor)i.next();
    bg.stroke(c.toARGB());
    bg.line(0,y,bg.width,y);
    y++;
  }  
  bg.updatePixels();
  bg.endDraw();  
  font = loadFont("Calibri-Bold-48.vlw");
  textFont(font, 24);
}

void load() {
  flakes = new ArrayList();
  pg = createGraphics(xRes,yRes,JAVA2D);
  pg.smooth();
  pg.strokeCap(ROUND);  
  pause = false;
  randSeg = random(.05,.3);
  randWeight = random(2,maxLen*.2);
  randLoc = random(maxLen*.1,maxLen);
  randBranches = (int) random(1,20);    
  pg.beginDraw();
  pg.background(0);
  pg.smooth();
  pg.translate(pg.width/2,pg.height/2);
  float weight = 5;
  for (float j = 1; j < 6;j++) {
    weight /= j;
    pg.stroke(255,255 * j/3);
    crystal(0,0,0,maxLen,1,weight);
  }
  pg.filter(BLUR,random(0,4));      
  pg.endDraw();
  tex[numCached] = createImage(xRes,yRes,ARGB);
  tex[numCached].loadPixels();
  for (int x =0; x < xRes; x++) {
    for (int y =0; y < yRes; y++) {
      color col = pg.pixels[x+(y*xRes)];
      tex[numCached].pixels[x+(y*xRes)] = color(255,red(col));
    }
  }
  tex[numCached].updatePixels();
  numCached++;
}

void draw() {

  if (numCached < maxCache) {
    background(0);
    fill(255);
    text("Caching flakes...",width/4,height/2);
    float ratio = float(numCached) / float(maxCache);
    float amt = lerp(width/4,width-width/4,ratio);

    //tint(255,255 * ratio);
    if (numCached > 0) image(tex[numCached - 1],width-width/4 - 20,height/2 - 10,50,50);

    strokeWeight(10);
    stroke(80);
    line(width/4,(height/2) + 20,width-width/4,(height/2) + 20);    
    strokeWeight(10);
    stroke(120,120,250);
    line(width/4,(height/2) + 20,amt,(height/2) + 20);    
    noStroke();
    load();
  } 
  else {
    //      background(120,120,150);
    //    background(0);
    tint(255);
    imageMode(CORNER);
    image(bg,0,0,width,height);    
    PImage curTex = new PImage();

    for (int i = 0;i < random(0,1);i++) {
      //  if (maxFlakes > flakes.size()) {
      int used = (int)random(0,maxCache-1);
      for (int j = 0; j < maxCache; j++) {
        if (usedTex[used] == false) {
          curTex = tex[used];
          usedTex[used] = true;
          flakes.add(new Flake(curTex,used));
        } 
        else {
          continue;
        }
      }
      //      flakes.add(new Flake(curTex));
      //  }
    }
    for (int i = 0;i < flakes.size(); i++) {
      Flake curFlake = (Flake) flakes.get(i);
      if (curFlake.dead()) {
        flakes.remove(i);
        usedTex[curFlake.usedImg] = false;
      }
    }
    for (int i = 0;i < flakes.size(); i++) {
      Flake curFlake = (Flake) flakes.get(i);
      if (!pause) curFlake.fall();
      curFlake.display();
      //    if (curFlake.dead()) {
      //      flakes.remove(i);
      //    }
    }
  }
}

class Flake
{
  float xPos;
  float yPos;
  float birth;
  float age;
  float maxLife;
  float speed;
  float seed;
  int opacity;
  PImage img;
  float rot;
  float polyScale;
  float randScale;
  int usedImg;

  Flake(PImage Img,int imgNum) {
    xPos = random(-10,width+10);
    yPos = -100;
    birth = frameCount;
    speed = random(1,5);    
    maxLife = random(100,200);
    seed = random(0,20);
    opacity = 255;
    //img = createImage(200,200,RGB);
    img = Img;
    rot = random(-.04,0.05);
    polyScale = 1;
    randScale = random(40,80);
    usedImg = imgNum;
  }

  boolean dead() {
    age = frameCount - birth;
    if (yPos > height + 60 || opacity == 0) {
      return true;
    } 
    else {
      return false;
    }
  }

  void fall() {
    xPos += sin((frameCount * 0.07) + seed);
    yPos += speed;
    opacity *= .999;
  }

  void display() {    
    pushMatrix();
    translate(xPos,yPos);
    rotate(frameCount * rot);
    //    image(img,0,0);
    scale(randScale * zoom);
    poly();
    popMatrix();
  }

  void poly() {
    beginShape(QUADS);
    tint(255,255,255,opacity);    
    texture(img);
    vertex(-polyScale, -polyScale, 0, 0);
    vertex( polyScale, -polyScale, 1, 0);
    vertex( polyScale,  polyScale, 1, 1);
    vertex(-polyScale,  polyScale, 0, 1);
    endShape();
  }
}

void keyPressed() {    
  if(key=='=') zoom += .1;
  if(key=='-') zoom = abs(zoom -.1);   
  if(key=='p') pause = !pause;
}

void crystal(int start, float angle, float loc, float llength, int branches, float weightAccum) {
  int depth = start + 1;
  float segBranch = llength;
  if (depth > 3) return;
  float segLeaf = segBranch * randSeg;
  for (float rot =0;rot <360; rot += 60) {
    pg.pushMatrix();
    pg.translate(0,loc);
    for (int i = 0; i < branches /depth; i++) {
      pg.rotate(radians(angle + rot));
      pg.strokeWeight(randWeight/depth*weightAccum);
      pg.line(0,segBranch,0,0);
    }
    crystal(depth,-60.0,randLoc/depth,segLeaf,randBranches,weightAccum);
    crystal(depth,60.0,randLoc/depth,segLeaf,randBranches,weightAccum);
    pg.popMatrix();
  }
}
  

