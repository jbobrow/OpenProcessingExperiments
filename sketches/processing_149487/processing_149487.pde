
int period = 500;
int lastT;
int phase = 1;
int nCircles = 6;

void setup(){
  size(1000,1000);
  lastT = millis();
}

void draw(){
  if(millis()-lastT > period){
    phase = -phase;
    lastT = millis();
  }
  background(#FFFFFF);
  stroke(#FF0000);
  ellipse(500,500,2,2);
  drawCircles(nCircles);
}

void drawCircles(int nCircs){
  float angle = (2*PI)/nCircs;
  for(int i=0;i<nCircs;i++){
    float xPos = cos(i*angle)*mouseY/2+500;
    float yPos = sin(i*angle)*mouseY/2+500;
    drawCircle(xPos,yPos);
  }
}

void drawCircle(float x, float y){
  if(phase==-1){
    stroke(#505050);
    strokeWeight(5);
    fill(255);
    ellipse(x,y,mouseX/3,mouseX/3);
  }else{
    drawGradient(x,y,int(mouseX/3.3));
  }
}
    
    
void drawGradient(float x, float y, int rad) {
  int radius = rad;
  int h = 150;
  for (int r = radius; r > 0; --r) {
    fill(h);
    stroke(h);
    ellipse(x, y, r, r);
    if(h<250){
      h = h+5;
    }else{
      h=255;
    }
  }
}

void keyPressed(){
  if(key==CODED){
    if(keyCode==UP){
      nCircles = nCircles + 1;
    }
    if(keyCode==DOWN && nCircles > 2){
      nCircles = nCircles - 1;
    }
    if(keyCode==LEFT && period > 10){
      period = period - 10;
    }
    if(keyCode==RIGHT){
      period = period + 10;
    }
  }
}
    
  


