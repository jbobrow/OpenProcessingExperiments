
void setup(){
  size(500,500);
  background(255);

  //colorMode(HSB);
}  
float startX=random(-250,250);
float startY=random(-250,250);
float endX=random(-250,250);
float endY=random(-250,250);
int c=1;
int cChange=0;
void draw(){
    translate(250,250);
  for(int i=0;i<10;i++){
    line(startX,startY,endX,endY);
    rotate(PI/5);
  }
  stroke(mouseY);
  /*if(c==255){
    cChange=1;
  } else if(c==0){
    cChange=0;
  }
  if(cChange==0){
    c++;
  } else {
    c--;
  }*/
  startX=endX;
  startY=endY;
  endX=random(0,mouseX-250);
  endY=random(0,mouseX-250);
  
}  


