
import controlP5.*;
import peasy.*;
import toxi.physics.*;
import toxi.physics.constraints.*;
import toxi.physics.behaviors.*;
import toxi.geom.*;

int amount = 300;
int[] x = new int[amount];
int[] y = new int[amount];
int[] z = new int[amount];

PeasyCam cam;
ControlP5 cp5;

VerletPhysics physics;

VerletParticle particles;

int buttonValue=1;
int myColor=color(255,0,0);
 
 void setup(){
  size(800,800,P3D);
  
   
  cam= new PeasyCam(this, 100);
  cp5= new ControlP5(this);
  cp5.addButton("button", 10, 100, 60, 80, 20).setId(1);
  cp5.addButton("buttonValue", 4, 100, 90, 80, 20).setId(2);
  cp5.setAutoDraw(false);
  
  physics=new VerletPhysics();
  
  Vec3D v= new Vec3D(0,0,-0.01);
  GravityBehavior g= new GravityBehavior (v);
  physics.addBehavior(g);
  
  for(int i=0; i<30; i++){
    VerletParticle p= new VerletParticle (i*10,0,0);
    
    if (i==0){
      p.lock();
    }
    
    
    physics.addParticle(p);
  }
  
  for(int i=1; i<physics.particles.size(); i++) {
   VerletParticle vp1=(VerletParticle) physics.particles.get(i);
   VerletParticle vp2=(VerletParticle) physics.particles.get(i-1);
   
   VerletSpring sp=new VerletSpring(vp1,vp2,10,0.1);
   physics.addSpring(sp);
   
   }
  
  strokeWeight(5);
  for(int i = 0; i<amount; i++) {
    x[i] = int(random(-150, 150));
    y[i] = int(random(-150, 150));
    z[i] = int(random(-150, 150));
  
}
 }




void draw(){
  background(0);
  
  stroke(255);
  strokeWeight(5);
  noFill();
  box(60);
 translate(width/2, height/2);
  
  rotateY(frameCount / 100.0);
  
 // box(300);
  for(int i = 0; i<amount; i++) {
    point(x[i], y[i], z[i]);
  }

for(int i= 0; i< physics.particles.size(); i++){
VerletParticle vp= (VerletParticle) physics. particles.get(i);

strokeWeight(5);

if (vp.isLocked()) {
    stroke(255,0,0);
}
else{
  stroke (myColor);
}
  
 
point(vp.x,vp.y,vp.z);

}

for (int i=0; i< physics.springs.size(); i++) {
    VerletSpring sp = (VerletSpring) physics.springs.get(i);
    
    stroke(255);
    strokeWeight(1);
    line(sp.a.x, sp.a.y, sp.a.z,   sp.b.x, sp.b.y, sp.b.z);
    
    
}

physics.update();

gui();
}






void gui() {
   
  cam.beginHUD();
  cp5.draw();
  cam.endHUD();
  
}

void button(float theValue){
  

myColor=color(random(255),random(255),random(255));
  println("a buttom event." +theValue);
  
}
  
  
  
  
  
  
  
  
  

