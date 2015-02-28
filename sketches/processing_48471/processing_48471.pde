
public class particle {
  PVector position;
  PVector velocity;
  PVector angle;
  PVector angularVelocity;
  float radius;
  float life;
  boolean alive;

  public particle() {
    position=new PVector();
    velocity=new PVector();
    life=0;
    angle=new PVector();
    angularVelocity=new PVector();
    alive=false;
  }

  public particle(PVector position) {
    this.position=position;
    velocity=new PVector();
    radius=(float) random(3,10);
    life=(int) random(10,1000);
    angle=new PVector();
    angularVelocity=new PVector((float) random(0,0.05),(float) random(0,0.05),(float) random(0,0.05));
    alive=true;
  }

  public particle(PVector position, PVector velocity) {
    this.position=position;
    this.velocity=velocity;
    radius=(float) random(3,10);
    life=(int) random(10,1000);
    angle=new PVector();
    angularVelocity=new PVector((float) random(0,0.05),(float) random(0,0.05),(float) random(0,0.05));
    alive=true;
  }

  public void move() {
    position=PVector.add(position,velocity);
    angle=PVector.add(angularVelocity,angle);
    life--;
    if(life<0)
      life=0;
  }
  public void plot() {
    pushMatrix();
    translate(position.x,position.y,position.z);
      pushMatrix();
      rotateX(angle.x);
        pushMatrix();
          rotateY(angle.y);
          pushMatrix();
            rotateZ(angle.z);
            box(radius);
          popMatrix();
        popMatrix();
      popMatrix();
    popMatrix();
  }
}


