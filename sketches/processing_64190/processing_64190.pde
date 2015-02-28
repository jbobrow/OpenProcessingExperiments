
public void initParticles() {
  p=new Particle[n];
  noiseT=random(10000);
  for(int i=0; i<p.length; i++) p[i]=new Particle();
  background(255);
  
  rot=new UVec3(1,0,0).rotateZ(random(TWO_PI));
}

class Particle {
  UVec3 pos,posLast,velo,tangent;
  int col;
  
  Particle() {
    init();
  }
  
  void init() {
    pos=new UVec3(random(width),random(height));
    posLast=new UVec3(pos);
    velo=new UVec3(1,0,0).rotateZ(random(PI));
    tangent=new UVec3();
    
    col=UColorTool.interpolate(random(1),"000000","CCFFFF");
  }
  
  void draw() {
    stroke(col);
    
    float noiseY=noiseT+pos.y*noiseD*0.5;
    float noiseX=(100-noiseT)+pos.x*noiseD*0.5;
    
    velo.set(
      noise(noiseY)-0.5,noise(noiseX)-0.5).
      mult(speed);
      
    velo.set(speed,0).
      rotate((noise(noiseY,noiseX)-0.5)*2*TWO_PI);

    posLast.set(pos);
    pos.add(velo);
//    tangent.set(velo).norm(velo.length());//.rotateZ(HALF_PI);
    
//    ellipse(pos.x,pos.y, 1,1);
    
    line(
      pos.x,pos.y,
      posLast.x,posLast.y);
    
    if(pos.x<0 || pos.x>width || pos.y<0 || pos.y>height)
      init();
  }
}

