
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

int diam = 30;

ArrayList allParticles, allSprings;

VerletPhysics2D physics;

PFont Hoefler;

void setup(){
  size(720,400);
  smooth();
  background(255);
  
  Hoefler = loadFont("HoeflerText-Regular-48.vlw");
   
  allParticles = new ArrayList();
  allSprings = new ArrayList();
  physics=new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior(new Vec2D(0,0)));
  Vec2D center = new Vec2D(width/2,height/2);
  Vec2D extent = new Vec2D(width/2,height/2);
  physics.setWorldBounds(Rect.fromCenterExtent(center,extent));  
}

void draw(){

  physics.update();
  background(255);
  fill(200);
  textFont(Hoefler,24);
  textAlign(LEFT,TOP);
  text("You have "+allParticles.size()+" Particles.",50,60);
  textFont(Hoefler,14);
  textAlign(LEFT,BASELINE);
  text("Press '+' to add Particles.\nPress '-' to remove them.\nClick & drag your mouse around.",50,height-95);

  stroke(200);
  strokeWeight(2);
  line(50,50,width-50,50);
  line(50,height-50,width-50,height-50);
  noStroke();

  for(int i=0; i<=allParticles.size()-1;i++){  
    Particle thisParticle = (Particle)allParticles.get(i);
    thisParticle.display();
    if(i==0){
      if(mousePressed){
        //if(dist(mouseX,mouseY,thisParticle.x,thisParticle.y)<=diam){
        thisParticle.lock();
        thisParticle.x= mouseX;
        thisParticle.y= mouseY;
        thisParticle.unlock();
        //}
      }
    }
  }

  if(keyPressed) {
    if (key == '+' || key == '+') {
      allParticles.add(new Particle(random(width),random(height)));
      physics.addParticle((Particle)allParticles.get(allParticles.size()-1));
      if(allParticles.size()>1){
        allSprings.add(new VerletSpring2D((Particle)allParticles.get(allParticles.size()-1),(Particle)allParticles.get(allParticles.size()-2),2,0.01));
        physics.addSpring((VerletSpring2D)allSprings.get(allSprings.size()-1));      
      }      
    }
    if (key == '-' || key == '-') {
      if(allParticles.size()>0){
        allParticles.remove(allParticles.size()-1);
      }

    }
  }
}


class Particle extends VerletParticle2D {
  Particle(float x, float y) {
    super(x,y);
  }
  void display() {
    fill(255,100,100,100);
    noStroke();
    ellipse(x,y,diam,diam);
  }
}



