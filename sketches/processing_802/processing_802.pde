
import noc.*;
int MAX = 9;
Part[] p = new Part[MAX];

void setup()
{
  size(800, 600);
  noStroke();
  smooth();
  create();
}
void draw(){

  background(#000000);
//  fill(#000000,10);
//  rect(0, 0, width, height);
  for (int i = 0; i < p.length; i++) {
    for (int j = 0; j < p.length; j++) {
      if (i != j) { 
        
  GregorianCalendar d = new GregorianCalendar();
  int sc = d.get(Calendar.SECOND);   
  

        
           
             //if(sc%3 == 2){
                Vector3D f = p[i].calcGravForce(p[j], 0.1f); 
                p[i].add_force(f);
              //}
            
            
            if(Vector3D.distance(p[i].l, p[j].l) <= p[i].getRadius()+p[j].getRadius())
            { 
              Vector3D vi = p[i].getVel(); 
              Vector3D vj = p[j].getVel(); 
              p[i].v = vj; 
              p[j].v = vi;      
            }
            if(Vector3D.distance(p[i].l, p[j].l) < p[i].getRadius()+p[j].getRadius())
            { 
               Vector3D dir = Vector3D.sub(p[i].getLoc(), p[j].getLoc());
               dir.div(p[i].getRadius());
               p[i].l.add(dir);     
            }
  
      }
    }
    p[i].live();         
    
    // friction
    Vector3D actualVel = p[i].getVel(); 
    Vector3D attrito = Vector3D.mult(actualVel, -0.09); 
    p[i].add_force(attrito);     
    
    
    
     
  }
}


void create(){
   for (int i = 0; i < p.length; i++) {
 
    Vector3D l = new Vector3D(random(10, width-10),random(10, height-10)); 
    Vector3D v = new Vector3D();
    Vector3D a = new Vector3D();
    p[i] = new Part (l, v, a, 7, 12);
    
  }
}











class Part 
{
  Vector3D l; 
  Vector3D v; 
  Vector3D a; 
  Vector3D rd;   
  float m; 
  int r;
  int cl = 0;
  
  Part(Vector3D l,Vector3D v,Vector3D a, float m, int r)
  {
    this.l = l;
    this.v = v;
    this.a = a;
    this.m = m;
    this.r = r;
  }
  
  void live()
  {
    update();
    borders();
  }
  
  void update()
  {
  v.add(a);
  //v.limit(1.0f);
  l.add(v);
  a.setX(0.0f); 
  a.setY(0.0f); 
  //print(v.x+ " ");
  
  // disegna
  fill(#ffffff, 100);
  ellipse(l.x, l.y, r*2, r*2);
  //line(l.x, l.y, l.x, l.y);
  }
  
  boolean pop() { 
    if (((l.x > width-0) || (l.x < 0)) || ((l.y > height-0) || (l.y < 0))){ 
      return true;
    }
    else return false;   
  }  
  
  
  void borders() {
    if ((l.x > width-r) || (l.x < r)) {
      v.x *= -1;
    }       
    if ((l.y > height-r) || (l.y < r)){
      v.y *= -1;
    }
  }  
  
  
  void setLoc(Vector3D l) {
    l = l;
  }

  void setVel(Vector3D v) {
    v = v;
  }

  void setAcc(Vector3D a) {
    a = a;
  }
  
  void add_force(Vector3D force) {
    force.div(m);  
    a.add(force); 
  }
  

    Vector3D calcGravForce(Part p, float gravConstant) {
    Vector3D dir = Vector3D.sub(p.getLoc(), l);
    float d = dir.magnitude();
    //lalloamalalloamaklalloamalalloamalallon trracy
    //d = constrain(d,10.0,200.0f);                        
    //dir.normalize();
    float force = (gravConstant * m * p.getMass()) / (d * d);
    //print(" "+force);
    dir.mult(force);     
    return dir;
    }
  
  
  
  
  Vector3D getVel() { 
    return v.copy(); 
  }
 
  Vector3D getAcc() { 
    return a.copy(); 
  } 
 
  Vector3D getLoc() { 
    return l.copy(); 
  } 
  
  float getRadius() {
    return r;
  }
  float getMass() {
    return m;
  }
  
}  


