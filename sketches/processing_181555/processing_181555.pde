
color[] lineColor=new color[100];
int wideLine;

void setup(){
  size(500,500);
  smooth();
  frameRate(20);
  background(0);
  for (int i=0;i<100;i++){
    lineColor[i]=color(0,0,0);
  };
}

void draw(){
  background(0);
  colorOfLines();
  wideLineSet();
  drawLines();
}
void colorOfLines(){
  for (int i=98;i>=0;i--){
    //99 is top of array
    lineColor[i+1]=lineColor[i];
  };
  int theRed=int(random(255));
  int theGreen=int(random(255));
  int theBlue=int(random(255));
  lineColor[0]=color(theRed,theGreen,theBlue);
  }
  
 void wideLineSet(){
   wideLine=int(map(mouseX,0,width,0,99));
 };


void drawLines(){
   println(wideLine);
  for (int i=0;i<99;i++){
    if (wideLine==i){
      strokeWeight(15);
    }; 
    stroke(lineColor[i]);
    line(i*(width/100),5,i*(width/100),height-5);
    strokeWeight(1);
  }
}


