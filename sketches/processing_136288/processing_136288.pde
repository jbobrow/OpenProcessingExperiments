
float gray=random(255);
void setup(){
  size(800,800);
  smooth();
  background(20);
}
void draw(){
  if (gray>=255){
  gray=gray*-1;}
  frameRate(100);
  strokeWeight(20);
  float r=random(255);
  float m=random(255);
  float a=random(2);
  if(mousePressed==true){
    if (mouseButton==LEFT){
          stroke(r/.5,m/.5,120);
          translate(400,200);
          float b=random(7.5);
          rotate(PI/b);
      triangle(mouseX-400,mouseY-200,mouseX-385,mouseY-210,mouseX-390,mouseY-200);
      strokeWeight(1);
      line(mouseX-400,mouseY-200,-400,-400);
      translate(0,0);
      strokeWeight(1);
      translate(0,0);
      stroke(m/a,r/.5,120);
      float c=random(100);
      line(400,400, mouseX,mouseY);
  }
    if(mouseButton==RIGHT){
      background(gray,gray-100,gray+50);
    gray+=5;
  }}}
