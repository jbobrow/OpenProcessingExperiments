

int R = 290;
PVector eP = new PVector(0,0);

int pNum = 200;

PVector p[] = new PVector[pNum];
PVector nV[] = new PVector[pNum];
float ang[] = new float[pNum];

float t = 0.00;

float l = 400 / pNum;

int viewL = 600;
int graphHeight = 180;

int margin = 20;

PImage bgImg;

int cPNum = 100;

PVector pOrigin = new PVector(-200,0);

int picked;

int cMode;

float defDeg = 0;

boolean shifted = false;

void setup(){
  //size(viewL,viewL + margin + graphHeight);
  size(600,800);
  
  eP = new PVector(-viewL/2,-viewL/2);
  bgImg = loadImage("bg.png");
  
  int i;
  for(i=0;i<pNum;i++){
    if(i<cPNum){
      ang[i] = defDeg;
    }else{
      ang[i] = defDeg + (i - 100)*t;
    }
      
    if(i==0){
      p[i] = new PVector(pOrigin.x , pOrigin.y);
    }else{
      p[i] = new PVector(p[i-1].x + l*cos(ang[i]),p[i-1].y - l*sin(ang[i]));
    }
    nV[i] = new PVector(cos(ang[i] + PI/2),-sin(ang[i] + PI/2));
    nV[i].normalize();
  }
  
  //noLoop();
  
}

void draw(){
  smooth();
  background(255);
  stroke(30);
  noFill();
  
  image(bgImg,0,0);
  
  translate(viewL/2,viewL/2);
  strokeWeight(1);
  stroke(0,100); 
  
  int i;
  for(i=0;i<pNum;i++){
    
    strokeWeight(2);
    stroke(60);
    
    if(i<cPNum){
      ang[i] = defDeg;
    }else{
      switch(cMode){
        case 0:
        ang[i] = defDeg + (i - cPNum)*t;
        break;
        
        case 1:
        ang[i] = (t<0)?defDeg - pow((i - cPNum)*t,2):defDeg + pow((i - cPNum)*t,2);
        break;
      }
    }
      
    if(i < cPNum)  stroke(0,50 + (float)i/pNum*50,100,255);
    else  stroke(0,150,150+(float)i/pNum*50,255);
    
    if(i==0){
      p[i] = new PVector(pOrigin.x , pOrigin.y);
    }else{
      p[i] = new PVector(p[i-1].x + l*cos(ang[i]),p[i-1].y - l*sin(ang[i]));
      line(p[i-1].x,p[i-1].y,p[i].x,p[i].y);
    }
    nV[i] = new PVector(cos(ang[i] + PI/2),-sin(ang[i] + PI/2));
    nV[i].normalize();
    
    
    
    point(p[i].x,p[i].y);
  
    strokeWeight(0.5);
    PVector eV = new PVector(0,0,0);
    eV.set(p[i]);
    eV.sub(eP);
    
    
    PVector nEV = new PVector(0,0,0);
    nEV.set(eV);
    nEV.normalize();
    
    PVector dNV = new PVector(0,0,0);
    dNV.set(nV[i]);
    float dN = -nEV.dot(nV[i]);
    if(dN>0){
      dNV.mult(dN);
      
      if(i < cPNum)  stroke(0,100 + (float)i/pNum*50,150,20);
      else  stroke(0,200,150+(float)i/pNum*100,20);
        
      line(eP.x,eP.y,eP.x+eV.x,eP.y+eV.y);
    
      PVector rEV = new PVector(0,0,0);
      rEV.set(nEV);
      nEV.add(dNV);
      nEV.add(dNV);
      
      float mP = nEV.x * p[i].x + nEV.y * p[i].y;
      float rL = -mP + sqrt(mP*mP - (p[i].mag() * p[i].mag() - R * R));
      
      nEV.mult(rL);
      
      if(i < cPNum)  stroke(0,100 + (float)i/pNum*50,150,150);
      else  stroke(0,200,150+(float)i/pNum*100,150);
        
      strokeWeight(1);
      line(p[i].x,p[i].y,p[i].x + nEV.x,p[i].y + nEV.y);
      
      PVector rVec = new PVector(0,0,0);
      rVec.set(p[i]);
      rVec.add(nEV);
      
      float rad = atan(rVec.y/rVec.x);
      float deg;
      if(rVec.x > 0){
        deg = (rVec.y > 0)?-90 + degrees(rad)/2:90 + degrees(rad)/2;
      }else{
        //deg = (rVec.y > 0)?degrees(rad)/2:degrees(rad)/2;
        deg = degrees(rad)/2;
      }
      
      strokeWeight(2);
      float barX = -viewL/2 + i * width/pNum;
      float barY = graphHeight + margin + viewL/2 - 90;
      line(barX, barY, barX,barY - deg);
      //point(barX,barY-deg);
    }
  }
  
  
  noStroke();
  fill(60,200);
  ellipse(eP.x,eP.y,10,10);
  
  ellipse(p[0].x,p[0].y,10,10);
  
  //stroke(0,125,255,70);
  stroke(0,50);
  strokeWeight(1);
  noFill();
  float lX = -viewL/2 + ((float)cPNum/pNum * viewL);
  float lY =viewL/2 + margin;
  line(lX,lY,lX,lY+graphHeight);
  
  noStroke();
  fill(0,100,150,30);
  rect(-viewL/2,lY, ((float)cPNum/pNum * viewL),graphHeight);
  fill(0,200,150,30);
  rect(lX,lY, viewL - ((float)cPNum/pNum * viewL),graphHeight);
}


void mouseReleased(){
  picked = 0;
}

void mousePressed(){
  if(mouseY < viewL){
    PVector mP = new PVector(mouseX - viewL/2, mouseY - viewL/2);
    
    float eDist = mP.dist(eP);
    float oDist = mP.dist(pOrigin);
    
    float minDist = min(eDist,oDist);
    
    if(minDist<50){
    
      if(eDist < oDist){
        eP = new PVector(mouseX - viewL/2, mouseY - viewL/2);
        picked = 1;
      }
      else{
        if(shifted){
          picked = 3;
        }else{
          pOrigin = new PVector(mouseX - viewL/2, mouseY - viewL/2);
          picked = 2;
        }
      }
    }else{
      picked = 0;
    }
  }else if(mouseY >viewL + margin){
    
    cPNum = (int)((float)mouseX/viewL * pNum);
  }
  
}

void mouseDragged(){
  if(mouseY < viewL){
    if(picked > 0){
      switch(picked){
        case 1:
        
        eP = new PVector(mouseX - viewL/2, mouseY - viewL/2);
        break;
        
        case 2:
        pOrigin = new PVector(mouseX - viewL/2, mouseY - viewL/2);
        break;
        
        case 3:
        defDeg -= (float)(mouseX - pmouseX)/80;
        break;
        
      }
    }
  }else if(mouseY >viewL + margin){
    
    cPNum = (int)((float)mouseX/viewL * pNum);
   }
}

void keyPressed(){
  
  //println(keyCode);
  
  switch(keyCode){
    case 37:
    cPNum-=5;
    break;
    case 39:
    cPNum+=5;
    break;
    case 38:
    t += 0.001;
    break;
    case 40:
    t -= 0.001;
    break;
    
    case 67:
    cMode = 1;
    break;
    case 82:
    cMode = 0;
    break;
    
    case 16:
    shifted = true;
    break;
    
  }
}

void keyReleased(){
  shifted = false;
}
  

