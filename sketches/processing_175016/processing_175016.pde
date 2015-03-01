
color adaptGray = 50;
color adaptSurround;
color testGray = 100;
color testSurround = 100;
boolean outlineOnTest = true;
float widt = 750;
float circSize = 60;
boolean testPhase = false;
float targDY = .5;
float split = 60;
boolean secondOutline = true;

void setup(){
  size(750,750);
  colorMode(HSB, 100);
  adaptSurround = color(85,60,100);
}

void draw(){
  if(testPhase){
    background(testSurround);
    if(secondOutline){
      strokeWeight(10);
      stroke(0);
      noFill();
      ellipse(widt/2-split,targDY*widt/2,circSize,circSize);
      strokeWeight(6);
      stroke(100);
      ellipse(widt/2-split,targDY*widt/2,circSize,circSize);
    }
    drawGrid();
    drawChosenColor();
  }else{
    chooseAdaptingColor();
    background(adaptSurround);
    noStroke();
    fill(color(100,0,100));
    rect(0,widt/2,widt,widt);
    
    strokeWeight(10);
    stroke(0);
    noFill();
    ellipse(widt/2+split,targDY*widt/2,circSize,circSize);
    
    strokeWeight(6);
    stroke(adaptGray);
    ellipse(widt/2+split,targDY*widt/2,circSize,circSize);
    ellipse(widt/2-split,targDY*widt/2,circSize,circSize);
  }
  fill(color(0,0,0));
  noStroke();
  ellipse(widt/2,targDY*widt/2,2,2);
}

void drawChosenColor(){
  noStroke();
  if(false){//mouseY>widt/2){
    fill(color(mouseX/widt*100,((mouseY-widt/2)/(widt/2))*100,100));
  }else{
    chooseAdaptingColor();
    fill(adaptSurround);
  }
  rect(0,widt/2,widt,widt);
}

void chooseAdaptingColor(){
  adaptSurround = color((mouseX/widt)*100,80,(mouseY/widt)*100);
}

void mousePressed(){
    testPhase = !testPhase;
}

void keyPressed(){
  if(key==CODED){
    if(keyCode==UP){
      adaptGray=min(adaptGray+1,100);
    }
    if(keyCode==DOWN){
      adaptGray=max(adaptGray-1,1);
    }
  }
  if(key==ENTER){
    secondOutline=!secondOutline;
  }
}

void drawGrid(){
  float spacing = 13;
  stroke(0);
  strokeWeight(1);
  for(int i=0;i<widt/spacing+1;i++){
    line(i*spacing,0,i*spacing,widt);
    line(0,i*spacing,widt,i*spacing);
  }
}


