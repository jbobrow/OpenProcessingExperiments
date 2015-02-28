
int ballNum = 200;
Ball[] bArray = new Ball[ballNum];
 
class Ball{
  int x;    //プロパティ X
  int y;    //プロパティ Y
   
  float velY;
  float axel;
   
  float pVelY;
   
  float velX;
  
  int r;
  
  color col;
   
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
    
    col = color(random(255),255,200);
    
    r = random(20) + 10;
    //velY = 1;
    axel = 2;
  }
   
  //自分の位置に円を描画する
  void drawBall(){
      int i;
       
      noStroke();
      fill(col);
      ellipse(x,y,r,r);
      fill(255,200/(float)r);
      for(i=0;i<r;i++){
          ellipse(x,y,i,i);
      }
  }
   
  void update(){
      velY += axel;
      y += velY;
       
      x += velX;
      velX *= 0.99;
 
      if(y+(float)r/2>=height){
       y = height-(float)r/2;
       if(pVelY*velY>0) velY = -(velY*0.8);
      }
       
      if(x+(float)r/2>=width || x-(float)r/2 <= 0){
       velX = -(velX*0.8);
      }
       
      pVelY = velY;
       
      if(y+(float)r/2==height && abs(velY) < (float)r/20) {
        velY = 0;
      }
  }
   
}
void setup() {  //setup function called initially, only once
  size(400, 400);
  //background(0);
  colorMode(HSB,255);   //set colors to Hue, Saturation, Brightness mode
   
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
                                                                                
