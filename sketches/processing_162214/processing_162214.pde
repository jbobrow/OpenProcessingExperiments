
int count;
int stateW;
int stateB;
int diam;

void setup(){
  size(800,600);
   count = 0;
   stateB = width/2;
   stateW = width/2;
}

void draw(){
  background(255);//random(255),random(255),random(255));
  rectMode(CORNER);
  fill(0);
  rect(width/2,0,width/2,height);
  
  //State Machine
  
   count++;
  if(count > 30){
    count = 0;
    stateB-=width/20;
    stateW-=width/20;
    if(stateB < 0){
       stateB = width/2;
       
    }
    if(stateW < width/(-2)){
      stateW = width/(2);
      
    
  }
  }
  
  //Large Circles
  ellipse(width/4,height/2,stateB,stateB);
  fill(255);
  ellipse(width*3/4,height/2,stateW,stateW);
  //print(count, state + " ");
}


