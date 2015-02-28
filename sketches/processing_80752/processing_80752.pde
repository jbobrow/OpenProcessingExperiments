
float r=0;
float g=0;
float b=0;
float c=0;
float d=0;
float e=0;
void setup(){
  size(400,400);
  smooth();
}
void draw(){
  drawA();
  keypressed();
}
void drawA(){
  stroke(255,255,255);
  rect(mouseX,mouseY,20,20);
  rect(width-mouseX,mouseY,20,20);
  fill(c,d,e,10);
  rect(0,0,width,height);
}
void keypressed(){
  if(mousePressed==true){
    c=c+mouseX;
    d=mouseY;
    e=mouseX-mouseY;
  }
  if(key=='r'){
    fill(255,0,0);
  }
  if(key=='g'){
    fill(0,255,0);
  }
  if(key=='b'){
    fill(0,0,255);
  }
}


