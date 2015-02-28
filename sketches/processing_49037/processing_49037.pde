
int ballNum = 200;
Ball[] bArray = new Ball[ballNum];

class Ball{
  int x;    //プロパティ X
  int y;    //プロパティ Y
  
  float velY;
  float axel;
  
  float pVelY;
  
  float velX;
  
  boolean isValid;      //点が有効値か否か
  
  //コンストラクタ(初期化メソッド)
  Ball(int xVal, int yVal){
    x = xVal;
    y = yVal;
    
    //点の座標が(x>=0 && y>=0)であれば有効値とする
    if(x>=0 && y>=0) isValid = true;
    else isValid = false;
    
    velX = random(200)/10 - 10;
    velY = random(100)/10;
    
    //velY = 1;
    axel = 2;
  }
  
  //自分の位置に円を描画する
  void drawBall(){
      int i;
      
      noStroke();
      fill(200,0,50);
      ellipse(x,y,20,20);
      fill(255,10);
      for(i=0;i<20;i++){
          ellipse(x,y,i,i);
      }
  }
  
  void update(){
      velY += axel;
      y += velY;
      
      x += velX;
      velX *= 0.99;

      if(y+10>=height){
       y = height-10;
       if(pVelY*velY>0) velY = -(velY*0.8);
      }
      
      if(x+10>=width || x-10 <= 0){
       velX = -(velX*0.8);
      }
      
      pVelY = velY;
      
      if(y+10==height && velY * velY < 2) {
        velY = 0;
      }
  }
  
} 
void setup() {  //setup function called initially, only once
  size(400, 400);
  //background(0);
  //colorMode(RGB,255);   //set colors to Hue, Saturation, Brightness mode
  
  int i;
  for(i=0;i<ballNum;i++){
      bArray[i] = new Ball((int)random(width),(int)random(height));
  }
  
  
}

void draw() {  //draw function loops 
  background(0);
  int i;
  smooth();
  for(i=0;i<ballNum;i++){
      bArray[i].update();
      bArray[i].drawBall();
  }
}

void mousePressed(){
  int i;
  for(i=0;i<ballNum;i++){
      bArray[i] = new Ball((int)random(width),(int)random(height));
  }
}
  
  


                
                                                                
