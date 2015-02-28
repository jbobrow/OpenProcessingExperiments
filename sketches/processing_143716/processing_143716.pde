
//Copyright Christopher Henley 2014
//Homework 10

String inputData[];
String textData[];
float textSpace[];
float xVals[];
float yVals[];
float deltaX[];
float deltaY[];
int wordColor[];
boolean collision[];


float monoSpace;
float spacing;
int fontHt;

PFont font;


void setup(){
  size(600,600);
  monoSpace=12;
  spacing=10;
  fontHt=18;
  font=createFont("courbd.ttf",fontHt);
  textFont(font);
  
  //Convert string to array of words
  inputData=loadStrings("textData2.txt");
  for (int i=0; i<inputData.length; i++){
    textData=split(inputData[i],' ');
  }
  
  //Determine spacing (length of each word)
  textSpace=new float[textData.length];
  for (int i=0; i<textData.length; i++){
    textSpace[i]=textData[i].length()*monoSpace;
  }
  
  //Initialize x values
  xVals=new float[textData.length];
  for (int i=0; i<textData.length; i++){
    if (i==0){
      xVals[i]=width;
    }else if (i>0){
      xVals[i]=xVals[i-1]+(textSpace[i-1]+spacing);
    }
  }
  
  //Initialize y values
  yVals=new float[textData.length];
  for (int i=0; i<textData.length; i++){
    yVals[i]=height/2;
  }
  
  //Initialize collision check
  collision=new boolean[textData.length];
  for (int i=0; i<textData.length; i++){
    collision[i]=false;
  }
  
  //Initialize delta values
  deltaX=new float[textData.length];
  deltaY=new float[textData.length];
  for (int i=0; i<textData.length; i++){
    deltaX[i]=random(0,2);
    deltaY[i]=random(-2,2);
  }
  
  wordColor=new int[textData.length];
  for (int i=0; i<textData.length; i++){
    wordColor[i]=0;
  }
}

void draw(){
  prepareWindow();
  moveWords();
  drawWords();
}

void prepareWindow(){
  background(255);
}

void moveWords(){
  for (int i=0; i<textData.length; i++){
    if (!collision[i]){
      if (xVals[i]>0){
        xVals[i]-=2;
      }else if (xVals[i]<=0){
        collision[i]=true;
      }
    }
  }
  for (int i=0; i<textData.length; i++){
    if (collision[i]){
      xVals[i]+=deltaX[i];
      yVals[i]+=deltaY[i];
    }
  }
  for (int i=0; i<textData.length; i++){
    if (collision[i]){
      if (xVals[i]>width || xVals[i]<0){
        deltaX[i]=deltaX[i]*-1;
      }
      if (yVals[i]>height || yVals[i]<0){
        deltaY[i]=deltaY[i]*-1;
      }
      if (dist(xVals[i],yVals[i],mouseX,mouseY)<50){
        deltaX[i]=deltaX[i]*-1;        
        deltaY[i]=deltaY[i]*-1;
      }
      wordColor[i]++;
    }
  }
}

void drawWords(){
  for (int i=0; i<textData.length; i++){
    fill(constrain(wordColor[i],0,215));
    text(textData[i],xVals[i],yVals[i]);
  }
}

void keyPressed(){
  exit();
}
  


