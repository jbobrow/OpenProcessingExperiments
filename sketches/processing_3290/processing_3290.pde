
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
  int mode;
  //Constructor
  LemniscateParticle(float centreXI,float centreYI,color myColorI, int myAlphaI, float aI,float tI, float intervalI,float stepI, int myStrokeWeightI,int modeI){
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
    mode = modeI;
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
    }
    catch(ArrayIndexOutOfBoundsException e){

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
    boolean noNoise = false;
    switch (mode){
    case 1:
      X = 2*a*cos(k)/(sin(k)*sin(k)+1);
      Y = abs(tan(k)*X);
      a= tan(k)*300;
      break;
    case 2:
      Y = abs(tan(k)*X);
      a= tan(k)*600;
      break;
    case 3:
      X  =a*cos(k)/(sin(k)*sin(k)+1);
      Y = tan(k)*X;
      a=  cos(k)*300;
      X = X/2;
      break;
    case 4:
      X = -a*cos(k)/(sin(k)*sin(k)+1);
      Y = tan(k)*X;
      a=  cos(k)*300;
      X = X/2;
      break;
    case 5:
      X = 2*a*cos(k)/(sin(k)*sin(k)+1);
      Y = abs(tan(k)*X);
      a= tan(k)*300;
      noNoise= true;
      break;
    case 6:
      Y = abs(cos(k)*X);
      a=  500;
      X=X/2;
      break;
    case 7:
      Y = abs(tan(k)*X);
      a= tan(k)*300;
      break;
    case 8:
      Y = abs(tan(k)*X);
      a= tan(k)*600;
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
      Y = cos(k)*X/4;
      a=  70;

    }
    float ranbla= bla;
    if (noNoise == false){
      X+=noise(n)*ranbla-ranbla*0.5;
      Y+=noise(n2)*ranbla-ranbla*0.5;
    }
    n+=0.01;
    n2+=0.02;
  }
}

LemniscateParticle[] particle;
static int nParticle=1000;
static int the_width = 900;
static int the_height = 600;
static float golden_ratio = 0.5+sqrt(5); 
static float mya = the_width/golden_ratio;
static float bla = mya/golden_ratio/4;
int globalalpha;
int globalColor;
int globalMode=0;
String[] slogan = {
  "Captain: What happen?",
  "Mechanic: Somebody set up us the bomb.",
  "Operator: We get signal.",
  "Captain: What !",
  "Operator: Main screen turn on. ",
  "Captain: It's You !! ",
  "Cats: How are you gentlemen !! ",
  "Cats: All your base are belong to us. ",
  "Cats: You are on the way to destruction. ",
  "Captain: What you say !! ",
  "Cats: You have no chance to survive \n make your time.",
  "Cats: HA HA HA HA .... ",
  "Cats: HA HA HA HA .... ",
  "Captain: Take off every \'zig\' !! ",
  "Captain: You know what you doing. ",
  "Captain: Move 'ZIG'. ",
  "Captain: For great justice."
};
int textline = 0;
boolean test=true;
PFont fontA;

void setup(){
  size(the_width,the_height,P2D);
  background(0);
  colorMode(HSB);
  frameRate(30);
  particle = new LemniscateParticle[nParticle+nParticle/8*5];
  for(int i=0; i<nParticle/8; i++){
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
    particle[i]= new LemniscateParticle(the_width/2,the_height/2+150,tempColor,tempAlpha,mya+random(40),startAngle,interval,step,weight,5);
  }

  for(int i=nParticle/8; i<nParticle/4; i++){
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
    particle[i]= new LemniscateParticle(the_width/2,the_height/2+200,tempColor,tempAlpha,mya+random(40),startAngle,interval,step,weight,5);
  }
  for(int i=nParticle/4; i<nParticle/4*2; i++){
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
    particle[i]= new LemniscateParticle(the_width/2+30,the_height/2,tempColor,tempAlpha,mya+500+random(40),startAngle,interval,step,weight,3);
  }
  for(int i=nParticle/4*2; i<nParticle/4*3; i++){
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
    particle[i]= new LemniscateParticle(the_width/2-30,the_height/2,tempColor,tempAlpha,mya/2+500+random(40),startAngle,interval,step,weight,4);
  }

  for(int i=nParticle/4*3; i<nParticle; i++){
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
    particle[i]= new LemniscateParticle(the_width/2,the_height/2-300,tempColor,tempAlpha,mya/2+random(40),startAngle,interval,step,weight,2);
  }

  for(int i=nParticle; i<nParticle/8+nParticle; i++){
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
    particle[i]= new LemniscateParticle(the_width/2-100,the_height/2+30,tempColor,tempAlpha,mya,startAngle,interval,step,weight,17);
  }

  for(int i=nParticle/8+nParticle; i<nParticle/4+nParticle; i++){
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
    particle[i]= new LemniscateParticle(the_width/2+100,the_height/2+30,tempColor,tempAlpha,mya,startAngle,interval,step,weight,17);
  }

  for(int i=nParticle/4+nParticle; i<nParticle/8*3+nParticle; i++){
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
    particle[i]= new LemniscateParticle(the_width/2-100,the_height/2,tempColor,tempAlpha,mya,startAngle,interval,step,weight,17);
  }

  for(int i=nParticle/8*3+nParticle; i<nParticle/2+nParticle; i++){
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
    particle[i]= new LemniscateParticle(the_width/2+100,the_height/2,tempColor,tempAlpha,mya,startAngle,interval,step,weight,17);
  }

  for(int i=nParticle/2+nParticle; i<nParticle/8*5+nParticle; i++){
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
    particle[i]= new LemniscateParticle(the_width/2,the_height/2+175,tempColor,tempAlpha,mya,startAngle,interval,step,weight,5);
  }
  fontA = loadFont("AndaleMono-48.vlw");
  textAlign(CENTER);  
  textFont(fontA, 36);

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

  if (globalalpha<5){
    fill(200);
    text(slogan[textline], width/2, height/2);
    test=false;
  }
  else{

    if ((!test)){
      fill(200);
      textline = (textline+1)%slogan.length; 
      test = true;
    }
  }
  fill(150);
  //text(str(globalalpha), 60, 60);
  globalalpha  = int(sq(sin((frameCount%512)/512.0*TWO_PI))*(frameCount%256));
  int mysize =particle.length;
  for(int i=0; i<mysize; i++){
    particle[i].update();
    particle[i].draw();
  }
}





