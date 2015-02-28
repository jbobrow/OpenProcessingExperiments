
class Agent{
  
 Vec3D loc;
 Vec3D vel=new Vec3D(0,0,0);
 Vec3D acc=new Vec3D(0.01,0,0);

Agent(Vec3D _loc){
  loc= _loc;
}

void run(){
 display();
 update();
 followMouse();
}
void update(){
  
  vel.addSelf(acc);
  vel.limit(10);
  loc.addSelf(vel);
  acc=new Vec3D(0,0,0);
  
}

void followMouse(){
  
Vec3D target=new Vec3D(mouseX,mouseY,0);
//here the target can be anything you want!/
Vec3D dif= target.sub(loc);

float distance=dif.magnitude();

dif.normalize();

dif.scaleSelf(distance/5);

acc.addSelf(dif);

}

void display(){
  stroke(0);
  fill(225,0,0);
 ellipse(loc.x,loc.y,20,20);
 
}
 
  
  
}

