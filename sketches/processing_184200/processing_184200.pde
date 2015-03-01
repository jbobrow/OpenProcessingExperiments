

  float firstx= 0;
  float firsty= 0;
  float lastx = 0;
  float lasty = 0;
  
  float lastc = 0;
  int box = 10;
  int crange = 50;
  float firstc = 50+crange;
  
  
void setup(){
  size(500,500);
  background(0);
  
  frameRate(60);
  
  firstx= width/2;
  firsty= height/2;
  
}

void draw(){
  lastx= random(mouseX-box,mouseX+box);
  lasty= random(mouseY-box,mouseY+box);
  lastc= random(firstc-box,firstc+box);
  
  //boundaries to canvas
  if (lastx < box) {lastx=box;}
  if (lasty < box) {lasty=box;}
  if (lastx > width-box) {lastx=width-box;}
  if (lasty > height-box) {lasty=height-box;}  
  if (lastc < crange) {lastc=crange;}
  if (lastc > 255) {lastc=255;}
  
  stroke(lastc);
      
  line (firstx,firsty,lastx,lasty);
  
  firstx=lastx;
  firsty=lasty;
  firstc = lastc;  
  
}


