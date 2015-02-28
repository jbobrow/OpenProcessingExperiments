
//直線のアニメーション（pro106）
float X;
float Speed;

PImage image;

void setup() {
 size(500,500);
 X=0;
 Speed=1;
 image=loadImage("99p.jpg");
 frameRate(15);
}

void draw(){
 fadeToWhite();
 X=X+Speed;
 image(image,X,249,image.width*0.5,image.height*0.5);
}

void fadeToWhite() {
  noStroke();
  fill(99,30);
  rectMode(CORNER);
  rect(0,0,width,height);
}


