
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/15431*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
class node{
  PVector x;
  PVector v;
  PVector f;
  float p;
  float w;
  float t;
  node(PVector xo){
    x = xo;
    v = new PVector();
    f = new PVector();
    p = 0;
    w = 0.1;
    t = 0;
  }
  void update(){
    v.add(f);
    f = new PVector(0,0.005);
//    f = new PVector();
    x.add(v);
    w += t/(pow(ds/2,2)/2);
    w = constrain(w,-PI/4,PI/4);
    t = 0;
    p += w;
  }
  PVector toWorld(PVector input){
    PVector output = new PVector();
    output.x = -input.y*sin(p) + input.x*cos(p);
    output.y = input.y*cos(p) + input.x*sin(p);
    return output;
  }
  PVector toOri(PVector input){
    PVector output = new PVector();
    output.x = -input.y*sin(-p) + input.x*cos(-p);
    output.y = input.y*cos(-p) + input.x*sin(-p);
    return output;
  }
  void grip(){
    v = new PVector(mouseX-pmouseX,mouseY-pmouseY);
    x = new PVector(mouseX,mouseY);
  }
  PVector vat(PVector R){
    PVector dr = PVector.sub(R,x);
    float vdr = w*dr.mag();
    dr.normalize();
    PVector output = PVector.add(v,
      new PVector(vdr*-dr.y,vdr*dr.x));
    return output;
  }
  void force(PVector F,PVector R){
    PVector arm = PVector.sub(R,x);
    float tork = F.y*arm.x-F.x*arm.y;
    t += tork;
    f.add(F);
  }
  void draw(){
    ellipse(x.x,x.y,ds,ds);
    line(x.x,x.y,x.x+ds/2*cos(p),x.y+ds/2*sin(p));
  }
}
int nH = 10;
int nV = 16;
float ds = 12;
node[][] nodes;
float k = 0.10;
float c = 0.05;
float kw = 7;
float cw = 2;
void setup(){
  size(500,400);
  smooth();
  stroke(255);
  strokeWeight(0.5);
  noFill();
  ellipseMode(CENTER);
  nodes = new node[nH][nV];
  reset();
  k = k / 16 * ds;
  c = c / 16 * ds;
  kw = kw / (pow(16/2,2)/2) * (pow(ds/2,2)/2);
  cw = cw / (pow(16/2,2)/2) * (pow(ds/2,2)/2);
}
void reset(){
  for(int i=0;i<nH;i++){
    for(int j=0;j<nV;j++){
      nodes[i][j] = new node(new PVector(
        width/2-(nH-1)/2*ds+i*ds,height-ds/2-(nV-1)*ds+j*ds));
    }
  }
}
void draw(){
  background(0);
  for(int m=0;m<rate;m++){
    for(int i=0;i<nH-1;i++){
      for(int j=0;j<nV;j++){
        reactor(nodes[i][j],nodes[i+1][j],new PVector(ds/2,0),0);
      }
    }
  //  for(int j=0;j<nV;j++){
  //    reactor(nodes[nH-1][j],nodes[0][j],new PVector(ds/2,0),TWO_PI);
  //  }
    for(int i=0;i<nH;i++){
      for(int j=0;j<nV-1;j++){
        reactor(nodes[i][j],nodes[i][j+1],new PVector(0,ds/2),0);
      }
    }
    for(int i=0;i<nH;i++){
      for(int j=0;j<nV;j++){
        boolean slip = false;
        if(nodes[i][j].x.x<ds/2){
          nodes[i][j].f.add(new PVector((ds/2-nodes[i][j].x.x)*k,0));
          slip = true;
        }
        if(nodes[i][j].x.x>width-ds/2){
          nodes[i][j].f.add(new PVector(
            (nodes[i][j].x.x-width+ds/2)*-k,0));
          slip = true;
        }
        if(nodes[i][j].x.y<ds/2){
          nodes[i][j].f.add(new PVector(0,(ds/2-nodes[i][j].x.y)*k));
          slip = true;
        }
        if(nodes[i][j].x.y>height-ds/2){
          nodes[i][j].f.add(new PVector(0,
            (nodes[i][j].x.y-height+ds/2)*-k));
          slip = true;
        }
        if(slip){nodes[i][j].v = PVector.mult(nodes[i][j].v,1.0-c);}
        nodes[i][j].update();
        if(hold1==i&&hold2==j){nodes[i][j].grip();}
      }
    } 
  }
  for(int i=0;i<nH;i++){
    for(int j=0;j<nV;j++){
      nodes[i][j].draw();
    }
  }
}
void reactor(node A,node B,PVector dxo,float offset){
  PVector refA = PVector.add(A.toWorld(dxo),A.x);
  PVector refB = PVector.add(B.toWorld(PVector.mult(dxo,-1)),B.x);
  PVector dx = PVector.sub(refB,refA);
  PVector mid = PVector.add(refA,PVector.mult(dx,0.5));
  PVector F = PVector.mult(dx,k);
  PVector dvmid = PVector.sub(B.vat(mid),A.vat(mid));
  F.add(PVector.mult(dvmid,c));
  A.force(F,mid);
  B.force(PVector.mult(F,-1),mid);
//  float dp = (((B.p-A.p)+PI)%TWO_PI)-PI;
  float dp = constrain(B.p-A.p+offset,-PI,PI);
  dp *= kw;
  dp += (B.w-A.w)*cw;
  A.t += dp;
  B.t -= dp;
}
int hold1 = -1;
int hold2 = -1;
void mousePressed(){
  PVector mo = new PVector(mouseX,mouseY);
  for(int i=0;i<nH;i++){
    for(int j=0;j<nV;j++){
      PVector dx = PVector.sub(nodes[i][j].x,mo);
      if(dx.mag()<ds/2){
        hold1 = i;
        hold2 = j;
      }
    }
  }
}
void mouseReleased(){
  hold1 = -1;
  hold2 = -1;
}
int rate = 3;
void keyPressed(){
  switch(key){
    case ' ':
    reset();
    break;
    case '1':
    rate = 1;
    break;
    case '2':
    rate = 2;
    break;
    case '3':
    rate = 3;
    break;
    case '4':
    rate = 4;
    break;
    case '5':
    rate = 5;
    break;
    case '6':
    rate = 6;
    break;
    case '7':
    rate = 7;
    break;
    case '8':
    rate = 8;
    break;
    case '9':
    rate = 9;
    break;
    case '0':
    rate = 10;
    break;
  }
}


