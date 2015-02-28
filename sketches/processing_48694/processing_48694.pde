
int tlHeight = 128;
int vHeight = 300;
int viewMargin = 30;
 
int pViewL = 300;
int sViewL = 200;
 
int nViewWidth = 200;
int nViewHeight = 100;
 
float time  = 1.0;
int timeLineX = 0;
int fps = 60;
 
int buttonMargin = 3;
int buttonX = 415;
int buttonY = tlHeight + buttonMargin;
int buttonWidth = 80;
int buttonHeight = viewMargin - buttonMargin * 2;
 
int sViewR = 160;
 
String bStr = "START";
 
float  tlVec;
 
int    value;

int    dAlpha;
 
PFont font;
PFont sFont;
PFont dFont;
 
PImage bg;
 
boolean animation;

boolean showDescription;

boolean pause;

int easingMode;

static final int EaseIn = 0;
static final int EaseOut = 1;
static final int EaseInOut = 2;

int easingStyle;

static final int Linear = 1;
static final int Quadratic = 2;
static final int Cubic = 3;
static final int Quartic = 4;
static final int Quintic = 5;
static final int Sinusoidal = 6;
static final int Exponential = 7;
static final int Circular = 8;
 
void setup(){
  size(500,458);
  colorMode(RGB,255);
  
  frameRate(fps);
 
  //フォントの読み込み
  font = loadFont("Helvetica-Bold-80.vlw");
  sFont = loadFont("Helvetica-Bold-14.vlw");
  dFont = loadFont("Menlo-Bold-16.vlw");
 
  //背景画像の読み込み
  bg = loadImage("gui_bg.png");
    
  easingStyle = Linear;
}
 

void draw(){
  int i;
  color c;
 
  tlVec = width/time/float(fps);
 
 
 
  background(0);
 
  smooth();
 
  //背景画像の表示
  image(bg,0,0);
 
  drawTLGrid();
 
  c = color(255,0,100);
  drawTLGraph(c);
 
  c = color(255);
  drawCurrentTimeMark(c);
 
  drawMarginBar();
 
  value = floor(calculateYValue(timeLineX) * 1.999);
 
  c = color(255,150);
  drawNumber(value,c);
 
  c = color(200,0,50,255);
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
  
  if(showDescription) dAlpha+=20;
  else dAlpha -= 20;
  if(dAlpha <= 0) dAlpha = 0;
  else if(dAlpha >= 180) dAlpha = 180;
 
  drawDescription(dAlpha);
}

