
import java.util.Iterator;
ArrayList<Part> parts;
float w = 500;
float h = 500;
float g = 1.8;
float noiseoff=0;
//GifMaker gifExport;
color bgc = #495455;
boolean record=false;
void setup() {
  size(500, 500);
  smooth();
  background(bgc);
  frameRate(25);
  parts = new ArrayList();
//  gifExport = new GifMaker(this, "export.gif");
//  gifExport.setRepeat(0); 
  //createParticles();
}
void paint() {
  float tx = mouseX;
  float ty = mouseY;
  color c1 = #FFAEC9;
  color c2 = #B45C7B;
 
  float x = random(w);
  float y = random(h);
  float t=15+random(20);
 
  color c = lerpColor(c1, c2, random(1));
  Part p = new Part(tx, ty, random(5)+1, c);  
  p.velocity.x=0;
  p.velocity.y=0;
  p.acceleration.x=random(1)-.5;
  p.acceleration.y=random(1)-.5;
  p.life=1;
  parts.add(p);
}

void mousePressed() {
  record=true;
}
void mouseReleased() {
  record=false;
}
void draw() {
 
  //fill(bgc, 1);
  rectMode(CORNER);
  //  rect(0, 0, width, height);
  background(bgc);
  if (record) {
    paint();
  }
 
  updateParticles();
  fill(255);

  if(frameCount%5==0){
//    gifExport.setDelay(1);
//  gifExport.addFrame();
   // saveFrame("frames/screen_#####.tif");
  }
}
void updateParticles() {
  if (parts.size()>=0) {
      for (int i = parts.size()-1; i >= 0; i--) {
        Part p = (Part) parts.get(i);
      
      p.update();
      //p.render();
      if (p.life<0) {
        parts.remove(p);
      }
       
    }
        for (Part p:parts) {
 
         // p.update();
          p.render();
       }
  }
  
}
void keyPressed() {
    background(bgc);
    parts = new ArrayList();
}
class Part {
  float life = 1;
  float maxspeed=10;
  // float g=1.8;
  PVector position = new PVector(0, 0);
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  float size = 10;
  color c;
  float min_d = 90;
  Part nei = null;
  Part(float x, float y, float size, color c) {
    position.x=x;
    position.y=y;
    this.size = size;
    this.c=c;
  }
  void update() {
    life-=.01;
 
    // size=random(5);
    if (position.x>w) {
      position.x=0;
    }
    else if (position.x<0) {
      position.x=w;
    }
    if (position.y>h) {
      position.y=0;
    }
    else if (position.y<0) {
      position.y=w;
    }  
 
 
    for (Part p:parts) {
      if (p!=this) {       
        float d = PVector.dist(p.position, position);
        if (d<min_d) {
          acceleration = PVector.sub(p.position, position);
          acceleration.normalize();
          acceleration.mult(.1);
 
          pushMatrix();
          translate(position.x, position.y);
          //stroke(c, 110-d/min_d*100);
          stroke(255,1+life*155);
          //strokeWeight(d/min_d*2);
          //    line(-velocity.x, -velocity.y, 0, 0);
          line(p.position.x-position.x, p.position.y-position.y, 0, 0);
          popMatrix();
        }
      }
    }
    velocity.add(acceleration);
    velocity.limit(3);
 
    position.add(velocity);
  }
  void render() {   
    pushMatrix();
    translate(position.x, position.y);
 
 
    //stroke(c);
    //    line(-velocity.x, -velocity.y, 0, 0);
    //line(nei.position.x-position.x, nei.position.y-position.y, 0, 0);
    noStroke();
 
    fill(c,3+life*255);
    //fill(c);
    rectMode(CENTER);
    rect(0, 0, size+6, size+6);
    //ellipse(0, 0, size+4, size+4);
 
    popMatrix();
  }
}
