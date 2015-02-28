
  void setup() {
  size(screen.width/2, screen.height/2);
  smooth();
}

void draw() {
  float overallHeight=0;
  float headWidth=100;
  float headHeight=100;
  float bodyWidth =100;
  float bodyHeight = 150;
  float armWidth = 50;
  float armHeight = 150;
  float legWidth = 50;
  float legHeight = 150;
  float pressR=0;
  float pressB=255;

  background(255);
     if(mousePressed){
  pressR=255;
  pressB=0;
  
  fill(255,0,0);
  textSize(30);
  textAlign(CENTER);
  text("DANGER WILL ROBINSON DANGER",width/2,height/5.5);
  fill(100);
  rect(mouseX-bodyWidth/2-armHeight,mouseY-bodyHeight/2,armHeight,armWidth);
  rect(mouseX+bodyWidth/2,mouseY-bodyHeight/2,armHeight,armWidth);
  } else{
    fill(100);
      rect(mouseX-bodyWidth/2-armWidth,mouseY-bodyHeight/2,armWidth,armHeight);
      rect(mouseX+bodyWidth/2,mouseY-bodyHeight/2,armWidth,armHeight);
  }
  fill(100);
  rect((mouseX-headWidth/2), (mouseY-bodyHeight/2-headHeight), headWidth, headHeight);
  rect(mouseX-bodyWidth/2, (mouseY-bodyHeight/2), bodyWidth, bodyHeight);
  rect(mouseX-bodyWidth/2,mouseY+bodyHeight/2,legWidth,legHeight);
  rect(mouseX+(bodyWidth-2*legWidth)/2,mouseY+bodyHeight/2,legWidth,legHeight);
  noFill();
  beginShape();
  vertex(mouseX-headWidth/2,mouseY-bodyHeight/2-headHeight/2);
  vertex(mouseX-headWidth/2-6,mouseY-bodyHeight/2-headHeight/2-10);
  vertex(mouseX-headWidth/2-12,mouseY-bodyHeight/2-headHeight/2+10);
  vertex(mouseX-headWidth/2-18,mouseY-bodyHeight/2-headHeight/2-10);
  vertex(mouseX-headWidth/2-24,mouseY-bodyHeight/2-headHeight/2+10);
  vertex(mouseX-headWidth/2-27,mouseY-bodyHeight/2-headHeight/2);
  endShape();
  beginShape();
  vertex(mouseX+headWidth/2,mouseY-bodyHeight/2-headHeight/2);
  vertex(mouseX+headWidth/2+6,mouseY-bodyHeight/2-headHeight/2-10);
  vertex(mouseX+headWidth/2+12,mouseY-bodyHeight/2-headHeight/2+10);
  vertex(mouseX+headWidth/2+18,mouseY-bodyHeight/2-headHeight/2-10);
  vertex(mouseX+headWidth/2+24,mouseY-bodyHeight/2-headHeight/2+10);
  vertex(mouseX+headWidth/2+27,mouseY-bodyHeight/2-headHeight/2);
  endShape();
  
  fill(pressR,0,pressB);
  ellipse(mouseX+(headWidth/4),mouseY-bodyHeight/2-headHeight/2,headWidth/4,headHeight/1.5);
  ellipse(mouseX-(headWidth/4),mouseY-bodyHeight/2-headHeight/2,headWidth/4,headHeight/1.5);
  ellipse(mouseX-headWidth/2-33,mouseY-bodyHeight/2-headHeight/2,12,12);
  ellipse(mouseX+headWidth/2+33,mouseY-bodyHeight/2-headHeight/2,12,12);
 
}


