
//制御点の座標を設定
int[] pX = {50,50,150,300,450,550,550};
int[] pY = {500,400,300,300,300,200,100};

int pNum = 7;

int selected = -1;
 
int viewL =600;
int margin = 20;
int graphHeight = 180;

int cNum = 2;

boolean shifted;

void setup(){
  size(600,800);
  colorMode(RGB,255);
  
  frameRate(30);
}

void drawBezierCrv(int n, color c){
  
  //始点、終点から制御点への線を表示
  stroke(red(c),green(c),blue(c),100);
  line(pX[n],pY[n],pX[n+1],pY[n+1]);
  line(pX[n+2],pY[n+2],pX[n+3],pY[n+3]);
    
  strokeWeight(2);
  stroke(red(c),green(c),blue(c),200);
  noFill();
  bezier(pX[n],pY[n],pX[n+1],pY[n+1],pX[n+2],pY[n+2],pX[n+3],pY[n+3]);
  
  noStroke();
  fill(c);
  for(int i=0;i<4;i++){
    ellipse(pX[n+i],pY[n+i],5,5); 
  } 
}


void calcTangent(int n, color c,int xNum){
  float Ax = -pX[n] + 3*pX[n+1] - 3*pX[n+2] + pX[n+3];
  float Ay = -pY[n] + 3*pY[n+1] - 3*pY[n+2] + pY[n+3];
  
  float Bx = 3*(pX[n] - 2*pX[n+1] + pX[n+2]);
  float By = 3*(pY[n] - 2*pY[n+1] + pY[n+2]);
  
  float Cx = 3*(pX[n+1] - pX[n]);
  float Cy = 3*(pY[n+1] - pY[n]);
  
  for(float t = 0;t<1.0;t+=0.01){
    float d1x = 3 * Ax * t * t + 2 * Bx * t + Cx;
    float d1y = 3 * Ay * t * t + 2 * By * t + Cy;
    
    float k = degrees(atan(d1y/d1x));
    //k*=10;
    
    stroke(c,200);
    noFill();
    float gX = ((float)xNum/(float)cNum)*viewL + t/(float)cNum * (float)viewL;
    float gY = viewL + margin + (float)graphHeight/2;
    //line(gX,gY,gX,gY - k);
    point(gX,gY-k);
    
  }
}

void draw(){
  smooth();
  int i;
  
  background(255,255,255); 
  
  drawGrid(10);                 //グリッドを描画する。(自分で作った命令)
  
  drawBezierCrv(0,color(255,150,0));
  drawBezierCrv(3,color(255,50,0));
  
  fill(30);
  rect(0,viewL,viewL,margin);
  
  fill(255);
  rect(0,viewL+margin,viewL,graphHeight);
  
  
  stroke(0,30);
  int py;
  for(i=0;i<=graphHeight/10;i++){
    py = viewL+margin + graphHeight/2 + i * 5;
    line(0,py,viewL,py);
    py = viewL+margin + graphHeight/2 - i * 5;
    line(0,py,viewL,py);
  }
  
  calcTangent(0,color(255,150,0),0); 
  calcTangent(3,color(255,50,0),1); 
}

//グリッドを描画する関数
void drawGrid(float gScale){
    
  strokeWeight(1);

  int i;
  for(i=0;i<=viewL/gScale;i++){
    stroke(0,0,0,30);
    line(i*gScale,0,i*gScale,viewL);
  }
  for(i=0;i<=viewL/gScale;i++){  
    stroke(0,0,0,30);
    line(0,i*gScale,viewL,i*gScale);
  }
}

void mousePressed(){
  selected = -1;
  
  float minD = 10;
  int i;
  for(i=0;i<pNum;i++){
    float d = dist(mouseX,mouseY,pX[i],pY[i]);
    if(d < minD){
      minD = d;
      selected = i;
    }
  }
  
  if(selected != -1){
    
    if(shifted){
      if(selected == 3){
        pX[selected+1] = pX[selected];
        pY[selected+1] = pY[selected];
        
        
        pX[selected-1] = pX[selected];
        pY[selected-1] = pY[selected];
      }
      
      else if(selected == 2){
        pX[selected] = mouseX;
        pY[selected] = mouseY;
        
        pX[selected+2] = pX[selected+1] + (pX[selected+1]-pX[selected]);
        pY[selected+2] = pY[selected+1] + (pY[selected+1]-pY[selected]);
      }
      else if(selected == 4){
        pX[selected] = mouseX;
        pY[selected] = mouseY;
        
        pX[selected-2] = pX[selected-1] + (pX[selected-1]-pX[selected]);
        pY[selected-2] = pY[selected-1] + (pY[selected-1]-pY[selected]);
      }
      
    }else{
      
      pX[selected] = mouseX;
      pY[selected] = mouseY;
    
      if(selected == 0 || selected == 3){
        pX[selected+1] += mouseX-pmouseX;
        pY[selected+1] += mouseY-pmouseY;
      }
      if(selected == 3 || selected == 6){
        pX[selected-1] += mouseX-pmouseX;
        pY[selected-1] += mouseY-pmouseY;
      }
    }
  }
  
    
}

void mouseDragged(){
  if(selected != -1){
    
    if(shifted){
      if(selected == 3){
        pX[selected+1] += mouseX-pmouseX;
        pY[selected+1] += mouseY-pmouseY;
        
        
        pX[selected-1] -= mouseX-pmouseX;
        pY[selected-1] -= mouseY-pmouseY;
      }
      else if(selected == 2){
        pX[selected] += mouseX-pmouseX;
        pY[selected] += mouseY-pmouseY;
        
        pX[selected+2] = pX[selected+1] + (pX[selected+1]-pX[selected]);
        pY[selected+2] = pY[selected+1] + (pY[selected+1]-pY[selected]);
      }
      else if(selected == 4){
        pX[selected] += mouseX-pmouseX;
        pY[selected] += mouseY-pmouseY;
        
        pX[selected-2] = pX[selected-1] + (pX[selected-1]-pX[selected]);
        pY[selected-2] = pY[selected-1] + (pY[selected-1]-pY[selected]);
      }
        
        
    }else{
      pX[selected] += mouseX-pmouseX;
      pY[selected] += mouseY-pmouseY;
    
      if(pY[selected] > viewL) pY[selected] = viewL;
    
      if(selected == 0 || selected == 3){
        pX[selected+1] += mouseX-pmouseX;
        pY[selected+1] += mouseY-pmouseY;
      }
      if(selected == 3 || selected == 6){
        pX[selected-1] += mouseX-pmouseX;
        pY[selected-1] += mouseY-pmouseY;
      }
    }
      
      
  }
}

void keyPressed(){
  switch(keyCode){
    case 16:
    shifted = true;
    break;
  }
  
}

void keyReleased(){
  switch(keyCode){
    case 16:
    shifted = false;
    break;
  }
}

