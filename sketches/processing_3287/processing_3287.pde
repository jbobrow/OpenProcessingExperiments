
class LemniscateParticle{
  float inversedInterval;
  float a;
  float t;
  float X;
  float Y ;
  float oldX,oldY;
  float oldX2,oldY2;
  float oldX3,oldY3;
  float interval;
  float step;
  float centreX;
  float centreY;
  color myColor;
  int myAlpha;
  int myStrokeWeight;
  float n = 0;
  float n2 = 0;
  //Constructor
  LemniscateParticle(float centreXI,float centreYI,color myColorI, int myAlphaI, float aI,float tI, float intervalI,float stepI, int myStrokeWeightI){
    a=aI;
    t=tI;
    interval = intervalI;
    inversedInterval=1/interval;
    step = stepI;
    float k = t/interval*TWO_PI;
    X = a*cos(k)/(sin(k)*sin(k)+1);
    Y = a*cos(k)*sin(k)/(sin(k)*sin(k)+1);

    oldX3=oldX=oldX2=X;
    oldY3=oldY=oldY2=Y;
    centreX=centreXI;
    centreY=centreYI;
    myColor = myColorI;
    myAlpha = myAlphaI;
    myStrokeWeight=myStrokeWeightI;
    n = random(stepI);
    n2 = random(stepI);
  }
  void draw(){
    pushMatrix();
    //translate(centreX+noise(n)*80-40,centreY+noise(n)*80-40);
    translate(centreX,centreY);
    strokeWeight(myStrokeWeight);
    noFill();

    stroke(globalColor,255,255,globalalpha);
    try{
    bezier (X,Y,oldX,oldY,oldX2,oldY2,oldX3,oldY3);
    }catch(ArrayIndexOutOfBoundsException e){

    }
    popMatrix();
  }
  void update(){
    t = (t+step)%interval;
    oldX3=oldX2;
    oldY3=oldY2;
    oldX2=oldX;
    oldY2=oldY;
    oldX=X;
    oldY=Y;
    float k = t*inversedInterval*TWO_PI;

    X = a*cos(k)/(sin(k)*sin(k)+1);
    int mode =globalMode;
    switch (mode){
    case 1:
      Y = atan(k)*X;
      a= 100;
      break;
    case 2:
      Y = atan(k)*X;
      a= sin(k)*300;
      break;
    case 3:
      Y = atan(k)*X;
      a= cos(k)*100;
      break;
    case 4:
      Y = atan(k)*X;
      a= tan(k)*300;
      break;
    case 5:
      Y = atan(k)*X;
      a= atan(k)*100;
      break;
    case 6:
      Y = tan(k)*X;
      a= atan(k)*200;
      break;
    case 7:
      Y = tan(k)*X;
      a= tan(k)*300;
      break;
    case 8:
      Y = cos(k)*X;
      a=  sin(k)*500;
      break;
    case 9:
      Y = cos(k)*X;
      a=  tan(k)*300;
      break;
    case 10:
      Y = sin(k)*X;
      a=  atan(k)*250;
      break;
    case 11:
      Y = sin(k)*X;
      a=  sin(k)*700;
      break;
    case 12:
      Y = sin(k)*X;
      a=  atan(k)*200;
      break;
    default:
      Y = sin(k)*X;
      a=  mya;

    }
    float ranbla= bla;
    X+=noise(n)*ranbla-ranbla*0.5;
    Y+=noise(n2)*ranbla-ranbla*0.5;

    n+=0.01;
    n2+=0.02;
  }
}

LemniscateParticle[] particle;
static int nParticle=2000;
static int the_width = 800;
static int the_height = 400;
static float golden_ratio = 0.5+sqrt(5); 
static float mya = the_width/golden_ratio;
static float bla = mya/golden_ratio/2;
int globalalpha;
int globalColor;
int globalMode=0;

PFont fontA;

void setup(){
  size(the_width,the_height,P2D);
  background(0);
  colorMode(HSB);
  frameRate(30);
  particle = new LemniscateParticle[nParticle];
  for(int i=0; i<nParticle; i++){
    int temp = int(random(0,20));
    color tempColor = color(temp,255,255);
    int tempAlpha = int(random(100,200));
    int interval = int(random(300,1500));
    int step = int(random(-2,2));
    while (step ==0){
      step = int(random(-10,10));
    }
    int weight = int(random(1,1));
    float startAngle = random(interval);
    particle[i]= new LemniscateParticle(width/2,height/2,tempColor,tempAlpha,mya+random(40),startAngle,interval,step,weight);
  }
  fontA = loadFont("AndaleMono-48.vlw");
  textAlign(CENTER);  
  textFont(fontA, 48);
  
}
void draw(){
  //background(0);

  translate(0,0);
  fill(0,50);
  noStroke();
  rect(0,0,width,height);
  if (globalalpha==0){
    globalColor  = int(random(255));
    globalMode = int(random(15));
  }
  fill(150);
  //text(str(globalMode), 30, 60);
  globalalpha  = int(sq(sin((frameCount%512)/512.0*TWO_PI))*(frameCount%256));

  for(int i=0; i<nParticle; i++){
    particle[i].update();
    particle[i].draw();
  }
}


