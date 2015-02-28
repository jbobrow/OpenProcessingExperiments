
void setup(){
  size(300,300);
  background(255);
  frameRate(40);
}
int x = 0;

void draw(){
  rectMode(CORNERS);
  rect(100,100,200,200);
  x++;
 if(x>100){
   fill(200);
   rect(100,100,200,200);
   x++;
 }
  if(x>150){
    fill(100);
    ellipse(x,x,50,50);
    x++;
 }
  if(x > 200){
    fill(100,200,60);
    ellipse(width/3,width/3,x,x);
    x++;
 }
  if(x>300){
    background(246,38,195);
    strokeWeight(10);
    line(0,200,width/3,300);
    line(width/3,300,300,0);
    noLoop();
  }
}

