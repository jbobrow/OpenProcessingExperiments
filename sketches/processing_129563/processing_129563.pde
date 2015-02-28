
int last = 0;
int barWidth = 25;
int footLength = 100;

void setup(){
  size(1000,1000);
}

void draw(){
  makeStripes();
  if(millis()-last>10000){
    last = millis();
  }
  drawFeet();
  fill(#FF0000);
  rect(500,100,10,10);
}

void makeStripes(){
  background(#000000);
  noStroke();
  fill(#FFFFFF);
  for(int i=0;i<ceil(1000/(2*barWidth));i=i+1){
    if(i<ceil(500/(2*barWidth))){
      rect(i*2*barWidth,0,25,1000);
    }else{
      rect(i*2*barWidth,0,45,1000);
    }
  }
}

void drawFeet(){
  int mill = millis()-last;
  noStroke();
  fill(#FFFF44);
  rect(mill/10,470,footLength,60);
  fill(#FF0000);
  rect(mill/10+footLength/2,mouseY-50,10,10);
}


