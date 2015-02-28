
PImage colonial;
PImage drumstick;

void setup(){
size(500,500);
colonial=loadImage("colonial.png");
drumstick=loadImage("drumstick.png");
}
void draw(){
  background(255);
  image(colonial,0,0);
  PFont f;
  f = loadFont("SansSerif-48.vlw");
  textFont (f,24);
  fill(255);
  if(mouseX<width/2 && mouseY<height/2){
    text("CHICKEN!!!",mouseX,mouseY);
}
  if(mouseX<width/2 && mouseY>height/2){
    text("CRISPY CHICKEN!",mouseX,mouseY);
}
  if(mouseX>width/2 && mouseY<height/2){
    text("GRILLED CHICKEN!",mouseX,mouseY);
}
  if(mouseX>width/2 && mouseY>height/2){
    text("BISCUITS!",mouseX,mouseY);
}
  frameRate(10);
  tint
 (random(0,255),35,150);
  for(int i = 1; i <10; i ++){
   image(drumstick,random(25,475),random(25,475));
  }
}

   



