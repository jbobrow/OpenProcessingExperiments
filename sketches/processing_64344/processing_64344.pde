
PVector tmp = new PVector(0,0);
PVector prev = new PVector(0,0);

int pNum = 10;
int deg = 3;
int degMax = 6;

PVector[] p = new PVector[pNum];
int m = pNum + degMax + 1;

float nVec[] = new float[m];

int selected;

boolean recPDF = false;
int page = 0;

void setup(){
  size(480,480);
  colorMode(RGB,255);
  
  frameRate(30);
  
  for(int i = 0;i<pNum;i++){
    p[i] = new PVector((float)i/(float)(pNum-1)*width,random(height));
  }
  
  for(int i = 0;i<m;i++) {
    nVec[i] = i;
  }
  
  m = pNum + deg + 1;
  
  //m = nVec.length;
  smooth();
}


void drawPolygon(){
  int i;
  //制御点に四角を表示
  noStroke();                   //線を描画しない
  fill(255,50,0,200);                   //塗りの色を設定
  rectMode(CENTER);             //四角の基準点を中心に
  int rectL = 6;                //制御点の四角のサイズ
  
  for(i=0;i<pNum;i++){
    rect(p[i].x,p[i].y,rectL,rectL);
  }
  
  strokeWeight(1);          //線を描画しない
  fill(255,50,0,200);   
  noFill();
  
  //始点、終点から制御点への線を表示            //線を描画しない
  stroke(255,50,0,50);  
  for(i=0;i<pNum-1;i++){
    line(p[i].x,p[i].y,p[i+1].x,p[i+1].y);
  }
}


float blending(int i,int k, float t){
  float val;
  float w1 = 0.0,w2 = 0.0;
  if(k==0){
    if(nVec[i] <= t && t < nVec[i+1]) val = 1.0;
    else val = 0.0;
  }else{
    if((nVec[i+k+1]-nVec[i+1])!=0)  
    w1 = blending(i+1,k-1,t) * (nVec[i+k+1] - t) / (nVec[i+k+1] - nVec[i+1]);
    if((nVec[i+k]-nVec[i])!=0)  
    w2 = blending(i,k-1,t) * (t - nVec[i]) / (nVec[i+k] - nVec[i]);
    val = w1 + w2;
  }
  return val;
}
void drawBSpline(){
  float[] b = new float[pNum];
  
  for(float t=nVec[deg];t < nVec[m-deg-1]; t += 0.001){
    
    if(floor(t) %2 == 1)  stroke(255,50,0);
    else stroke(255,170,0);
    
    tmp = new PVector(0,0);
    for(int j =0;j<pNum;j++){
      b[j] = blending(j,deg,t);
      
      tmp.x += p[j].x * b[j];
      tmp.y += p[j].y * b[j];
      
    }
    
    if(t != nVec[deg] && t != nVec[m-deg-1] && ((tmp.x!= -1) && (prev.x != -1))){
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
  
  stroke(255,50,0);
  
  drawBSpline();
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
  switch(keyCode){
    
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    deg = keyCode - 48;
    m = pNum + deg + 1;
    
    break;
    
    
    
  }
}
