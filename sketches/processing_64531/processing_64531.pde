
class Particles { 

PVector v;
PVector a;
PVector l;
int r;

Particles(PVector _v){
v = _v.get();
a = new PVector (0,0.05,0);
l = new PVector (width/2,width/2);
r = 10;
}

void render(){
 fill(10,200,200);
 ellipseMode(CENTER);
 ellipse(l.x,l.y,r,r); 
}

void update(){
  
   if (l.x > width || l.x < 0){
   v.x*=-0.5;}
   if (l.y > height || l.x < 0){
   v.y*=-0.5;}
  
  
 v.add(a);
 l.add(v);
}

}


