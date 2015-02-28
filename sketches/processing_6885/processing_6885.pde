
float boxX = 350;
float boxY = 250;
float boxWedth = 70;
float boxMouseDist = 30;

void setup(){
  size(700,500);
}

void draw(){
  background(255);
  if(mouseNearBox()){
    boxX = random(35,width-35);
    boxY = random(35,height-35);
  }
  drawBox();
}

boolean mouseNearBox(){
  if((abs((boxX+35)-mouseX)<=boxMouseDist && mouseY>boxY-35 &&
  mouseY<boxY+35) ||
  (abs((boxX-35)-mouseX)<=boxMouseDist && mouseY>boxY-35 &&
  mouseY<boxY+35) ||
  (abs((boxY-35)-mouseY)<=boxMouseDist && mouseX>boxX-35 &&
  mouseX<(boxX+35)) ||
  (abs((boxY+35)-mouseY)<=boxMouseDist && mouseX>boxX-35 &&
  mouseX<(boxX+35))){
    return true;
  }
  return false;
}

void drawBox(){
  fill(0);
  rectMode(CENTER);
  rect(boxX,boxY,boxWedth,boxWedth);
}

