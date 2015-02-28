
class particle{
  PVector x;
  PVector v;
  PVector f;
  particle(){
    x = new PVector(random(0,width),random(0,height));
    v = new PVector();
    f = new PVector();
  }
  void update(){
    v.add(f);
    f = new PVector(0,0.02);
    x.add(v);
  }
}
ArrayList particles;
float diam = 10;
float suck = 3.4;
float k = 0.1;
float c = 0.08;
void setup(){
  size(400,400);
  fill(0,200);
  noStroke();
  particles = new ArrayList();
  for(int i=0;i<600;i++){
    particles.add(new particle());
  }
}
void draw(){
  if(frameCount%30==0){println(frameRate);}
//  background(0);
  rect(0,0,width,height);
  for(int i=1;i<particles.size();i++){
    particle A = (particle) particles.get(i);
    for(int j=0;j<i;j++){
      particle B = (particle) particles.get(j);
      PVector dx = PVector.sub(B.x,A.x);
      if(abs(dx.x)<diam*suck){
        if(abs(dx.y)<diam*suck){
          if(dx.mag()<diam*suck){
            float restore = (diam - dx.mag())*k;
            dx.normalize();
            float dampen = dx.dot(PVector.sub(B.v,A.v))*c;
            dx.mult(restore - dampen);
            A.f.sub(dx);
            B.f.add(dx);
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
      float pushrad = 8;
      if(abs(dx.x)<pushrad){
        if(abs(dx.y)<pushrad){
          if(dx.mag()<pushrad){
//            dx.normalize();
//            A.f.add(PVector.mult(dx,0.8));
            A.v.add(PVector.mult(PVector.sub(
              PVector.sub(mouseV,pmouseV),A.v),0.2));
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
    A.update();
    set(int(A.x.x),int(A.x.y),color(241,214,255));
  }
}

