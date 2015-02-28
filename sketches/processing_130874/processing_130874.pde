
int last = 0;
int barWidth = 25;
int footLength = 100;
Boolean paused = true;

void setup(){
  size(1000,1000);
}

void draw(){
  if(paused){
    background(#aaaaaa);
    textSize(48);
    fill(#000000);
    text("Kickback Reverse-Phi Demo",200,400);
    textSize(32);
    text("Seizure warning! Contains flashing images.",150,800);
    text("Click within window and press P to start/pause.",130,870);
  }else{
    makeStripes();
    if(millis()-last>10000){
      last = millis();
    }
    if(millis()%500>450){
      fill(#000000);
    }else{
      fill(#FFFFFF);
    }
    rect(0,500,1000,500);
    drawFeet();
    fill(#FF0000);
    rect(500,500,10,10);
  }
}

void makeStripes(){
  background(#000000);
  noStroke();
  fill(#FFFFFF);
  for(int i=0;i<ceil(1000/(2*barWidth));i=i+1){
    rect(i*2*barWidth,0,barWidth*2-5,1000);
  }
}

void drawFeet(){
  int mill = millis()-last;
  noStroke();
  fill(#FFFF44);
  rect(mill/10,100,footLength,60);
  rect(mill/10,900,footLength,60);
  fill(#FF0000);
  rect(mill/10+footLength/2,mouseY-50,10,10);
}

void keyPressed(){
  if(key=='p'){
    paused=!paused;
  }
}


