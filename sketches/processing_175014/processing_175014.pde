
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

void setup(){
  size(750,750);
  colorMode(HSB, 100);
  adaptSurround = color(85,60,100);
}

void draw(){
  if(testPhase){
    background(testSurround);
    drawChosenColor();
    
    strokeWeight(3);
    stroke(color(0,0,0));
    fill(testGray);
    ellipse(widt/2-split,targDY*widt/2,circSize,circSize);
    noStroke();
    ellipse(widt/2+split,targDY*widt/2,circSize,circSize);
  }else{
    chooseAdaptingColor();
    background(adaptSurround);
    noStroke();
    fill(color(100,0,100));
    rect(0,widt/2,widt,widt);
    
    strokeWeight(3);
    stroke(color(0,0,0));
    fill(adaptGray);
    ellipse(widt/2+split,targDY*widt/2,circSize,circSize);
    noStroke();
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
}


