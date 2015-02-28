
class Angle implements Constraint{
  
  private Sphere s,s1,s2,s3,ref;
  private float angulo;
  private float distanciaC;
  private PVector h1,h2,h3,h4;
  private PVector n;
  private ArrayList restriccionTemporal;
  private Stick stick;
  private boolean mode;
  
 public Angle(Sphere ref,Sphere s, Sphere s1,Sphere s2,Sphere s3, float angulo,PVector n,ArrayList restriccionTemporal){
  this.s=s;
  this.s1=s1;
  this.s2=s2;
  this.s3=s3;
  this.ref=ref;
  this.restriccionTemporal = restriccionTemporal;
  
  this.angulo = angulo;
  this.n = n;
  
  PVector vec = new PVector(0,0,0);
  vec.add(s3.getVector());
  vec.sub(s.getVector());
  //println(sin(PI/2-radians(angulo)));
  float modulo = sqrt(vec.x*vec.x+vec.y*vec.y+vec.z*vec.z);
  
  distanciaC = sin(PI/2-radians(angulo))*modulo;
  //println("distancia: "+distanciaC);
  PVector p2 = s3.getVector();
  PVector p1 = s.getVector();
  
  float d = -n.x*p2.x-n.y*p2.y-n.z*p2.z;
  float d2 = n.x*p1.x+n.y*p1.y+n.z*p1.z+d;
  float d3 = sqrt(n.x*n.x+n.y*n.y+n.z*n.z);
  float distancia = abs(d2)/d3;

  this.mode = mode;
  
  
 }
 
 
 
 
 public boolean apply(){
  PVector p2 = s3.getVector();
  PVector p1 = s.getVector();
  
  PVector A = s1.getVector();
 PVector C = s2.getVector();
 PVector B = s3.getVector();
  
  float d = -n.x*p2.x-n.y*p2.y-n.z*p2.z;
  float d2 = n.x*p1.x+n.y*p1.y+n.z*p1.z+d;
  float d3 = sqrt(n.x*n.x+n.y*n.y+n.z*n.z);
  float distancia = -1*d2/d3;
 // println("distancia: "+distancia+" distanciac: "+distanciaC);
  if(distancia<=distanciaC){
 
    PVector v = ref.getVector();
    restriccionTemporal.remove(stick);
   stick = new Stick(ref,s3,true,v.dist(B)+abs(distanciaC-distancia));
   restriccionTemporal.add(stick);
  // println("añado stick");
  // println(restriccionTemporal.size());
   s1.setPint(true);
   return true;
  }
  else{
   restriccionTemporal.remove(stick); 
   s1.setPint(false);
   return false;
  }
  
  
 }


public void draw(){
  
}
}

