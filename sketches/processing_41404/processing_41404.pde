
int c=20;
Pint[] pint=new Pint[c];
void setup(){
  size(400,400);
  for(int i=0;i<c;i++){
    pint[i]=new Pint(map(i,0,c,0,TWO_PI));
  }
  smooth();
  background(255);
}
void draw(){
  //background(255);
  for(int i=0;i<c;i++){
    pint[i].update();
    
  }
  beginShape();
  curveVertex(pint[c-2].x,pint[c-2].y);
  curveVertex(pint[c-1].x,pint[c-1].y);
  for(int i=0;i<c;i++){
    curveVertex(pint[i].x,pint[i].y);
  }
  curveVertex(pint[0].x,pint[0].y);
  endShape();
}
class Pint{
  int x, y;
  float theta, magnitude,omega,time,timestep=0.1;
  Pint(float a){
    theta=a;
  }
  void update(){
    time+=timestep;
    omega=noise(theta,time+1)/5;
    magnitude=noise(theta,time+2)*(sin(radians(time))*200);
    x=int(magnitude*cos(theta+omega)+mouseX);
    y=int(magnitude*sin(theta+omega)+mouseY);
  }
}
void keyPressed(){
background(255);
}
    
  
