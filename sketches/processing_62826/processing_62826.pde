
int h = 720;
int w = 1280;

I[] myI = new I[200];

void setup() {
  size(w,h);
  background(20);
  
  for(int i=0; i<myI.length; i++) {
    myI[i] = new I(random(width),random(height),random(5),random(5),-1.5,-1,20);
  }
}

void draw() {
  smooth();

  drawYou(mouseX,mouseY,250);
  
    for(int i=0; i<myI.length; i++) {
    myI[i].drawI();
    myI[i].moveI();
  }
  
  if (keyPressed == true) {
    background(20);
  }
}

void drawYou(float xpos2, float ypos2, float c2){
    stroke(c2);
    strokeWeight(5);
    fill(c2);
    line(xpos2,ypos2,xpos2+140,ypos2+185);
    line(xpos2+140,ypos2+185,xpos2+280,ypos2);
    line(xpos2+140,ypos2+185,xpos2+140,ypos2+500);
    ellipseMode(CORNER);
    ellipse(xpos2+260,ypos2,185,510);
    rectMode(CORNER);
    rect(xpos2+490,ypos2,165,360);
    ellipse(xpos2+490,ypos2+205,165,310);
}


