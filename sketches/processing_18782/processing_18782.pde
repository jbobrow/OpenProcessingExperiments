
String myText = "foo";
int numParticles = 1000;
int spread = 5;
int speed = 3;
int gravity = 1;
int bottom = 350;
int particleSizeRange = 10;
int delayNumMin = 50;
int delayNumMax = 200;
int delayNum = delayNumMax;
PFont bob;
float[] posX = new float[numParticles];
float[] posY = new float[numParticles];
boolean[] offSwitch = new boolean[numParticles];
int[] particleSize = new int[numParticles];
int[] strokeColor = new int[numParticles];

void setup(){
  size(640,360);
  smooth();
  background(80,10,100);
  for (int i=0; i<posX.length; i++){
    posX[i] = random(width);
    posY[i] = 0;
    offSwitch[i] = false;
    particleSize[i] = int(random(1,particleSizeRange));
    strokeColor[i] = int(random(255));
  }
  bob = createFont("",48);
}

void draw(){
  //background(200);

  if(mousePressed&&delayNum>=delayNumMin){
    delayNum-=10;
    if(delayNum<delayNumMin){
      delayNum=delayNumMin;
    }
  } 
  else {
    delayNum = delayNumMax;
  }  
  for (int i=0; i<posX.length; i++){
    if(!offSwitch[i]){
      posY[i]+=random(speed)-random(speed)+gravity;
      posX[i]+=random(spread) - random(spread);
      if(posY[i]>bottom){
        posY[i]=bottom;
        offSwitch[i]=true;
      }
    }
    if(mousePressed){
      strokeWeight(1);
      stroke(255,0,0,random(5));
      line(mouseX,mouseY,posX[i],posY[i]);
      posX[i] += (mouseX-posX[i])/delayNum;
      posY[i] += (mouseY-posY[i])/delayNum;
    }
    if(mouseX<posX[i]+(particleSize[i]/2)&&mouseX>posX[i]-(particleSize[i]/2)&&mouseY<posY[i]+(particleSize[i]/2)&&mouseY>posY[i]-(particleSize[i]/2)){
      offSwitch[i]=false;
    }
    fill(strokeColor[i]);
    textFont(bob,particleSize[i]);
    text(myText,posX[i],posY[i]);
  }
  println(delayNum);
}





