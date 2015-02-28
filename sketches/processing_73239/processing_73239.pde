
class Ball {

//global variables
  RShape curSVG;
  RShape[] _ChildShapes;
  float x = 300;
  float y = 200;
  float speedX = 4;
  float speedY = .5;
  int numChildren, ranNum;
  float myRotate, myScale;
  color [] myColors;
  
  
//constructor
 Ball(float _x, float _y){
    x = _x;
    y = _y;
    
    ranNum = (int)random(100) % imgList.size();
    curSVG = (RShape)imgList.get(ranNum);
    
    numChildren = curSVG.countChildren();
    
    _ChildShapes = new RShape[numChildren];
    myColors = new color[numChildren];
    
    for (int i=0; i<numChildren; i++) {
      _ChildShapes[i] = curSVG.children[i];
      myColors[i] = palette[(int)random(palette.length)];
    }
    
    myRotate = radians((int)random(4)*90);
    myScale = (int)(random(2) + 1) * 50;
 }

//functionality

void run(){
 //display
 display();
 //move
 move();
 //bounce
 bounce();
 //gravity 
 gravity();
}

 void display(){
  for (int i=0; i<numChildren; i++) {
      RStyle style = _ChildShapes[i].getStyle();
      style.strokeColor = #4e5f45;
      style.fillColor = myColors[i];
  }
  RG.shape(curSVG, x, y, myScale, myScale);
  //curSVG.rotate(myRotate);
  
 } 
 
 void move(){
   x += speedX;
   y += speedY;
 }
 
 void gravity(){
   speedY += 0.05;
 }
 
 void bounce(){
    if(x >= (width + 50)){
       speedX = speedX * -1;//invert direction
    } 
    if(x <= 0){
       speedX = speedX * -1;//invert direction
    } 
    if(y >= (height + 50)){
       speedY = speedY * -1;//invert direction
    } 
    if(y <= 0){
       speedY = speedY * -1;//invert direction
    } 
 }
 

}

