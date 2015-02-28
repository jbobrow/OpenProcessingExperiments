
Target dot;

void setup(){
  size(500,500);
  noStroke();
  noCursor();
  dot = new Target();
}

void draw(){
  background(0);
  dot.display();
}

class Target{
  int x0 = 250;
  int y0 = 250;
  int xsig;
  int ysig;
  
  void display(){
    rectMode(CENTER);
    fill(255);
    rect(mouseX,mouseY,90,15);
    rect(mouseX,mouseY,90,15);
    rect(mouseX,mouseY,15,90);
    rect(mouseX,mouseY,15,90);
    fill(0);
    ellipse(mouseX,mouseY,30,30);
    xsig = x0 + (int)random(-10,10);
    ysig = y0 + (int)random(-10,10);
    if(xsig < 0 & xsig > 250 & ysig < 0 & ysig >250){
    } else {
      fill(205,0,0);
      ellipse(xsig, ysig,30,30);
      x0 = xsig;
      y0 = ysig;
    }
    if((mouseX == xsig) && (mouseY == ysig)){
      if(mousePressed){
        xsig = xsig;
        ysig = ysig;
      }
    }
  }
}


