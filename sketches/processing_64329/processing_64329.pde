
PVector tmp = new PVector(0,0);
PVector prev = new PVector(0,0);

int pNum = 10;
int deg;

PVector[] p = new PVector[13];

int selected;

void setup(){
  size(480,480);
  colorMode(RGB,255);
  
  frameRate(30);
  
  for(int i = 0;i<pNum;i++){
    p[i] = new PVector((float)i/(float)(pNum-1)*width,random(height));
  }

  smooth();
}


void drawPolygon(){
  int i;
  //制御点に四角を表示
  noStroke();                   //線を描画しない
  fill(200,50,0,100);                   //塗りの色を設定
  rectMode(CENTER);             //四角の基準点を中心に
  int rectL = 6;                //制御点の四角のサイズ
  
  for(i=0;i<pNum;i++){
    rect(p[i].x,p[i].y,rectL,rectL);
  }
  
  strokeWeight(1);          //線を描画しない
  stroke(200,50,0,100);
  noFill();
  
  //始点、終点から制御点への線を表示            //線を描画しない
  stroke(200,50,0,50);
  for(i=0;i<pNum-1;i++){
    line(p[i].x,p[i].y,p[i+1].x,p[i+1].y);
  }
}


int factorial(int n){
  int result = 1;
  for(int i=n;i>0;i--){
    result *= i;
  }
  return result;
}

int combination(int n, int i){
  return factorial(n) / (factorial(n-i) * factorial(i));
}

float bernstein(int i,int n, float t){
  return combination(n,i) * pow(1-t,n-i) * pow(t,i);
}

void drawBezier(){
  
  for(float t = 0;t<=1;t+=0.01){
    tmp.x = 0;
    tmp.y = 0;
    for(int i=0;i<pNum;i++){
      tmp.x += (float)bernstein(i,pNum-1,t)*p[i].x;
      tmp.y += (float)bernstein(i,pNum-1,t)*p[i].y;
    }
    
    if(t != 0.0){
      line(tmp.x, tmp.y, prev.x, prev.y);
    }
    prev.set(tmp);
  
  }
    
}


//グリッドを描画する関数
void drawGrid(float gScale){
  
  
    
  strokeWeight(1);

  int i;
  for(i=0;i<=width/gScale;i++){
    stroke(0,0,0,20);
    line(i*gScale,0,i*gScale,height);
  }
  for(i=0;i<=height/gScale;i++){  
    stroke(0,0,0,20);
    line(0,i*gScale,width,i*gScale);
  }
}


void draw(){
  
  background(255,255,255);
  drawGrid(10);
  
  drawPolygon();
  
  stroke(255,100,0);
  drawBezier();
}

void mousePressed(){
  selected = -1;
  
  float minD = 10;
  int i;
  for(i=0;i<pNum;i++){
    float d = dist(mouseX,mouseY,p[i].x,p[i].y);
    if(d < minD){
      minD = d;
      selected = i;
    }
  }
  
  if(selected != -1){
    p[selected].x = mouseX;
    p[selected].y = mouseY;
  }
    
}

void mouseDragged(){
  if(selected != -1){
    p[selected].x = mouseX;
    p[selected].y = mouseY;
  }
}

void keyPressed(){
  println(keyCode);
  if(50<=keyCode && keyCode<=57){
    pNum = keyCode - 48;
    for(int i = 0;i<pNum;i++){
      p[i] = new PVector((float)i/(float)(pNum-1)*width,random(height));
    }
  }
  else if(65<=keyCode && keyCode < 69){
    pNum = keyCode - 55;
    for(int i = 0;i<pNum;i++){
      p[i] = new PVector((float)i/(float)(pNum-1)*width,random(height));
    }
  }
}
