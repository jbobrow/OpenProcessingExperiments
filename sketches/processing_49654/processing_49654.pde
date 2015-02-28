
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/49654*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
public static float fastSqrt(float x) {
    return Float.intBitsToFloat(532483686 + (Float.floatToRawIntBits(x) >> 1));
}
class particle{
  PVector x;
  PVector v;
  PVector f;
  particle(){
    x = new PVector(random(0,width),random(0,height));
    PVector r = PVector.sub(x,new PVector(width/2,height/2));
//    r.normalize();
    r.mult(0.0003);
    v = new PVector(-r.y,r.x);
    f = new PVector();
  }
  void update(){
    v.add(f);
    f = new PVector(0,g);
    x.add(v);
  }
}
ArrayList particles;
float diam = 6;
float k = 0.4;
float c = 0.1;
float g = 0.0;
void setup(){
  size(600,500);
  fill(0,64);
//  noStroke();
  reset();
}
void reset(){
  particles = new ArrayList();
  for(int i=0;i<600;i++){
    particles.add(new particle());
  }
}
void keyPressed(){
  if(key==' '){reset();}
}
void draw(){
  if(frameCount%30==0){println(frameRate);}
  background(0);
  PVector centroid = new PVector();
  for(int i=1;i<particles.size();i++){
    particle A = (particle) particles.get(i);
    centroid.add(A.x);
    for(int j=0;j<i;j++){
      particle B = (particle) particles.get(j);
      PVector dx = PVector.sub(B.x,A.x);
      if(dx.mag()<diam){
        float restore = (diam - dx.mag())*k;
        dx.normalize();
        float dampen = dx.dot(PVector.sub(B.v,A.v))*c;
        dx.mult(restore - dampen);
        A.f.sub(dx);
        B.f.add(dx);
        stroke(constrain(restore*2*256,0,255));
        line(A.x.x,A.x.y,B.x.x,B.x.y);
      }else{
        float restore = -0.3/sq(dx.mag());
        dx.normalize();
        dx.mult(restore);
        A.f.sub(dx);
        B.f.add(dx);
      }
    }
  }
  centroid.mult(1f/particles.size());
  PVector mouseV = new PVector(mouseX,mouseY);
  PVector pmouseV = new PVector(pmouseX,pmouseY);
  PVector push = new PVector();
  if(mousePressed&&mouseButton==RIGHT){
    PVector dx = PVector.sub(mouseV,centroid);
    push = PVector.mult(dx,0.001);
  }
  for(int i=0;i<particles.size();i++){
    particle A = (particle) particles.get(i);
    A.f.add(push);
    if(mousePressed&&mouseButton==LEFT){
      PVector dx = PVector.sub(A.x,mouseV);
      A.f.add(PVector.mult(PVector.sub(
        PVector.sub(mouseV,pmouseV),A.v),
        1f*pow(constrain(dx.mag(),diam/2,3.4E38),-1.5)));
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
//    set(int(A.x.x),int(A.x.y),color(#330000));
  }
}


