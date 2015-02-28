
void setup(){
  size(300,300);
  background(0,0,0);
}
int d=int(random(-3,3));
int f=int(random(-3,3));
int h=int(random(-3,3));
int r=0,b=0,g=0;
void draw(){
  stroke(255,255,255);
  strokeWeight(1);
  if (keyPressed==true && key=='z'){
    background(0+r,0+g,0+b);
    r=mouseX+d;
    g=mouseX+f;
    b=mouseY+h;
    stroke(164,232,223);
    strokeWeight(3);
    ellipse(300-mouseX,300-mouseY,10,10);
    ellipse(mouseX,mouseY,10,10);
  }
  if (keyPressed==true && key=='r'){
    background(255,255,255);
  }
}


