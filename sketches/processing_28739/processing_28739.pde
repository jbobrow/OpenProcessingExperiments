
TextObj textObj;
int x = 0;
int NumberV = 100;
TextObj[] SomeNum = new TextObj[NumberV];

void setup(){
  frameRate(30);
  size(900, 450);
  smooth();
  noStroke();
  background(0);
  
  int cellVal = floor(width / NumberV);
  x = cellVal;
  
  for(int i = 0; i < NumberV - 1; i++){
      float randomVal = random(2.0,10.0);
      textObj = new TextObj(x, 0, cellVal, randomVal);
      SomeNum[i] = textObj;
      x += cellVal;
  }
}

void draw(){
  fill(0, 100);
  rect(0, 0, width, height);  
  for(int i = 0; i < NumberV - 1; i++){
      SomeNum[i].move();
      SomeNum[i].display();
  }
}

class TextObj {
  float x,y,z;
  float diameter;
  float speed;
  int direction = 1;
  String[] NumArr;
  String Num0 = "0";
  String Num1 = "1";
  String Num;
  int StrLength;
  int textSizeVal;
  float colorV;
  color currentColor;

  TextObj(float xpos,float ypos,float dia,float sp){
    x = xpos;
    y = ypos;
    diameter = dia;
    speed = sp;
    
    textSizeVal = floor(random(16) + 8);
    textSize(textSizeVal);

    colorV = (float(textSizeVal) / 16) + 0.2;
    currentColor = color(19*colorV,67*colorV,14*colorV);
    
    StrLength = floor(random(8) + 10);
    NumArr = new String[StrLength];
    
    for(int LengthV = 0; LengthV < StrLength; LengthV++){
      float randomStr = random(1);
      if(randomStr > 0.5){
        NumArr[LengthV] = Num0;
      }else{
        NumArr[LengthV] = Num1;
      }
    }
  }

  void move(){
    y += (speed * direction);
    if(y > height + StrLength*textSizeVal){
      y = 1;
      float randomSp = random(2.0,10.0);
      speed = randomSp;
      textSizeVal = floor(random(16) + 8);
      
      colorV = (float(textSizeVal) / 16) + 0.2;
      currentColor = color(19*colorV,67*colorV,14*colorV);
    }
  }

  void display(){
    textSize(textSizeVal);
    fill(currentColor);
    
    for(int DisplayLength = 0; DisplayLength < StrLength; DisplayLength++){
      text(NumArr[DisplayLength],x,y - DisplayLength*textSizeVal);
    }
  }
}               
