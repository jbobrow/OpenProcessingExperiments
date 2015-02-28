
//ICE

int pos;

void setup(){
  size(800,400);
}

void draw(){
  background(0);
  fill(255,0,0);
  pos=0;
  
  while(pos < width/2){
    rect(pos,0,20,20);
    rect(pos,height-20,20,20);
    rect(0,pos,20,20);
    rect(width/2-20,pos,20,20);
    pos = pos + 20;
  }
  
  fill(255);
  rect(width/2,0,width/2,height);
  
  for(int pos = 0; pos < width/2; pos = pos+20){
    fill(0,0,255);
    ellipse(width- pos,pos,20,20);
    ellipse(width/2 + pos, pos, 20,20);
  }
  
  
}



