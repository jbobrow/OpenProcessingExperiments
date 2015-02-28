
int tlHeight = 128;
int vHeight = 300;
int viewMargin = 30;

int pViewL = 300;
int sViewL = 200;

int nViewWidth = 200;
int nViewHeight = 100;

float time  = 0.8;
int timeLineX = 0;
int fps = 30;

int buttonMargin = 3;
int buttonX = 415;
int buttonY = tlHeight + buttonMargin;
int buttonWidth = 80;
int buttonHeight = viewMargin - buttonMargin * 2;

int sViewR = 160;

String bStr = "START";

float  tlVec;

int    value;

PFont font;
PFont sFont;

boolean animation;

void setup(){
  size(500,458);
  colorMode(RGB,255);
  
  frameRate(fps);
  
  tlVec = width/time/float(fps);

  font = loadFont("AkkoPro-Regular-80.vlw");
  sFont = loadFont("AkkoPro-Regular-16.vlw");
}

void draw(){
  int i;
  color c;
  
  background(0);
  smooth();
  
  drawTLGrid();
  
  c = color(255,0,100);
  drawTLGraph(c);
  
  c = color(255);
  drawCurrentTimeMark(c);
  
  drawMarginBar();
  
  value = floor(calculateYValue(timeLineX) * 1.999);
  
  drawPositionView();
  drawScaleView();
  
  c = color(255,150);
  drawNumberView(value,c);
  
  c = color(255,0,100,200);
  pViewDrawEllipse(128,value,c);
  
  c = color(255,0,100,100);
  sViewDrawEllipse((float)value,c);
  
  if(animation){
    timeLineX += tlVec;
    if(timeLineX >= width){
      timeLineX = width;
      animation = false;
      bStr = "RESET";
    }
  }
    
}

float calculateYValue(float xVal){
  float t =  xVal/width;
  float yVal = t * (float)tlHeight;
  return yVal;
}

void drawTLGraph(color graphColor){
  strokeWeight(1);
  float px=0;
  float py=0;
  int i;
  for(i=0;i<=width/20;i++){
    float x = i*20;
    float y = tlHeight - calculateYValue(x);
    if(i>=1){
      strokeWeight(1.5);
      stroke(graphColor,200);
      line(px,py,x,y);
      noStroke();
      fill(graphColor,50);
      quad(px,tlHeight,px,py,x,y,x,tlHeight);
    }
    px = x;
    py = y;
  }
}

void drawCurrentTimeMark(color c){
  
  int i;
  for(i=0;i<5;i++){
    strokeWeight(5-i);
    stroke(red(c),green(c),blue(c),50);
    line(timeLineX,0,timeLineX,tlHeight-2);
  }
  
}

void drawTLGrid(){
  strokeWeight(1);
  
  fill(0,250);
  rect(0,0,width,tlHeight);
  
  int i;
  for(i = 0; i<=tlHeight;i++){
    stroke(255-(float)i*2,100);
    int y = i;
    line(0,y,width,y);
  }
  int hLineNum = floor(tlHeight/8);
  for(i=0;i<hLineNum;i++){
    stroke(255,20);
    int y = i *8;
    line(0,y,width,y);
  }
  
  int vLineNum = floor(time * 10) ;
  for(i = 1;i <= vLineNum;i++){
    float x = width/time/10 * i;
    if(i%10==0) stroke(255,30);
    else  stroke(255,10);
    line(x,0,x,tlHeight);
  }
}

void drawMarginBar(){
  
  noStroke();
  int i;
  fill(150,255);
  rect(0,tlHeight,width,viewMargin);
  
  color c = color(255,0,100,255);
  //color c = color(30,200);
  float b = 0.8;
  if(buttonX <= mouseX && mouseX <= buttonX + buttonWidth 
  && tlHeight + buttonMargin <= mouseY && mouseY <= tlHeight + viewMargin - buttonMargin){
    fill(c);
  }else{
    fill(red(c)*b,green(c)*b,blue(c)*b,alpha(c));
  }
  noStroke();
  rect(buttonX,buttonY,buttonWidth,viewMargin-buttonMargin*2);
  
  
  for(i=0;i<=buttonHeight;i++){
    stroke(0,60-i*3);
    int y = tlHeight + viewMargin + i;
    line(buttonX,y,buttonX + buttonWidth,y);
  }
  
  textFont(font, 16);
  textAlign(CENTER);
  fill(200,200);
  text(bStr,buttonX + buttonWidth/2, buttonY + buttonHeight - 6);
  
  for(i=0;i<=viewMargin;i++){
    stroke((viewMargin - i )*255/viewMargin,80);
    int y = i + tlHeight;
    line(0,y,width,y);
  }
  
}


