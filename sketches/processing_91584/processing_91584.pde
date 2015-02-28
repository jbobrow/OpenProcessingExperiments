
//import gifAnimation.*;
import java.util.Iterator;
ArrayList<Part> parts;
float w = 500;
float h = 500;
PVector g = new PVector(0, .2);

float noiseoff=0;
//GifMaker gifExport;
color bgc = #212121;
color c1 = #61A523; 
color c2 = #C164B0;
float coloroff=random(255);
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
Part paint(float x, float y, float dx, float dy, float size, Part parent, boolean bymouse) {
  float tx = x;
  float ty = y;

  float t=15+random(20);
  //color c = lerpColor(c1, c2, random(1)); 
  coloroff++;
  if (coloroff>255) {
    coloroff=0;
  }
  colorMode(HSB);
  color c = color(coloroff, 155, 255); 
  Part p = new Part(tx, ty, size, c);
  if (!bymouse) {
    p.c=parent.c;
  }

  p.velocity.x=0;
  p.velocity.y=0;
  
  
  
   
  if (dy == 0 && dx == 0) {
     dx=random(1)-.5; 
     dy=random(1)-.5;
  }
  p.acceleration.x=dx;
  p.acceleration.y=dy; 
  p.or_a.x = dx;
  p.or_a.y = dy;
  p.par=parent;
  //  p.acceleration.mult(-.5);
    
  parts.add(p);
  return p;
}
int fr = 0;
Part lastp=null;

void draw() {
  noStroke();
  fill(bgc, 125);
  rectMode(CORNER);
  rect(0, 0, width, height);
  //background(bgc);
  if (record) {

    lastp=paint(mouseX, mouseY, (pmouseX-mouseX)*-.1, (pmouseY-mouseY)*-.1, random(9), lastp, true);
  }
  else {
    lastp=null;
  }
  updateParticles();

}
void mousePressed() {
  record=true;
}
void mouseReleased() {
  record=false;
}

//void updateParticles() {
//  if (parts.size()>0) {
//    Iterator<Part> it = parts.iterator();
//    while (it.hasNext ()) {
//      Part p = it.next();
//      p.update();
//      //p.render();
//      if (p.life<0) {
//        it.remove();
//      }
//      if (random(1)>.9) {
//        //      paint(p.position.x,p.position.y,random(5)-2,random(5)-2,random(5)-2);
//      }
//    }
//    for (Part p:parts) {
//
//      // p.update();
//      p.render();
//    }
//  }
//}
void rotate2D(PVector v, float theta) {
  float xTemp = v.x;
  v.x = v.x*cos(theta) - v.y*sin(theta);
  v.y = xTemp*sin(theta) + v.y*cos(theta);
}

void updateParticles() {
  if (parts.size()>0) {
    noiseoff+=.1;
    int s = parts.size()-1;
    //PVector prevpos = parts.get(parts.size()-1).position;
    for (int i = s; i >= 0; i--) {
      Part p = (Part) parts.get(i);      
      p.update();

      //      prevpos = p.position;
      //p.render();
      if (p.life<0) {
        parts.remove(p);
      }    
      if (p.life<.9 && p.spawned<25 && parts.size()<650 && p.life>.5) {
        p.spawned++;
        if (random(1)>.9) {
          //paint(p.position.x, p.position.y, random(10)-5, random(10)-5, random(5)-2, p);
          PVector dir = p.or_a;
          dir.normalize();
          rotate2D(dir, radians(random(45)-22.5));
          
          dir.mult(3);
          Part np = paint(p.position.x, p.position.y,dir.x, dir.y, p.size*.9, p, false);
          np.spawned=p.spawned;
        }
      }
      stroke(p.c, 5+p.life*255);
     // strokeWeight(noise(i+noiseoff)*3);
      //line(p.position.x, p.position.y, par.x, prevpos.y);
      if (p.par!=null) {
        line(p.position.x, p.position.y, p.par.position.x, p.par.position.y);
      }
      p.render();
    }
  
  }
}
void keyPressed() {
  if (key == 's') {
    saveFrame("images/screen_#####.png");
  }

  if (key == 'a') {
    background(bgc);
    parts = new ArrayList();

    //createParticles();
  }
}
class Part {
  Part par=null;
  float spawned = 0;
  float life = 1;
  float maxspeed=10;
  float r=random(360);
  // float g=1.8;
  PVector position = new PVector(0, 0);
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  PVector or_a = new PVector(0, 0);
  float size = 10;
  color c;
  float min_d = 5;
  Part nei = null;

  Part(float x, float y, float size, color c) {
    position.x=x;
    position.y=y;
    this.size = size;
    this.c=c;
    
  }
  void update() {
    life-=.01;
    /*for (Part p:parts) {
      if (p!=this) {        
        float d = PVector.dist(p.position, position);
        if (d<min_d*size) {
          //                    acceleration.add(PVector.sub(p.position, position));
          //                    acceleration.normalize();
          //                    acceleration.mult(-.06*p.size);
          pushMatrix();
          translate(position.x, position.y);
          //stroke(c, 110-d/min_d*100);
          stroke(c, 1+life*155);
          //line(p.position.x-position.x, p.position.y-position.y, 0, 0);
          popMatrix();
        }
      }
    }
*/


    velocity.add(acceleration);

    velocity.limit(15);
    // size=random(5);
    velocity.mult(.95);
    position.add(velocity);

    acceleration.mult(0);
  }
  void render() {    
    pushMatrix();
    translate(position.x, position.y);
    rotate(radians(r));
    //    r+=size;
    //stroke(c);
    //    line(-velocity.x, -velocity.y, 0, 0);
    //line(nei.position.x-position.x, nei.position.y-position.y, 0, 0);
    noStroke();

    fill(c, 5+life*255);
    //fill(c);
    rectMode(CENTER);
    rect(0, 0, size, size);

    //ellipse(0, 0, size*2, size*2);
    stroke(c, 3+life*255);
    noFill();
    //    ellipse(0, 0, size*5, size*5);

    popMatrix();
  }
  void applyForce(PVector force) {
    acceleration.add(force);
  }
}
