
float speed=4;

float y=mouseY;
float sy=-speed;
float ay=sq(speed/5);

float x=mouseX;
float sx=speed;

float xstart;
float ystart;
float syr; //speed of y replacement
float b;
void setup(){
  size(500,500);
  background(0);
}
void draw(){
  if(b==1){
    background(0);
  }
  fill(200,100,0);
  stroke(50);
  ellipse(x,y,30,30);
  
  
  if(mousePressed){
    background(0);
    stroke(0,200,0);
    line(mouseX,mouseY,xstart,ystart);
  }else{
  y+=sy;
  sy+=ay;
  x+=sx;
  }
  fill(255);
  text("the start point is ("+ xstart+", "+ ystart+")",20,20);
  text("the x speed is "+sx,20,30);
  text("the y speed is "+syr,20,40);
}
void mousePressed(){
  
  xstart=mouseX;
  ystart=mouseY;
  x=xstart;
  y=ystart;
}
void mouseReleased(){
  background(0);
  sx=(xstart-mouseX)/5;
  sy=(ystart-mouseY)/5;
  syr=sy;
}
void keyPressed(){
  if(key=='s'){
    stroke(0);
  }
  if(key=='d'){
    noStroke();
  }
  if(key=='b'){
    b=1;
  }
  if(key=='v'){
    b=0;
  }
}