void pViewDrawEllipse(float px, float py, color c){
  noStroke();
  fill(c);
  ellipse(22 + px,tlHeight + viewMargin + 300 - (22 + py),20,20);
  int i;
  float lNum = 20;
  for(i=0;i<lNum;i++){
    float t = (float)i/lNum;
    fill(255,10);
    ellipse(22 + px,tlHeight + viewMargin + 300 - (22 + py),lNum-i,lNum-i);
  }
  
}
  
void drawPositionView(){
  strokeWeight(1);
  
  int margin = (pViewL - 256)/2;
  
  noStroke();
  fill(30,255);
  rect(0,tlHeight+viewMargin,pViewL,pViewL);
  
  int i;
  for(i=0;i<=pViewL;i++){
    stroke(255 - (float)(pViewL - i)/pViewL*255,20);
    int y = tlHeight+viewMargin +i;
    line(0,y,pViewL,y);
  }
  
  for(i=0;i<=16;i++){
    stroke(255,50);
    int y = tlHeight + viewMargin + margin + i*16;
    line(margin,y,pViewL-margin,y);
    int x = margin + i*16;
    line(x,tlHeight + viewMargin + margin,x,tlHeight + viewMargin + pViewL - margin);
  }
  
}

void sViewDrawEllipse(float eScale, color eColor){
  int centerX = pViewL + sViewL/2;
  int centerY = tlHeight + viewMargin + sViewL/2;
  
  fill(eColor);
  ellipse(centerX,centerY,(float)eScale/256*sViewR,(float)eScale/256*sViewR);
}

void drawScaleView(){
  strokeWeight(1);
  
  int margin = (sViewL - 128)/2;
  
  noStroke();
  fill(30,255);
  rect(pViewL,tlHeight+viewMargin,sViewL,sViewL);
  
  int i;
  for(i=0;i<=sViewL;i++){
    stroke(255 - (float)(sViewL - i)/sViewL*255,20);
    int y = tlHeight+viewMargin +i;
    line(pViewL,y,pViewL + sViewL,y);
  }
  
  int centerX = pViewL + sViewL/2;
  int centerY = tlHeight + viewMargin + sViewL/2;
  int lNum = 8;
  
  line(centerX,centerY-sViewR/2, centerX,centerY+sViewR/2);
  line(centerX-sViewR/2,centerY, centerX+sViewR/2,centerY);
  for(i=0;i<=lNum;i++){
    stroke(255,50);
    noFill();
    ellipse(centerX,centerY,(float)i/lNum*sViewR,(float)i/lNum*sViewR);
  }
  
  
}

void drawNumberView(int number, color nColor){
  strokeWeight(1);
  
  noStroke();
  fill(30,255);
  rect(pViewL,tlHeight+viewMargin+sViewL,nViewWidth,nViewHeight);
  
  int i;
  for(i=0;i<=nViewHeight;i++){
    stroke(255 - (float)(nViewHeight - i)/nViewHeight*255,20);
    int y = tlHeight+viewMargin + sViewL + i;
    line(pViewL,y,pViewL + nViewWidth,y);
  }
  
  textFont(font, 80);
  textAlign(RIGHT);
  fill(nColor);
  text(value,pViewL + nViewWidth-20,tlHeight+viewMargin + sViewL + nViewHeight-20);
}


void mousePressed(){
  if(buttonX <= mouseX && mouseX <= buttonX + buttonWidth 
  && buttonY <= mouseY && mouseY <= buttonY + buttonHeight){
    if(animation){
      animation = false;
      bStr = "START";
    }else{
      if(timeLineX == width){
        timeLineX = 0;
        bStr = "START";
      }
      else{
        animation = true;
        bStr = "STOP";
      }
    }
  }
}




