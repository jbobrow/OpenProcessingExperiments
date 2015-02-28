
int bubbleCount=120;
float bubbleSpeed = 4;
float bubbleAcceleration = 1.025;
float bubbleSizeFactor = 10;
float swashFactor = 0.35;  //From 0.0 to 1.0
float xGlobalArg,yGlobalArg;
float[]xArg = new float[bubbleCount];
float[]yArg = new float[bubbleCount];
float[]xPos = new float[bubbleCount];
float[]yPos = new float[bubbleCount];
float[]xSpeed = new float[bubbleCount];
float[]ySpeed = new float[bubbleCount];
float[]xySpeed = new float[bubbleCount];
float[]bSize = new float[bubbleCount];
float[]bWeight = new float[bubbleCount];
float[]bTransparency = new float[bubbleCount];
color[]bColor = new color[bubbleCount];

void setup(){
  size(900,500);

  for(int i=0;i<bubbleCount;i++){
    xSpeed[i]=random(-bubbleSpeed,bubbleSpeed);
    ySpeed[i]=random(-bubbleSpeed,bubbleSpeed);  
    xPos[i]=xSpeed[i]*(width/2)/bubbleSpeed;
    yPos[i]=ySpeed[i]*(height/2)/bubbleSpeed;
    bColor[i] = color(random(0,250),random(50,235),random(100,255));
    xArg[i]=random(0,100);
    yArg[i]=random(0,100);
  }
  xGlobalArg=random(0,100);
  yGlobalArg=random(0,100);
  smooth();
  frameRate(30);  
}

void draw(){
  background(0);
  translate(width/2,height/2);

  for(int i=0;i<bubbleCount;i++){
    float j = noise(xArg[i])-0.5;
    float k = noise(yArg[i])-0.5;
    float l = noise(xGlobalArg)-0.5;
    float m = noise(yGlobalArg)-0.5;
    xPos[i]+=xSpeed[i]+j*bSize[i]*swashFactor+l*bubbleSizeFactor*6*swashFactor;
    yPos[i]+=ySpeed[i]+k*bSize[i]*swashFactor+m*bubbleSizeFactor*6*swashFactor;

    xSpeed[i]*=bubbleAcceleration;
    ySpeed[i]*=bubbleAcceleration;
    xySpeed[i] = sqrt(pow(xSpeed[i],2)+pow(ySpeed[i],2));
    bSize[i] = bubbleSizeFactor*xySpeed[i];
    bWeight[i]=2+bSize[i]/20;
    bTransparency[i]=map(bSize[i],0,bubbleSizeFactor*sqrt(2*bubbleSpeed*bubbleSpeed),40,255);

    noFill();
    strokeWeight(bWeight[i]);
    stroke(bColor[i]);
    if(bTransparency[i]<255)
      stroke(bColor[i],bTransparency[i]);
    ellipse(xPos[i],yPos[i],bSize[i],bSize[i]);  

    if(xPos[i]>(width+bSize[i])/2 || xPos[i]<-(width+bSize[i])/2||
      yPos[i]>(height+bSize[i])/2 || yPos[i]<-(height+bSize[i])/2){
      xSpeed[i]=random(-bubbleSpeed,bubbleSpeed);
      ySpeed[i]=random(-bubbleSpeed,bubbleSpeed);  
      xPos[i]=xSpeed[i]*(width/2)/bubbleSpeed;
      yPos[i]=ySpeed[i]*(height/2)/bubbleSpeed;
      xArg[i]=random(0,100);
      yArg[i]=random(0,100);
    }
    xArg[i]+=0.05;
    yArg[i]+= 0.05;
    xGlobalArg+=0.00005;
    yGlobalArg+=0.00005;
  }
}










