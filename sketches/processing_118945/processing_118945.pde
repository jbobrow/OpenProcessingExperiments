
float zoogX;
float zoogY;
//
float eyeR;
//
float speed;
float gravity;
boolean button=false;




void setup(){
  size(900, 700);
  background(255);
  zoogX=width/2;
  zoogY=0;
  speed=0;
  gravity=0.1;
  smooth();
}
 
void draw(){
background(255);
float endY=0;
while(endY<width){
  noStroke();
  float distance = abs(mouseX-endY);
  fill(distance);
  rect(endY,0,10,height);
  endY+=10;
}
fill(#BD4532);
noStroke();
ellipseMode(CENTER);
ellipse(zoogX,zoogY-150,150,200);
ellipse(zoogX, zoogY,250,300);
//
if(button){
eyeR=random(230,255);
fill(eyeR);
}else{
  eyeR=175;
  fill(eyeR);
};
ellipse(zoogX-30, zoogY-200, 50, 50);
ellipse(zoogX+30, zoogY-200, 50, 50);
strokeWeight(2);
stroke(0);
line(zoogX-50, zoogY-150, zoogX+50, zoogY-150);
zoogY=zoogY+speed;
speed=speed+gravity;
if(zoogY>height-100){
  speed=speed*-0.95;
}
zoogY=constrain(zoogY,200,height-100);

}

void mousePressed(){
  button=!button;
}
 



