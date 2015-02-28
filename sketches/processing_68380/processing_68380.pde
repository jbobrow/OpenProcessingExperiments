
import processing.opengl.*;

import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

VerletPhysics2D phy;

Vec2D mouse;
AttractionBehavior mouseAttract;

PImage ballImage;

color bg = color(255),fg = color(0);

PImage bob;

void setup() {
  size(500,500,OPENGL);
  
  phy = new VerletPhysics2D();
  phy.setDrag(0.02);
  phy.setWorldBounds(new Rect(-100,-100,width+100,height+100));
  phy.addBehavior(new AttractionBehavior(new Vec2D(width/2,height/2),5000,2)); //better than gravity! :3
  
  for(int i=0; i < 50; i++) {
    VerletParticle2D p = new VerletParticle2D(new Vec2D(width/2+random(-20,20),height/2+random(-20,20)));
    phy.addParticle(p);
    phy.addBehavior(new AttractionBehavior(p, 20, -3, 0.05));
  }
  
  ballImage = loadImage("ball.png");
  ballImage.resize(ballImage.width*2,ballImage.height*2);
  imageMode(CENTER);
  
  bob = loadImage("Untitled.png");
  bob.loadPixels();
}

void draw() {
  background(255);
  noStroke();
  fill(0);
  phy.update();
  
  for(VerletParticle2D p : phy.particles) {
    image(ballImage,p.x,p.y);
  }
  
  //Now we process the pixels for a metaball effect.
  loadPixels();
  for(int x = 0; x < width; x++) {
    for(int y = 0; y < height; y++) {
      int loc = x+y*width;
      
      int pix = pixels[loc];
      if(pix == bg) continue;
      
      if((pix & 0xff) < 128) {
        pixels[loc] = bob.pixels[loc]; //replace w black
      }
    }
  }
  updatePixels();
  
}

void mousePressed() {
  mouse = new Vec2D(mouseX,mouseY);
  
  mouseAttract = new AttractionBehavior(mouse,350,4);
  phy.addBehavior(mouseAttract);
}

void mouseDragged() {
  mouse.set(mouseX,mouseY);
}

void mouseReleased() {
  phy.removeBehavior(mouseAttract);
}

void keyPressed() {
  saveFrame("metaball-####.png");
}

