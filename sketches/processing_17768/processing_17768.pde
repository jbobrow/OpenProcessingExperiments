
PVector[] pnts;
float rad = 1000;
PVector dir;
float speed = 5.5;
void setup(){
  size(600,400,P3D);
  pnts = new PVector[50000];
  for(int i=0;i<pnts.length;i++){
    pnts[i] = getPnt();
    pnts[i].mult(pow(random(0,1),0.5));
  }
  dir = new PVector(0,0,1);
  mid = new PVector(width/2,height/2);
}
PVector getPnt(){
  PVector pnt = new PVector(random(-1,1),
    random(-1,1),
    random(-1,1));
  pnt.normalize();
  pnt.mult(rad);
  return pnt;
}
PVector mid;
void draw(){
  if(frameCount%30==0){println(frameRate);}
  background(0);
  for(int i=0;i<pnts.length;i++){
    if(pnts[i].mag()<rad){
      if(pnts[i].z<width/2){
        stroke(int((1.0-pnts[i].mag()/rad)*255.0));
        beginShape(POINTS);
        PVector drawPnt = PVector.add(pnts[i],mid);
        vertex(drawPnt.x,drawPnt.y,drawPnt.z);
        endShape();
      }
    }else{
      pnts[i] = getPnt();
    }
    pnts[i].add(PVector.mult(dir,speed));
  }
  dir = new PVector(width/2-mouseX,height/2-mouseY,width/2);
  dir.normalize();
  if(mousePressed){
    float bump = 0.1;
    switch(mouseButton){
      case RIGHT:
      speed-=bump;
      break;
      case LEFT:
      speed+=bump;
      break;
    }
    speed = constrain(speed,-15.5,15.5);
  }
}

