
int xPos=100, xDirection = 2,yPos=250; //left or right
 
void setup(){
  size(500,500);
  smooth();
}
 
void draw(){
  background(255);
  xPos = xPos + xDirection;
  if (xPos>400 ||xPos<100){
    xDirection*=-1;
  }
  makeEye();
  //makeIris();
  if (mousePressed == true){
    rotate(radians(360));
    scale(1);
    makeNerve();
    scale(.9);
    makeIris();
  } else {
    scale(1);
    makeIris();
  }
}

void makeEye(){
  strokeWeight(8);
  noFill();
  ellipse(xPos,yPos, 150,150);
}

void makeIris(){
  int pX = (int) map(mouseX, 0, width, -30, 30);
  int pY = (int) map(mouseY, 0, height, -30, 30);
  fill(0);
  ellipse(xPos + pX,yPos + pY,66,66);
}

void makeNerve(){
  fill(0);
  line(xPos-60,yPos+45,xPos-100,yPos+100);
  line(xPos,yPos+75,xPos,yPos+130);
  line(xPos+60,yPos+45,xPos+100,yPos+100);
}
