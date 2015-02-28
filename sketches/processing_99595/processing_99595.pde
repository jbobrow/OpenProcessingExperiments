
//Mitchell Karchemsky

float goldenRatio = (sqrt(5)+1)/2;
float goldenAngle = (goldenRatio-1)*2*PI;
float offSet      = .9;      
int currGen       = 0;
float lastX       = width/2;
float lastY       = width/2;
int i             = 0; 
//Colors
int R             = (int)(goldenRatio+(i*goldenRatio)%5);
int G             = (int)(goldenRatio+(i)%5);
int B             = (int)(goldenRatio+(i*goldenRatio)%5);
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
    //fill(100+(i*5)0);              //Colorss
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
    if(drawLine==true&&i
