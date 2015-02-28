
//Mitchell Karchemsky

float goldenRatio = (sqrt(5)+1)/2;
float goldenAngle = (goldenRatio-1)*2*PI;
float offSet      = .9;      
int currGen       = 0;
float lastX       = width/2;
float lastY       = width/2;
int i             = 0; 
//Colors
int R             = (int)(goldenRatio+(i*goldenRatio)%255);
int G             = (int)(goldenRatio+(i)%255);
int B             = (int)(goldenRatio+(i*goldenRatio)%255);
//UI
int counter       = 0;
int delta         = 1;
boolean drawLine  = false;
boolean pauseTime = false;
int radiusOffset  = 15;

//Program Start
void setup(){
  size(500, 500);
  smooth();
  noStroke();
}

void draw(){
  background(goldenRatio);
  
  float localGeneration = currGen+1;
  float radius    = width/2 + radiusOffset;
  float asmall = (goldenRatio*radius*radius)/localGeneration;   //What does asmall do?

  float cumulativeArea = 0;              //What does cumulativeArea do?
  for(i=0;i<localGeneration;i++){

    float angle = i*goldenAngle;
    //fill(100+(i*5)%100);              //Colorss
    changeColor();
    fill(R,G,B);
    float itterativeRatio  = i/(localGeneration-1);
    float nodeOffset       = asmall*offSet*2*itterativeRatio - asmall*offSet;
    float nodeArea         = asmall + nodeOffset;
    float nodeRadius       = sqrt(nodeArea/PI);
    float cumulativeRadius = sqrt(cumulativeArea/PI);
    
    nodeRadius *= min(1.2,(localGeneration-i)/32);
    
    float xLocation = width/2 + sin(angle)*(cumulativeRadius+nodeRadius);
    float yLocation = width/2 + cos(angle)*(cumulativeRadius+nodeRadius);
    
    ellipse(xLocation-nodeRadius, yLocation-nodeRadius, nodeRadius*2, nodeRadius*2);
    if(drawLine==true&&i%delta==0){
      stroke(255,255,255);
      strokeWeight(3);
      line(lastX,lastY,xLocation,yLocation);
      lastX = xLocation;
      lastY = yLocation;
      noStroke();  
    }
    cumulativeArea += PI*nodeRadius*nodeRadius;
  }
  
  currGen++;
}

void mousePressed(){
  counter++;
  changeColor();
}

void changeColor(){
  int colorSchemes = 4;
  //Color Scheme changer
  counter%=colorSchemes;
  switch (counter){
    case 0:
      //Aubrey's Joker
      R = (int)(goldenRatio+(i*goldenRatio)%256);
      G = (int)(goldenRatio+(i)%256);
      B = (int)(goldenRatio+(i*goldenRatio)%256);
    break;

    case 1 :
      //Reds and Blues
      R = (int)(i%256);
      G = (int)(goldenRatio);
      B = (int)(goldenRatio+(i*goldenRatio)%256);
    break;

    case 2:
    //purple rose
      R = (int)(i*goldenRatio%256);
      G = (int)(goldenRatio/i%255);
      B = (int)(goldenRatio+(i*goldenRatio)%256);
    break;

    case 3:
    //
      R = (int)((i+goldenRatio)%256);
      G = (int)((goldenRatio/i)%255);
      B = (int)(goldenRatio+(i*goldenRatio)%256);
    break;
  }
}
void keyPressed(){
  if(key == CODED){
    if(keyCode == UP){
      delta++;
    }
    else if(keyCode == DOWN){
      delta--;
      if(delta==0){delta=1;}
    }
    else if(keyCode == LEFT){
      if(delta!=1){previousFib();}
    }
    else if(keyCode == RIGHT){
      delta++;
      nextFib();
    }
    else if(keyCode == CONTROL){
       if(drawLine==false){drawLine=true;}
       else{drawLine=false;}
    }
  }
  println(pauseTime);
}

void previousFib(){
  int fibbIndex = 0;
  while(delta > fib(fibbIndex)){
    fibbIndex++;
  }
  delta = fib(fibbIndex-1);
}

void nextFib(){

  int fibbIndex = 0;
  while(delta > fib(fibbIndex)+1){
    fibbIndex++;
  }
  delta = fib(fibbIndex);
}

int fib(int n){
  return(n<=1?1:fib(n-1)+fib(n-2));
}


