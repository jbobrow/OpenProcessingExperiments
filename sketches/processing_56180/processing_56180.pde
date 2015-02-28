
PShape ground;
float xPos=0;

void setup () {
  size(900, 600);
  frameRate(30);
  smooth();
  
  ground=loadShape("ground.svg");
  
}

void draw() {
  background(255);
  shape(ground, xPos, 400, 1200, 200);
  println (mouseX);

xPos=constrain(xPos,-300,10);
if(mouseX>700){
  xPos-=10;
}else if (mouseX<200)
  xPos+=10;
}



