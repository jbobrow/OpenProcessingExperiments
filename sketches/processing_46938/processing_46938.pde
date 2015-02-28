
int num = 64;
float diam = 8;
float damp = 1;
float wallDamp = 0.1;
float grav = 0.05;
float basicalyZero = 0.0001;
class ball{
  PVector x;
  PVector v;
  ball(PVector xo){
    x = xo;
    v = new PVector();
    v.mult(2);
  }
  float timeOfImpact(ball targ){
    float t = 3.40282347E+38;
    PVector dx = PVector.sub(targ.x,x);
    PVector dv = PVector.sub(targ.v,v);
    float V = dv.mag();
    dv.normalize();
    float adjacent = dx.dot(dv);
    if(adjacent<0){
      adjacent = abs(adjacent);
      float opposite = sqrt(sq(dx.mag())-sq(adjacent));
      if(opposite<diam){
        float newAdj = adjacent-sqrt(sq(diam)-sq(opposite));
        float t1 = newAdj/V;
//        if(t1<basicalyZero){
//          impact(targ);
//          targ.getTOI();
//        }else{
          t = t1;
//        }
      }
    }
    if(t<0){t=0;}
    return t;
  }
  void impact(ball targ){
    PVector dx = PVector.sub(targ.x,x);
    PVector dv = PVector.sub(targ.v,v);
    dx.normalize();
    dx.mult(dx.dot(dv)*damp);
    targ.v.sub(dx);
    v.add(dx);
  }
  float[] timeOfWall(){
    float[] t = new float[4];
    for(int i=0;i<4;i++){t[i] = 3.40282347E+38;}
    if(v.x<0){t[0] = (x.x-diam/2)/-v.x;}
    if(v.x>0){t[1] = (width-diam/2-x.x)/v.x;}
    if(v.y<0){t[2] = (x.y-diam/2)/-v.y;}
    if(v.y>0){t[3] = (height-diam/2-x.y)/v.y;}
    for(int i=0;i<4;i++){if(t[i]<0){t[i]=0;}}
    if(t[0]<basicalyZero){
      v.x*=-wallDamp;
      t[0] = 3.40282347E+38;
    }
    if(t[1]<basicalyZero){
      v.x*=-wallDamp;
      t[1] = 3.40282347E+38;
    }
    if(t[2]<basicalyZero){
      v.y*=-wallDamp;
      t[2] = 3.40282347E+38;
    }
    if(t[3]<basicalyZero){
      v.y*=-wallDamp;
      t[3] = 3.40282347E+38;
    }
    return t;
  }
  void wallImpact(int i){
    if(i==0||i==1){v.x*=-wallDamp;}
    if(i==2||i==3){v.y*=-wallDamp;}
  }
  void getTOI(){
    int a = balls.indexOf(this);
    for(int i=a+1;i<balls.size();i++){
      ball I = (ball) balls.get(i);
      TOImap[i][a] = I.timeOfImpact(this);
    }
    for(int j=0;j<a;j++){
        ball J = (ball) balls.get(j);
        TOImap[a][j] = this.timeOfImpact(J);
    }
//    getTOImap();
  }
}
ArrayList balls;
float[][] TOImap;
void setup(){
  size(620,400);
  ellipseMode(CENTER);
  smooth();
  fill(#FF0000);
  reset();
}
void reset(){
  balls = new ArrayList();
  for(int i=0;i<num;i++){
    balls.add(new ball(new PVector(
      width/2-num/2*diam+i*diam,
      height/2)));
  }
  TOImap = new float[balls.size()][balls.size()];
  getTOImap();
}
void getTOImap(){
  for(int i=1;i<balls.size();i++){
    ball I = (ball) balls.get(i);
    for(int j=0;j<i;j++){
      ball J = (ball) balls.get(j);
      TOImap[i][j] = I.timeOfImpact(J);
    }
  }
}
void draw(){
//  if(frameCount%60==0){println(frameRate);}
  background(200,200,255);
  float time = 0;
  while(time<0.999999){
    boolean ballHit = false;
    int a = 0;
    int b = 0;
    float minTOI = 1f-time;
    for(int i=1;i<balls.size();i++){
      ball I = (ball) balls.get(i);
      for(int j=0;j<i;j++){
        ball J = (ball) balls.get(j);
        float toi = TOImap[i][j];
        if(toi<minTOI){
          a = i;
          b = j;
          minTOI = toi;
          ballHit = true;
        }
      }
    }
    boolean wallHit = false;
    for(int i=0;i<balls.size();i++){
      ball I = (ball) balls.get(i);
      float[] TOI = I.timeOfWall();
      for(int j=0;j<4;j++){
        if(TOI[j]<minTOI){
          minTOI = TOI[j];
          a = i;
          b = j;
          ballHit = false;
          wallHit = true;
        }
      }
    }
    time += minTOI;
    for(int i=0;i<balls.size();i++){
      ball I = (ball) balls.get(i);
      I.x.add(PVector.mult(I.v,minTOI));
    }
    for(int i=1;i<balls.size();i++){
      for(int j=0;j<i;j++){
        TOImap[i][j] -= minTOI;
      }
    }
    if(wallHit){
      ball A = (ball) balls.get(a);
      A.wallImpact(b);
      A.getTOI();
    }else if(ballHit){
      ball A = (ball) balls.get(a);
      ball B = (ball) balls.get(b);
      A.impact(B);
      A.getTOI();
      B.getTOI();
    }
  }
  PVector mouse = new PVector(mouseX,mouseY);
  for(int i=0;i<balls.size();i++){
    ball I = (ball) balls.get(i);
    I.v.y+=grav;
    PVector pivot = new PVector(
      width/2-balls.size()/2*diam+i*diam,
      height/8);
    PVector dx = PVector.sub(pivot,I.x);
    float restore = (dx.mag() - height*3/8)*0.5;
    dx.normalize();
    float dampenI = dx.dot(I.v)*0.2;
    dx.mult(restore - dampenI);
    I.v.add(dx);
    if(i==hold){
      PVector mouseV = new PVector(mouseX,mouseY);
      PVector pmouseV = new PVector(pmouseX,pmouseY);
      I.x = mouseV;
      I.v = PVector.sub(mouseV,pmouseV);
    }
    noStroke();
    ellipse(I.x.x,I.x.y,diam,diam);
    stroke(0);
    line(pivot.x,pivot.y,I.x.x,I.x.y);
  }
  getTOImap();
}
int hold = -1;
void mousePressed(){
  PVector mouseV = new PVector(mouseX,mouseY);
  for(int i=0;i<balls.size();i++){
    ball I = (ball) balls.get(i);
    PVector dx = PVector.sub(I.x,mouseV);
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

