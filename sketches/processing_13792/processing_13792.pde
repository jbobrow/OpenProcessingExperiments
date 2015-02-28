
import remixlab.proscene.*;
Scene scene;
brownianParticle myParticle;
float delta;
void setup(){
 size(800,600,P3D);
 frameRate(12);
 scene=new Scene(this);
 scene.background(255);
 myParticle=new brownianParticle(new PVector(0,0,0));
 delta=5;
}
void draw(){
 noFill();
 stroke(0);
 box(width/4);
 stroke(0);
 fill(255,0,0,150);
 myParticle.plotParticle(delta);
 if(frameCount%3==0){
  myParticle.iterateParticle(delta);
  
 }
 myParticle.plotTrace(255,0,0);
}

