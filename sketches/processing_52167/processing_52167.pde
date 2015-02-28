
ArrayList objs=new ArrayList();
int c=200;
int d=270; 
float dt=0.5;
void setup() {  //setup function called initially, only once
  size(650, 650);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  int t=500;
  int s=350/t;    
  for ( int k=0;k<=t;k++){
    Obj o = new Obj(s*k+s,s*k+s);
    objs.add(o);      
  }
}

void draw() {
 // background(255); 
  ellipse(c,d,10,10);  
  for (int k=0;k<objs.size();k++){
     Obj o = (Obj)objs.get(k);
     o.draw();       
  }          
  c=c+0.03;
  d=d+0.01;
}
class Obj{
  int x, y, vx,vy, cg,cb, cr;
  Obj(int x, int y){
     this.x=x;this.y=y; 
     vx = 0; vy = 2;
     cg=50+ random(205); cb= 50+random(205); cr= 50+random(205); 
  }
public void draw(){
  float dx = x-c;  float dy=y-d;
  float z= sqrt (dx*dx+dy*dy);// distance to center
  if(z<30)z=30;  // limit to get too close
  float f = 500/(z*z);  // force of gravity
  float fx = -f*dx/z; float fy = -f*dy/z;   // gravity components 
  vx=vx+fx*dt; vy =vy+fy*dt; // integrate velocities
  x=x+vx*dt;y=y+vy*dt; // integrate positions
  stroke(cg,cb, cr) ; 
  ellipse(x,y,2,2);
}  
}          
                                                                                                                                                                                                                                                                                                                                                