float calculateYValue(float xVal){
  float t =  xVal/width;
  float yVal = 0;
  
  switch(easingStyle){
    case Linear:
    yVal = t * (float)tlHeight;
    break;
    
    case Quadratic:
    switch(easingMode){
      case EaseIn:
      yVal = pow(t,2) * (float)tlHeight;
      break;
      case EaseOut:
      yVal = -t * (t - 2) * (float)tlHeight;
      break;
      case EaseInOut:
      t*=2;
      yVal = (t<=1)?pow(t,2) / 2 * (float)tlHeight: -((--t) * (t - 2) - 1)/2 * (float)tlHeight;
      break;
    }
    break;
    
    case Cubic:
    switch(easingMode){
      case EaseIn:
      yVal = pow(t,3) * (float)tlHeight;
      break;
      case EaseOut:
      yVal = (pow((t-1),3) + 1) * (float)tlHeight;
      break;
      case EaseInOut:
      t*=2;
      yVal = (t<=1)?pow(t,3) / 2 * (float)tlHeight: (pow((t-2),3) + 2) / 2 * (float)tlHeight;
      break;
    }
    break;
    
    case Quartic:
    switch(easingMode){
      case EaseIn:
      yVal = pow(t,4) * (float)tlHeight;
      break;
      case EaseOut:
      yVal = -(pow((t-1),4) - 1) * (float)tlHeight;
      break;
      case EaseInOut:
      t*=2;
      yVal = (t<=1)?pow(t,4) / 2 * (float)tlHeight: -(pow((t-2),4) - 2) / 2 * (float)tlHeight;
      break;
    }
    break;
    
    case Quintic:
    switch(easingMode){
      case EaseIn:
      yVal = pow(t,5) * (float)tlHeight;
      break;
      case EaseOut:
      yVal = (pow((t-1),5) + 1) * (float)tlHeight;
      break;
      case EaseInOut:
      t*=2;
      yVal = (t<=1)?pow(t,5) / 2 * (float)tlHeight: (pow((t-2),5) + 2) / 2 * (float)tlHeight;
      break;
    }
    break;
    
    case Sinusoidal:
    switch(easingMode){
      case EaseIn:
      yVal = (1-cos(t * PI/2)) * (float)tlHeight;
      break;
      case EaseOut:
      yVal = sin(t * PI/2) * (float)tlHeight;
      break;
      case EaseInOut:
      yVal = (1-cos(t * PI))/2 * (float)tlHeight;
      break;
    }
    break;
    
    case Exponential:
    switch(easingMode){
      case EaseIn:
      yVal = pow(2, 10 * (t - 1)) * (float)tlHeight;
      break;
      case EaseOut:
      yVal = (-pow(2, -10 * t) + 1)  * (float)tlHeight;
      break;
      case EaseInOut:
      t*=2;
      yVal = (t<=1)?pow(2, 10 * (t - 1)) / 2 * (float)tlHeight:
      (-pow(2, -10 * --t) + 2) / 2 * (float)tlHeight;
      break;
    }
    break;
    
    case Circular:
    switch(easingMode){
      case EaseIn:
      yVal = (1 - sqrt(1 - pow(t,2))) * (float)tlHeight;
      break;
      case EaseOut:
      yVal = sqrt(1 - pow((t-1),2))  * (float)tlHeight;
      break;
      case EaseInOut:
      t*=2;
      yVal = (t<=1)?(1 - sqrt(1 - pow(t,2))) / 2 * (float)tlHeight:
      (1 + sqrt(1 - pow((t-2),2))) / 2 * (float)tlHeight;
      break;
    }
    break;
  }
    
      
  
  return yVal;
}

