
void setup(){
  size(500,500);
  background(25,28,79);
  noStroke();
  smooth();
  frameRate(15);
}

int a=0;
int b=0;
int aspeed=3;
int bspeed=3;
void draw() {
  
  if (mousePressed==false){
    frameRate(15);
    a=a+aspeed;
    b=b+bspeed;
    background(25,28,79);
    pushMatrix();
    translate(mouseX,mouseY);
    rotate(frameCount);
    star(0,0);
    popMatrix();
    b=0;
  }
  if (mousePressed==true){
    a=a+aspeed;
    b=b+bspeed;
    background(25,28,79);
    pushMatrix();
    frameRate(100);
    translate(mouseX,mouseY);
    star(0,b);
    popMatrix();
    if (b>500){
      b=0;
    }
  }
}

void star (int c, int d) {
  fill(209,188,61);
  ellipse(0,0,20,20);
  triangle(-5,0,0,25+d,5,0);
  rotate(radians(360/5));
  triangle(-5,0,0,25+d,5,0);
  rotate(radians(360/5));
  triangle(-5,0,0,25+d,5,0);
  rotate(radians(360/5));
  triangle(-5,0,0,25+d,5,0);
  rotate(radians(360/5));
  triangle(-5,0,0,25+d,5,0);
}
