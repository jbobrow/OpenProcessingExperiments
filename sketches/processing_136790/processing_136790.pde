

int sizeX = 500;
int sizeY = 500;
 
int count = 20;
float inc = 0;
 
Tentacle[] tentacles;
 
//MAIN METHODS------------------------------------------------------
void setup(){
  size(sizeX,sizeY,P2D);
  smooth();
  noFill();
   
  begin();
   
}
 
void draw(){
   
  background(250);
  inc -= 0.1;
  for(int i=0;i<count;i++){
    tentacles[i].drawTentacle();
  }
}
 
//METHODS------------------------------------------------------------
void begin(){
  tentacles = new Tentacle[count];
  for(int i=0;i<count;i++){
    tentacles[i] = new Tentacle();
  }
}
 
void mousePressed(){
  if(mouseButton==RIGHT){
    begin();
  }
}
 
//OBJECTS------------------------------------------------------------
class Tentacle{
  float[] a = new float[3];
  float[] b = new float[3];
  float[] c = new float[3];
  float tLength;
  float stepSize;
  float tRotate;
  int   alpha;
   
  Tentacle(){
    for(int i=0;i<3;i++){
      a[i] = random(0.005,0.03);
      b[i] = random(0,TWO_PI);
      c[i] = random(2,50);
    }
    tRotate = random(-PI,PI);
    float scale = cos(tRotate+HALF_PI)+1.5;
    tLength = height*random(0.2,0.3)*scale;
    stepSize = 5;
    alpha = int(random(30,100));
  }
   
  void drawTentacle(){
    float x,y;
    x = 0;
    pushMatrix();
    translate(width/2,height/5*4);
    rotate(tRotate);
    stroke(150,alpha);
    while(x<tLength){
      float r = map(x,0,tLength,30,1);
      float A = map(x,0,tLength,0,1);
      y = sin(a[0]*x+b[0]+inc)*c[0] + sin(a[1]*x+b[1]+inc)*c[1] + sin(a[2]*x+b[2]+inc)*c[2];
      y = y*A;
      line(x,y,r,r);
      if(r>12)
      stepSize = r/20;
      x += stepSize;
    }
    popMatrix();
   
  }
   
}
