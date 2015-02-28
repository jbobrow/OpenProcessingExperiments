
int x=10;
int y=5;
int speed = 4;
void setup(){
  size(400,400);
  background(#87CEFA);
  smooth();
  }
  
void draw(){
  yoyo ();
}
void yoyo (){
  frameRate(50);
background(x+100, 150, 50);
smooth();
//string//
strokeWeight(2);
stroke(255);
line(200, 0, 200, x);
//yoyo inner circle//
stroke(0);
fill(#FFA500);
ellipse(200, x, 90, 90);
//yoyo middle circle//
fill(255);
ellipse(194, x, 90, 90);
//yoyo outer circle//
stroke(0);
strokeWeight(2);
fill(#FFA500);
ellipse(187, x, 90, 90);
x=x+speed;{
  if ((x<0||x>=240)){
    speed=speed*-1;
  }
}}
