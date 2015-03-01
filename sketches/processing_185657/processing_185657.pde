
int rad =60;
float xPos, yPos;

float xSpeed =5;
float ySpeed=2;

int xDirection =1;
int yDirection=1;
boolean stop=true;

void setup(){
  size (800,300);
  noStroke();
  frameRate(50);
  xPos=width/2;
  yPos=height/2;
}
void draw(){
  background(0);
  xPos=xPos+(xSpeed*xDirection);
  yPos=yPos+(ySpeed*yDirection);
  
if (xPos>width-20|| xPos<rad-20){
  xDirection=xDirection*-1;
  rad=rad-5;
}
if (yPos>height-20||yPos<rad-20){
  yDirection=yDirection*-1;
  rad=rad-2;
}
  else if (rad<=1) {
    stop=true;
    xPos=0;
    yPos=0;
}
for (int i=0; i<3; i++){
ellipse(xPos+i*60,yPos,rad,rad);
}}


