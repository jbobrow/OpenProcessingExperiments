
import geomerative.*;
import processing.opengl.*;
import toxi.physics2d.constraints.*;
import toxi.physics2d.*;
import toxi.geom.*;
import toxi.math.*;
int NUM_PARTICLES = 10;
int REST_LENGTH= 10;
VerletPhysics2D physics;
VerletParticle2D head,tail;
boolean isTailLocked;
float cam=0;
float sis=880;
RFont f;
RShape grp;
RPoint[] points;

void setup(){
  size(800,500);
  physics=new VerletPhysics2D();
  VerletParticle2D prev=null;
  for(int i=0; i<NUM_PARTICLES; i++) {
    VerletParticle2D p=new VerletParticle2D(new Vec2D());
    physics.addParticle(p);
    if (prev!=null) {
      physics.addSpring(new VerletSpring2D(prev,p,REST_LENGTH, 0.1));
    }
    prev=p;
  }
  tail=prev;
  head=physics.particles.get(0);
  head.lock();

  RG.init(this);
  grp = RG.getText("yes", "FreeSans.ttf", 450, CENTER);
  smooth();
}

void draw(){
  //background(255);
  fill(255,255,255,60);
  noStroke();
  rect(0,0,width,height);
  noFill();
  
  
  
  scale(0.4);
  translate(950,800);
  sis=sis-14;
  if(sis< 25){
    sis=25;
  }


  noStroke();
  RG.setPolygonizer(RG.ADAPTATIVE);
  grp.draw();

  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(map(50, 0, height, 3, 200));
  points = grp.getPoints();
  stroke(0);

  noFill();
  head.set(30,sis);
  for(int j=0; j<points.length; j++){
    physics.update();
    beginShape();
    for(Iterator i=physics.particles.iterator(); i.hasNext();) {
      VerletParticle2D p=(VerletParticle2D)i.next();
      curveVertex(p.x*points[j].x/25,p.y*points[j].y/25);

    }
    endShape();
  }

  {
    isTailLocked=!isTailLocked;
    if (isTailLocked) {
      tail.lock();
    } 
    else {
      tail.unlock();
    }
  }
}





