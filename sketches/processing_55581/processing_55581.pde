
import gifAnimation.*;

GifMaker gifExport;
PFont font;
ArrayList bPts;

int space = 2;
int len = 5;

void setup(){
  size(400,400);
  background(255);
  frameRate(5);
  smooth();
  
  //gifExport = new GifMaker(this, "export.gif");
  //gifExport.setRepeat(0); // make it an "endless" animation
  //gifExport.setTransparent(255,255,255); // make black the transparent color. every black pixel in the animation will be transparent
  
  font = loadFont("Courier-Bold-192.vlw");
  textFont(font,60);
  
  fill(0);
  text("(^_^ )",80,90);
  text("(^_^;)",80,200);
  text("(O_O;)",80,310);
  
  bPts = new ArrayList();
  loadPixels();
  for(int i=0; i<width; i+=space){
    for(int n=0; n<height; n+=space){
      if(pixels[n*width+i] == color(0)){
        bPts.add(new PVector(i,n));
      }
    }
  }
  
  background(255);
}

void draw(){
  background(255);
  for(int i = 0; i<bPts.size(); i++){
    PVector p = (PVector)bPts.get(i);
    Line l = new Line(p);
    l.draw(len);
  }
  
  //gifExport.setDelay(1);
  //gifExport.addFrame();
}

class Line{
  PVector p;
  Line(PVector _p){
    p = _p;
  }
  
  void draw(int d){
    PVector pd = new PVector(random(-10,10),random(-10,10));
    pd.normalize();
    pd.mult(d);
    PVector ps = p.get();
    ps.add(pd);
    PVector pe = p.get();
    pe.sub(pd);
    
    stroke(color(random(100),random(100),255,50));
    strokeWeight(1);
    line(ps.x, ps.y, pe.x, pe.y);
  }
}

void keyPressed() {
  //gifExport.finish();
}

