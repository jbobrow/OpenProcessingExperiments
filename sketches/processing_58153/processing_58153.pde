
int trailNum = 10;
int prevx[];
int prevy[];

void setup(){
  size(600,600); 
  prevx = new int [trailNum];
  prevy = new int [trailNum];
}

void draw(){
  background(255); 
  //push back loop
  for(int i = 1; i < trailNum; i++){
     prevx[i - 1] = prevx[i];
     prevy[i - 1] = prevy[i]; 
  }
  
  prevx[trailNum - 1] = mouseX;
  prevy[trailNum - 1] = mouseY;
  for(int i = 0; i < trailNum; i ++){
    ellipse(prevx[i],prevy[i],10,10); 
  }
}

