

class Network {
  
  //SPRING PARAMETERS
  float sprConstant=0.5;
  float sprDamping=0.1;
  float sprStrength=0.5;
  float sprLength=10;
  float rad=1;
  int x=10,y=10;
  int step=(width/2)/x;
  
  Particle p;
  Particle pOrigin_;
  VerletSpring2D s;
  
  
  Network(Particle pOrigin_){
    pOrigin=pOrigin_;
  }
  
  void setSpr() {
    //particles
    for(int i=0;i<y;i++){  
      for (int j=0;j<x;j++){
        p=new Particle(j*step,i*step,rad);
        nodalNet.add(p);//add to array list
        physics.addParticle(p);//add to physics
        }
      }
      //springX
      for(int i=0;i<y;i++){
        int row=i*x;
        for (int j=1;j<x;j++){
          Particle p0=(Particle)nodalNet.get(row+j-1);
          Particle p1=(Particle)nodalNet.get(row+j);
          s=new VerletSpring2D(p0,p1,random(sprLength,100),sprStrength);//sprLength,sprStrength);
          physics.addSpring(s); 
          //println(i+" "+(col+j-1)+" "+(col+j));
         }
       }
       //springY
       for(int i=0;i<y-1;i++){
         int row=(i*x);
        for (int j=0;j<x;j++){
          Particle p0=(Particle)nodalNet.get(row+j);
          Particle p1=(Particle)nodalNet.get(row+j+x);
          s=new VerletSpring2D(p0,p1,sprLength,sprStrength);
          physics.addSpring(s); 
          println(i+" "+(row+j)+" "+(row+j+x));
         }
       }
    //set anchor  
    Particle p0=(Particle)nodalNet.get(0);
    p0.lock();
    Particle p1=(Particle)nodalNet.get(x-1);
    p1.lock();
      
    }

  void setAnchor() {
    
  }
   
  void displaySprNet(){
    //ellipses
    for(int i=0;i<nodalNet.size();i++){
      p=(Particle)nodalNet.get(i);
      p.display();
    }
    //springX
    for(int i=0;i<y;i++){
        int col=i*x;  
        for (int j=1;j<x;j++){
          Particle p0=(Particle)nodalNet.get(col+j-1);
          Particle p1=(Particle)nodalNet.get(col+j);
          line(p0.x,p0.y,p1.x,p1.y);
         }
       }
    
    //springY
    for(int i=0;i<y-1;i++){
      int row=(i*x);
      for (int j=0;j<x;j++){
        Particle p0=(Particle)nodalNet.get(row+j);
        Particle p1=(Particle)nodalNet.get(row+j+x);
        line(p0.x,p0.y,p1.x,p1.y);
      }
     }
    
    
  }

}


