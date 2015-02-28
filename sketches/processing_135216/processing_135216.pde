
int sizeX = 230;
int sizeY = 230;

int count = 63;
float inc = 858;

Tentacle[] tentacles; 

//MAIN METHODS------------------------------------------------------
void setup(){
  size(sizeX,sizeY,P2D);
  smooth();
  noFill();
  
  begin();
  
}

void draw(){
  
  background(255,55,36);
  inc -= 0.8;
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
  float[] a = new float[56];
  float[] b = new float[3];
  float[] c = new float[3];
  float tLength;
  float stepSize;
  float tRotate;
  int   alpha;
  
  Tentacle(){
    for(int i=0;i<3;i++){
      a[i] = random(0.005,0.53);
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
    stroke(100,alpha);
    while(x<tLength){
      float r = map(x,0,tLength,30,1);
      float A = map(x,0,tLength,0,1);
      y = sin(a[0]*y+b[0]+inc)*c[0] + sin(a[1]*x+b[1]+inc)*c[1] + sin(a[2]*x+b[2]+inc)*c[2];
      y = y*A;
      ellipse(y,y,r,r);
      if(r>15)
      stepSize = r/10;
      x += stepSize;
    }
    popMatrix();
  
  }
  
}
