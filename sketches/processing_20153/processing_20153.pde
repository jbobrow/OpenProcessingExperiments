
class particle{
  PVector x;
  PVector v;
  PVector f;
  float theta;
  float omega;
  float torque;
  char letter;
  float sum;
  particle(){
    x = new PVector(random(0,width),random(0,height));
    v = new PVector();
    f = new PVector();
    theta = 0;
    omega = 0;
    torque = 0;
    letter = char(floor(random(65,90.99)));
    sum = 0;
  }
  PVector Vat(PVector p){
    PVector arm = PVector.sub(p,x);
    PVector omegaV = new PVector(0,0,omega);
    return PVector.add(arm.cross(omegaV),v);
  }
  void appF(PVector F,PVector p){
    PVector arm = PVector.sub(p,x);
    torque += arm.cross(F).z;
//    f.add(F);
  }
  void update(){
    v.add(f);
    f = new PVector(0,0.02);
    sum=0;
    x.add(v);
    omega += torque/(pow(diam/2,2)/2);
    torque = 0;
    omega = constrain(omega,-PI/4,PI/4);
    theta += omega;
  }
}
ArrayList particles;
float diam = 12;
float k = 0.5;
float c = 0.1;
float cw = 0.09;
void setup(){
  size(400,300);
  fill(255);
  smooth();
  noStroke();
  particles = new ArrayList();
  for(int i=0;i<400;i++){
    particles.add(new particle());
  }
  PFont fnt = loadFont("ArialMT-12.vlw");
  textFont(fnt);
}
void draw(){
  if(frameCount%30==0){println(frameRate);}
  background(0);
  for(int i=1;i<particles.size();i++){
    particle A = (particle) particles.get(i);
    for(int j=0;j<i;j++){
      particle B = (particle) particles.get(j);
      PVector dx = PVector.sub(B.x,A.x);
      if(abs(dx.x)<diam){
        if(abs(dx.y)<diam){
          if(dx.mag()<diam){
            float restore = (diam - dx.mag())*k;
            A.sum+=restore;
            B.sum+=restore;
            dx.normalize();
            float dampen = dx.dot(PVector.sub(B.v,A.v))*c;
            PVector F = PVector.mult(dx,restore - dampen);
            A.f.sub(F);
            B.f.add(F);
            PVector mid = PVector.mult(PVector.add(
              A.x,B.x),0.5);
            PVector vdiff = PVector.sub(B.Vat(mid),A.Vat(mid));
            vdiff.sub(PVector.mult(dx,dx.dot(vdiff)));
            vdiff.mult(cw);
            B.appF(vdiff,mid);
            vdiff.mult(-1);
            A.appF(vdiff,mid);
          }
        }
      }
    }
  }
  for(int i=0;i<particles.size();i++){
    particle A = (particle) particles.get(i);
    PVector mouseV = new PVector(mouseX,mouseY);
    PVector pmouseV = new PVector(pmouseX,pmouseY);
    if(mousePressed){
      PVector dx = PVector.sub(A.x,mouseV);
      float pushrad = 12;
      if(abs(dx.x)<pushrad){
        if(abs(dx.y)<pushrad){
          if(dx.mag()<pushrad){
//            dx.normalize();
//            A.f.add(PVector.mult(dx,0.8));
            A.v.add(PVector.mult(PVector.sub(
              PVector.sub(mouseV,pmouseV),A.v),0.5));
          }
        }
      }
    }
    boolean dampen = false;
    if(A.x.x<0){
      A.f.x -= A.x.x*k;
      dampen = true;
    };
    if(A.x.x>width){
      A.f.x -= (A.x.x-width)*k;
      dampen = true;
    };
    if(A.x.y<0){
      A.f.y -= A.x.y*k;
      dampen = true;
    };
    if(A.x.y>height){
      A.f.y -= (A.x.y-height)*k;
      dampen = true;
    };
    if(dampen){A.v.mult(0.9);}
    colorMode(HSB,1);
    fill(color(0.67-A.sum*0.67,1,1));
    A.update();
    pushMatrix();
    translate(A.x.x,A.x.y);
    rotate(-A.theta);
    text(A.letter,-4,+4);
    popMatrix();
//    set(int(A.x.x),int(A.x.y),color(255));
  }
}

