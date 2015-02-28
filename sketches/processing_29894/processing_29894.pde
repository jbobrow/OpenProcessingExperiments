
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

int diam = 5;

PFont Klavika;

ArrayList allParticles, allSprings;

VerletPhysics2D physics;

Particle p1;
Particle p2;
Particle p3;

void setup(){

  Klavika = loadFont("KlavikaMedium-OSF-48.vlw");
  textFont(Klavika);

  size(720,720);
  smooth();
  background(0);

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
  background(0);

  fill(200);
  textFont(Klavika,14);
  textAlign(LEFT,TOP);
  text("You have "+allParticles.size()+" Particles.",50,60);
  textAlign(LEFT,BASELINE);
  text("Press 'Z' to add Particles.\nPress 'X' to reset.",50,height-75);
  stroke(200);
  strokeWeight(1);
  line(50,50,width-50,50);
  line(50,height-50,width-50,height-50);
  noStroke();

  for(int i=0; i<=allSprings.size()-1;i++){
    Spring thisSpring = (Spring)allSprings.get(i);
    thisSpring.display();  
  }

  for(int i=0; i<=allParticles.size()-1;i++){  
    Particle thisParticle = (Particle)allParticles.get(i);
    thisParticle.display();   
    if(mousePressed){
      if(dist(mouseX,mouseY,thisParticle.x,thisParticle.y)<=30){
        thisParticle.lock();
        thisParticle.x= mouseX;
        thisParticle.y= mouseY;
        thisParticle.unlock();
      }     
    }
  }

  if(keyPressed) {

    if (key == 'Z' || key == 'z') {
      allParticles.add(new Particle(random(width),random(height),allParticles.size()));
      physics.addParticle((Particle)allParticles.get(allParticles.size()-1));

      if(allParticles.size()>1){

        int qlqerAnterior = ceil(random(allParticles.size()));
        int qlqerAnterior2 = ceil(random(allParticles.size()));

        p1 = (Particle)allParticles.get(allParticles.size()-1); 
        p2 = (Particle)allParticles.get(allParticles.size()-qlqerAnterior);
        p3 = (Particle)allParticles.get(allParticles.size()-qlqerAnterior2);

        allSprings.add(new Spring(p1,p2,50,0.01));
        allSprings.add(new Spring(p1,p3,50,0.01));

        physics.addSpring((Spring)allSprings.get(allSprings.size()-1));   
      }
    }

    if (key == 'X' || key == 'x') {
      
      for(int i=0; i<=allParticles.size()-1;i++){
        allParticles.remove(i);
      }

      if(allSprings.size()>0){
        for(int i=0; i<=allSprings.size()-1;i++){
          allSprings.remove(i);
        }
      }
    }
  }
}

class Particle extends VerletParticle2D {
  int textField;
  Particle(float x, float y, int texxt) {
    super(x,y);
    textField = texxt;
  }
  void display() {
    fill(255,100);
    noStroke();
    ellipse(x,y,diam,diam);
    fill(255);
    textAlign(LEFT,BASELINE);
    text(textField,x,y);
  }
}

class Spring extends VerletSpring2D{
  Spring(VerletParticle2D a,VerletParticle2D b, float len, float strg){
    super(a,b,len,strg);
  }
  void display(){
    stroke(200,100);
    line(a.x,a.y,b.x,b.y);
    noStroke();
  } 
}








