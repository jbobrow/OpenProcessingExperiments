
import gifAnimation.*;
import java.util.Iterator;
ArrayList<Part> parts;
float w = 500;
float h = 500;
PVector g = new PVector(0,.2);;
float noiseoff=0;
//GifMaker gifExport;
color bgc = #302234;
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
void paint(float x, float y, float dx, float dy, float size) {
  float tx = x;
  float ty = y;
  color c1 = #1ACFD3; 
  color c2 = #B45C7B;
  float t=15+random(20);
  color c = lerpColor(c1, c2, random(1)); 
  Part p = new Part(tx, ty, random(5)+1, c);   
  p.velocity.x=0;
  p.velocity.y=0; 
  p.acceleration.x=dx;
  p.acceleration.y=dy; 
  p.acceleration.mult(.7);
  if (p.acceleration.x==0&&p.acceleration.y==0) {
    p.acceleration.x=random(1)-.5; 
    p.acceleration.y=random(1)-.5;
  }
  parts.add(p);
}
int fr = 0;
void draw() {
  noStroke();
  fill(bgc, 155);
  rectMode(CORNER);
  rect(0, 0, width, height);
  //background(bgc);
  if (record) {
    paint(mouseX, mouseY, pmouseX-mouseX, pmouseY-mouseY, 10);
  }
  updateParticles();
  if (frameCount%5==0) {
    fr++;
    print(fr+"\n");
//    saveFrame("frames/screen_#####.tif");
  }
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

void updateParticles() {
  if (parts.size()>0) {
      for (int i = parts.size()-1; i >= 0; i--) {
        Part p = (Part) parts.get(i);      
      p.update();
      //p.render();
      if (p.life<0) {
        parts.remove(p);
      }    
    }
    for (Part p:parts) {
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
  float life = 1;
  float maxspeed=10;
  float r=0;
  // float g=1.8;
  PVector position = new PVector(0, 0);
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  float size = 10;
  color c;
  float min_d = 8;
  Part nei = null;
  Part(float x, float y, float size, color c) {
    position.x=x;
    position.y=y;
    this.size = size;
    this.c=c;
  }
  void update() {
    life-=.005;
    for (Part p:parts) {
      if (p!=this) {        
        float d = PVector.dist(p.position, position);
        if (d<min_d*size) {
          acceleration.add(PVector.sub(p.position, position));
          acceleration.normalize();
          acceleration.mult(-.1*p.size);
          pushMatrix();
          translate(position.x, position.y);
          //stroke(c, 110-d/min_d*100);
          stroke(c, 1+life*155);
          line(p.position.x-position.x, p.position.y-position.y, 0, 0);
          popMatrix();
        }
      }
    }


    if (position.x>w) {
      velocity.x=-velocity.x;
      acceleration.x=-acceleration.x;
    }
    else if (position.x<0) {
      velocity.x=-velocity.x;
      acceleration.x=-acceleration.x;
    }
    if (position.y>h) {
      velocity.y=-velocity.y;
      acceleration.y=-acceleration.y;
    }
    else if (position.y<0) {
      velocity.y=-velocity.y;
      acceleration.y=-acceleration.y;
    }   
    //acceleration.add(g);
    velocity.add(acceleration);
    //velocity.y+=5;
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
    r+=size*4;
    //stroke(c);
    //    line(-velocity.x, -velocity.y, 0, 0);
    //line(nei.position.x-position.x, nei.position.y-position.y, 0, 0);
    noStroke();

    fill(c, 3+life*255);
    //fill(c);
    rectMode(CENTER);
    rect(0, 0, size*2, size*2);
    
    //ellipse(0, 0, size*2, size*2);
    stroke(c, 3+life*255);
    noFill();
    ellipse(0, 0, size*5, size*5);

    popMatrix();
  }
  void applyForce(PVector force) {
    acceleration.add(force);
  }
}
