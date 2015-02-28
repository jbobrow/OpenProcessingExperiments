
int last = 0;
int barWidth = 24;
int footLength = 96;
int footHeight = 60;
int xPos;
Boolean yellow=true;

void setup(){
  size(1000,1000);
}

void draw(){
  makeStripes();
  if(xPos>1000){
    xPos=0;
  }
  drawFeet();
  fill(#FF0000);
  rect(500,100,10,10);
}

void makeStripes(){
  background(#000000);
  noStroke();
  fill(#FFFFFF);
  for(int i=0;i<ceil(1000/(2*barWidth)+1);i=i+1){
    if(i<ceil(500/(2*barWidth))){
      rect(i*2*barWidth,0,24,1000);
    }else{
      rect(i*2*barWidth,0,43,1000);
    }
  }
}

void drawFeet(){
  noStroke();
  xPos = xPos + mouseX/100;
  if(yellow){
    fill(#FFFF44);
  }else{
    fill(#000088);
  }
  rect(xPos,500-(footHeight/2),footLength,footHeight);
  fill(#FF0000);
  rect(xPos+footLength/2,mouseY-50,10,10);
}

void keyPressed(){
  if(key==ENTER){
    yellow = !yellow;
  }
  if(key==CODED){
    if(keyCode==UP && footHeight<1010){
      footHeight = footHeight+10;
    }
    if(keyCode==DOWN && footHeight>0){
      footHeight = footHeight-10;
    }
    if(keyCode==LEFT && footLength>0){
      footLength = footLength-12;
    }
    if(keyCode==RIGHT && footLength<1010){
      footLength = footLength+12;
    }
  }
}


