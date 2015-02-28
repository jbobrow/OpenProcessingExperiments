
//B class//a class to pack all particles together///

class B {

 P[] ps;
 
 float 
 factor;  
 int 
 cols,    
 rows;    

  
  //CONSTRUCTOR
  B (int xg,int yg,float factor){
    cols=width/xg;
    rows=height/yg;
    ps=new P[cols*rows];
    for (int i=0;i<ps.length;i++){  
      ps[i]=new P(new PVector(i%cols*xg,floor(i/cols)*yg,0));
    }
    this.factor=factor;
  }
  
  //METHODS
  void update(PVector[] a,float maxDist){
    for(int i=0;i<ps.length;i++){
      for (int j=0;j<a.length;j++){
        float d=PVector.dist(a[j],ps[i].l);
        if(d<maxDist){          
          ps[i].update(a[j],factor);
        }
      }
    }  
  }  
  
  void display(){
    for (int r=0;r<rows;r++){
      //we'll create a ribbed structure, rib for row
      beginShape(TRIANGLE_STRIP);
      for (int c=0;c<cols;c++){
        int i=r*cols+c;
        vertex(ps[i].l.x,ps[i].l.y,ps[i].l.z);
      }
      endShape();
    }
  }
}


//P class//////////////Almost simplest particle class

class P {
  
  PVector l;  //location
 
  //CONSTRUCTOR
  P (PVector l){this.l=l;}
 
  //Main updating method 
  //Very straight-forward -- we calculate the vector that links force and particle and we scale it with
  //the inverse of the distance to make that force less powerful as the p goes further
  void update (PVector f,float sc){
    PVector toF=PVector.sub(l,f);  //this is the vector that expulses the particle far from the force
    float dF=toF.mag();            //this is the magnitude of that vector: the distance 
    toF.normalize();               //we normalize force
    toF.mult(sc/dF);               //and scale it with an arbitrary factor plus the inverse of the distance
    //toF.add(0,0,sc/dF);            //as it goes further it goes up
    l.add(toF);                    //we add it to location
  }
}