void drawTLGraph(color graphColor){
  strokeWeight(1);
  float px=0;
  float py=0;
  int i;
  for(i=0;i<=width/2;i++){
    float x = i*2;
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
 
  int i;
  int hLineNum = floor(tlHeight/8);
  for(i=0;i<hLineNum;i++){
    stroke(0,20);
    int y = i *8;
    line(0,y,width,y);
  }
 
  int vLineNum = floor(time * 10) ;
  for(i = 1;i <= vLineNum;i++){
    float x = width/time/10 * i;
    if(i%10==0) stroke(0,30);
    else  stroke(0,10);
    line(x,0,x,tlHeight);
  }
  drawEaseModeAndTime();
}
 
void drawEaseModeAndTime(){
  
  textFont(sFont, 14);
  textAlign(LEFT);
  fill(255,120);
  
  String style = "";
  String mode = "";
  
  switch(easingMode){
    case EaseIn:
    mode = "EaseIn";
    break;
    case EaseOut:
    mode = "EaseOut";
    break;
    case EaseInOut:
    mode = "EaseInOut";
    break;
  }
  
  switch(easingStyle){
    case Linear:
    style = "Linear";
    mode = "";
    break;
    case Quadratic:
    style = "Quad";
    break;
    case Cubic:
    style = "Cubic";
    break;
    case Quartic:
    style = "Quart";
    break;
    case Quintic:
    style = "Quint";
    break;
    case Sinusoidal:
    style = "Sine";
    break;
    case Exponential:
    style = "Expo";
    break;
    case Circular:
    style = "Circ";
    break;
  }
  
  text(mode+style,10,16);
  
  int t = round(time*10);
  text((float)t/10 + " sec",10,32);
}
void drawMarginBar(){
 
  noStroke();
  int i;
 
  color c = color(255);
  float b = 0.8;
  if(buttonX <= mouseX && mouseX <= buttonX + buttonWidth
  && tlHeight + buttonMargin <= mouseY && mouseY <= tlHeight + viewMargin - buttonMargin){
    fill(c,20);
  }else{
    fill(c,0);
  }
  noStroke();
  rect(buttonX,buttonY,buttonWidth,viewMargin-buttonMargin*2);
 
  textFont(sFont, 14);
  textAlign(CENTER);
  fill(180,200);
  text(bStr,buttonX + buttonWidth/2, buttonY + buttonHeight - 7);
}
 
void pViewDrawEllipse(float px, float py, color c){
  noStroke();
  fill(c);
  ellipse(22 + px,tlHeight + viewMargin + 300 - (22 + py),20,20);
  int i;
  float lNum = 20;
  for(i=0;i<lNum;i++){
    float t = (float)i/lNum;
    fill(255,7);
    ellipse(22 + px,tlHeight + viewMargin + 300 - (22 + py),lNum-i,lNum-i);
  }
 
}
 
void sViewDrawEllipse(float eScale, color eColor){
  int centerX = pViewL + sViewL/2;
  int centerY = tlHeight + viewMargin + sViewL/2;
 
  fill(eColor);
  ellipse(centerX,centerY,(float)eScale/256*sViewR,(float)eScale/256*sViewR);
}
 
void drawNumber(int number, color nColor){
 
  strokeWeight(1);
 
  textFont(font, 80);
  textAlign(RIGHT);
  fill(nColor);
  text(value,pViewL + nViewWidth-20,tlHeight+viewMargin + sViewL + nViewHeight-20);
 
}
 

void drawDescription(int a){
  
  fill(0,a);
  rect(0,0,width,height);
  
  String[] d = {
    "SPACE Key   : START/STOP/RESET",
    "",
    "Left Arrow  : Decrease Time",
    "Right Arrow : Increase Time",
    "",
    "'1' Key : Linear",
    "'2' Key : Quadratic Easing",
    "'3' Key : Cubic Easing",
    "'4' Key : Quartic Easing",
    "'5' Key : Quintic Easing",
    "'s' Key : Sinusoidal Easing",
    "'e' Key : Exponential Easing",
    "'c' Key : Circular Easing",
    "",
    "'i' Key : EaseIn",
    "'o' Key : EaseOut",
    "'p' Key : EaseInOut",
    "",
    "'t' Key : show/hide description"
  };
  
  textFont(dFont, 16);
  textAlign(LEFT);
  fill(255,a);
  int i;
  for(i=0;i<19;i++){
    text(d[i],80,70 + i * 18);
  }
  
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
 
void keyPressed(){
  println(keyCode);
 
  if(keyCode == 84){
    showDescription = !showDescription;
    if(animation){
      animation = false;
      pause = true;
      bStr = "PAUSE";
    }else if(pause){
      animation = true;
      pause = false;
      bStr = "STOP";
    }
  }else{
  
    switch(keyCode){
  
      case 32:
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
      break;
      case 37:
      if(time > 0.1) time-=0.1;
      break;
      case 39:
      time+=0.1;
      break;
      
      
      case 49:
      easingStyle = Linear;
      break;
      case 50:
      easingStyle = Quadratic;
      break;
      case 51:
      easingStyle = Cubic;
      break;
      case 52:
      easingStyle = Quartic;
      break;
      case 53:
      easingStyle = Quintic;
      break;
      case 83:
      easingStyle = Sinusoidal;
      break;
      case 69:
      easingStyle = Exponential;
      break;
      case 67:
      easingStyle = Circular;
      break;
      
      case 73:
      easingMode = EaseIn;
      break;
      case 79:
      easingMode = EaseOut;
      break;
      case 80:
      easingMode = EaseInOut;
      break;
      
    }
  }
}

