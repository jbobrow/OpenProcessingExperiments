
//the yellow ones
class CrazyParticle extends Particle{

  CrazyParticle (PVector l){
    super(l);
    acc = new PVector(random(-0.001,0.001),-0.01,0);
    vel = new PVector(random(-1,1),random(-1,0),0);
    loc = l.get();
  }
  
  void update(){
    super.update();
    timer-=0.5;
  }
  
  void display() {
    pushMatrix();
    translate(loc.x,loc.y);
    imageMode(CENTER);
    translate(-img.width/2,-img.height/2);
    rotateX(0);
    colorMode(RGB);
    tint(255,255,200);
    image(img,0,0,40,40);
    popMatrix();
  }
}

