
class particle{
  PVector x;
  PVector v;
  PVector f;
  particle(PVector xo){
    x = xo;
    v = new PVector();
    f = new PVector();
  }
  void update(){
    v.add(f);
    f = new PVector(0,0.05);
    x.add(v);
  }
}
ArrayList particles;
float diam = 32;
float k = 0.5;
float c = 0.01;
void setup(){
  size(600,500);
  ellipseMode(CENTER);
  smooth();
  fill(#FF0000);
  reset();
}
void reset(){
  particles = new ArrayList();
  int num = 7;
  for(int i=0;i<num;i++){
    particles.add(new particle(new PVector(
      width/2-num/2*diam+i*diam,
      height/2)));
  }
}
void draw(){
  if(frameCount%30==0){println(frameRate);}
  background(200,200,255);
//  rect(0,0,width,height);
  for(int i=1;i<particles.size();i++){
    particle A = (particle) particles.get(i);
    for(int j=0;j<i;j++){
      particle B = (particle) particles.get(j);
      PVector dx = PVector.sub(B.x,A.x);
      if(abs(dx.x)<diam){
        if(abs(dx.y)<diam){
          if(dx.mag()<diam){
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
    PVector pivot = new PVector(
      width/2-particles.size()/2*diam+i*diam,
      height/8);
    PVector dx = PVector.sub(pivot,A.x);
    float restore = (dx.mag() - height*3/8)*k;
    dx.normalize();
    float dampenA = dx.dot(A.v)*0.2;
    dx.mult(restore - dampenA);
    A.f.add(dx);
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
    if(i==hold){
      PVector mouseV = new PVector(mouseX,mouseY);
      PVector pmouseV = new PVector(pmouseX,pmouseY);
      A.x = mouseV;
      A.v = PVector.sub(mouseV,pmouseV);
    }
    noStroke();
    ellipse(A.x.x,A.x.y,diam,diam);
    stroke(0);
    line(pivot.x,pivot.y,A.x.x,A.x.y);
  }
}
int hold = -1;
void mousePressed(){
  PVector mouseV = new PVector(mouseX,mouseY);
  for(int i=0;i<particles.size();i++){
    particle A = (particle) particles.get(i);
    PVector dx = PVector.sub(A.x,mouseV);
    if(dx.mag()<diam/2){
      hold = i;
    }
  }
}
void mouseReleased(){
  hold = -1;
}
void keyPressed(){
  if(key==' '){
    reset();
  }
}

