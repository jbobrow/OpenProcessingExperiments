
int bg=0;
int bgx=1;
 
int circleX=0;
int circleY=0;
 
 
void setup() {
  size(500, 500);
  frameRate(120);
}
 
void draw() {
  background(bg);
  bg=bg+bgx;
  if (bg>=255) {
    bgx=-1;
  }
  else if (bg<=0) {
    bgx=1;
  }
 
 int strokecolor=255-(bg+bgx);
 
  if (mousePressed) {
    noFill();
    stroke(strokecolor);
    strokeWeight(10);
     
    ellipse(250, 250, circleX, circleY);
    circleX=circleX+1;
    circleY=circleY+1;
  }
  else   {
    if(circleX>0){
    circleX=circleX-1;
    circleY=circleY-1;
}
  }
  ellipse(250,250,circleX-50,circleY-50);
  ellipse(250,250,circleX-100,circleY-100);
  ellipse(250,250,circleX-150,circleY-150);
  ellipse(250,250,circleX-200,circleY-200);
  ellipse(250,250,circleX-250,circleY-250);
  ellipse(250,250,circleX-300,circleY-300);
  ellipse(250,250,circleX-350,circleY-350);
  ellipse(250,250,circleX-400,circleY-400);
  ellipse(250,250,circleX-450,circleY-450);
  ellipse(250,250,circleX-500,circleY-500);
}
