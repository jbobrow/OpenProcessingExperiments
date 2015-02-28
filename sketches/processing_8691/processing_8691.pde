
int numa = 40;
int numb = 21;
int elementWidth = 10;
PVector[][] X = new PVector[numa][numb];
PVector[][] V = new PVector[numa][numb];
PVector[][] F = new PVector[numa][numb];
float k = 0.1;
float c = 0.01;
float gravity = 0.01;
float wind = 0.01;
PVector[] constraint = new PVector[numb];
boolean flagBool = false;
PImage flag;
void setup(){
  size(520,400,P3D);
  flag = loadImage("flag (2).jpg");
  reset();
  setupConstraint();
}
void draw(){
  background(0);
  physics();
  lights();
  drawSheet();
}
void keyPressed(){
  if (key==' '){
    if (flagBool == false){
      flag = loadImage("flag (3).jpg");
      flagBool = true;
    }else{
      flag = loadImage("flag (2).jpg");
      flagBool = false;
    }
  }
}

