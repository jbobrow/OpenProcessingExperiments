
int h = 400;
int w = 600;

I[] myI = new I[95];

void setup() {
  size(w,h);
  background(20);
  
  for(int i=0; i<myI.length; i++) {
    myI[i] = new I(random(width),random(height),random(3),random(3),-1.5,-1,20);
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
    line(xpos2,ypos2,xpos2+70,ypos2+92.5);
    line(xpos2+70,ypos2+92.5,xpos2+140,ypos2);
    line(xpos2+70,ypos2+92.5,xpos2+70,ypos2+250);
    ellipseMode(CORNER);
    ellipse(xpos2+130,ypos2,92.5,255);
    rectMode(CORNER);
    rect(xpos2+245,ypos2,82.5,180);
    ellipse(xpos2+245,ypos2+102.5,82.5,155);
}


