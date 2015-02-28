
float a=0.0;
float s=0.5;
float ss=0.8;
float y=mouseY;
void setup(){
  size(600,600);
  background(250,255,10);
smooth();
frameRate(30);

}
void draw(){
 text("click left or right button of the mouse`",40,40);
  fill(250,255,10,30);//to make shadow of the movement
 rect(0,0,600,600);
 
 translate(mouseX,mouseY);//set center as (mouseX,mouseY)
 if(mousePressed){
 if (mouseButton==LEFT){  
 drawBear();
 }else if (mouseButton==RIGHT){
   drawPanda();
 }}}
 void drawPanda(){
    a+=0.1;
  s+=0.02;
  float gravity=abs(mouseY*0.1);
  mouseY+=ss*gravity;
  rotate(-a);//rotate the panda (opposite direction)
  scale(s);//scale the panda
  if(s>1.5){s=0.5;}
  if((mouseY>height&&ss>0)||(mouseY<0&&ss<0)){
    ss=-ss;}
//ears of panda
fill(0);
ellipse(-70,-50,70,70);
ellipse(70,-50,70,70);
//head of panda
fill(255);
strokeWeight(4);
ellipse(0,0,200,180);
//eyes of panda
fill(0);
ellipse(-50,10,60,70);
ellipse(50,10,60,70);
fill(255);
ellipse(-50,0,12,12);
ellipse(50,0,12,12);
//nose of panda
fill(0);
ellipse(0,50,15,10);
//mouse of panda
noFill();
stroke(0);
strokeWeight(4);
bezier(-5,70,-5,75,5,75,5,70);}
void drawBear(){
    a+=0.1;
  s+=0.02;
  float gravity=abs(mouseY*0.1);
  mouseY+=ss*gravity;
  rotate(a);//rotate the bear
  scale(s);//scale the bear
  if(s>1.5){s=0.5;}
  if((mouseY>height&&ss>0)||(mouseY<0&&ss<0)){
    ss=-ss;}
//ears of bear
fill(142,64,0);
stroke(0);
strokeWeight(4);
ellipse(-70,-50,70,70);
ellipse(70,-50,70,70);
//head of bear
fill(142,64,0);
stroke(0);
strokeWeight(4);
ellipse(0,0,200,180);
//eyes of bear
fill(255);
ellipse(-50,0,30,30);
ellipse(50,0,30,30);
fill(0);
ellipse(-60,0,7,7);
ellipse(40,0,7,7);
//mouse of bear
strokeWeight(2);
fill(230,140,0);
stroke(0);
ellipse(0,50,80,70);
stroke(0);
strokeWeight(2);
line(0,20,0,65);
line(0,65,-8,70);
line(0,65,8,70);
//nose of bear
fill(0);
ellipse(0,20,20,15);}
