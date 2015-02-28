
ArrayList objs=new ArrayList();
int c=50;
int d=70; 
float dt=0.5;
Obj p;
void setup() {  //setup function called initially, only once
  size(350, 350);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  p= new Obj(100,100,50);
  for ( int k=0;k<1;k++){
    Obj o = new Obj(30*k+30,30*k+30,30);
    objs.add(o);      
  }
}
void mouseDragged(){
   p.vx=(mouseX-p.x)/(p.r*dt);
   p.vy=(mouseY-p.y)/(p.r*dt);
   p.x=mouseX;
   p.y=mouseY;   
 }
void draw() {
  background(255); 
  p.draw();
  for (int k=0;k<objs.size();k++){
     Obj o = (Obj)objs.get(k);
     o.update();     
     o.draw();       
  }          
}
class Obj{
  int x, y, vx,vy, cg,cb, cr,r;
  Obj(int x, int y,r){
     this.x=x;this.y=y; this.r=r;
     vx = 3; vy = 2;
     cg=50+ random(205); cb= 50+random(205); cr= 50+random(205); 
  }
public void update(){
  float dx = x-p.x;  float dy=y-p.y;
  float z= sqrt (dx*dx+dy*dy);// distance to p
  if(x<r || x+r>350){vx=-vx;x=x+vx*dt};
  if(y<r || y+r>350){vy=-vy;y=y+vy*dt};    
  if(z<p.r){ //impact with puck
     float v=sqrt (vx*vx+vy*vy);  
     vx=v*dx/z+p.vx*p.r/r;
     vy=v*dy/z+p.vy*p.r/r;
     p.vx=0; p.vy=0;
  }
  vx=vx*0.999;
  vy=vy*0.999;    
  x=x+vx*dt;y=y+vy*dt; // integrate positions
}
public void draw(){    
  fill(cg,cb, cr) ; 
  ellipse(x,y,r,r);
}  
}                       
                                                                                                                                                                                
