
int speedX;
int speedY;
int posX;
int posY;

void setup() {

speedX = 5;
speedY = 5;
posX = width/2;
posY = height/2;
size(900, 500); 
smooth();
frameRate(15);
}

void draw() {
 background(#C4C5B5);  
 
drawRect(width/2,height/2,600,99); 
drawRect(width/2,height/2,300,random(150,255)); 

drawCircle(150+posX,350, 70,100);
drawCircle(100+posX,posY+100,20,255);


pushMatrix();
translate(speedX,speedY);
//drawCircle(100,posY,100);
popMatrix();
if(posX <0){
speedX *= -1;
}else if (posX >550){
speedX*=-1;
}else if (posY<0){
speedY*=-1;
}else if (posY >300){
  speedY*=-1;
}
posX +=speedX;
posY +=speedY;
}
void drawRect(int x, int y, float r, float c) {
 fill(c-99, 54, c ,30);
 strokeWeight(0.15); 
 rectMode(CENTER);
 rect(x,y,r+350,r);
 if (r > 200) {
  r *= 0.95f;
  drawRect(x, y, r,c);
  }
}


void drawCircle(int x, int y, float r,float c) {
  strokeWeight(0.15); 
  fill(196,197,181,60);
  ellipse(x, y, r+55, r-55);
  y=y-2;
  fill(x,random(c),c,50);
  ellipse(x,y+40,r+40,r+15);
  line(x,y+25,x,y+40);
  fill(196,197,181,90);
  rect(x-15,y+80,r-20,r-10);
  rect(x+15,y+80,r-20,r-10);
  if (r > 1) {
    r *= 0.80f;
    drawCircle(x, y, r,c);
  }
}           

