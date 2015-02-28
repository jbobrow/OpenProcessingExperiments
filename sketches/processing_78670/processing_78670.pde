
float Xvalue = 225;
float Yvalue = 225;
float movement=.25;
PImage leftwalk;
PImage rightwalk;

void setup() {
  size(500, 500);
  background(0);
  smooth();
  leftwalk=loadImage("mekeleft.png");
  rightwalk=loadImage("mekeright.png");
}
void draw() {
  size(500, 500);
  background(0);
  fill(0);
  rect(Xvalue, Yvalue, 50, 50);
  //  image(rightwalk,Xvalue-20,Yvalue-20);
}

void mouseDragged() 
{
  if (mouseX > 250) {
    Xvalue= Xvalue+movement;
    fill(255, 246, 167);
    ellipse(Xvalue+50, Yvalue+50, 100, 100);
    image(rightwalk, Xvalue-20, Yvalue-20);
  }
  if (mouseX < 250) {
    Xvalue= Xvalue-movement;
    fill(255, 246, 167);
    ellipse(Xvalue, Yvalue+50, 100, 100);
    image(leftwalk, Xvalue-20, Yvalue-20);
  }
  if (Xvalue >= 460) {
    Xvalue=Xvalue-movement;
  }
  if (Xvalue <=-10) {
    Xvalue=Xvalue+movement;
  }
  if (mouseY > 250) {
    Yvalue= Yvalue+movement;
  }
  if (mouseY < 250) {
    Yvalue= Yvalue-movement;
  }
  if (Yvalue >= 460) {
    Yvalue=Yvalue-movement;
  }
  if (Yvalue <=-10) {
    Yvalue=Yvalue+movement;
  }
}


