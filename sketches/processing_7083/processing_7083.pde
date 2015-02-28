
PFont fontA;
float x,y,xv,yv;
int score;
void setup(){
  size(400,400);
  smooth();

  smooth();

  fontA = loadFont("Dialog-48.vlw");
  textAlign(CENTER);
    textFont(fontA, 48);
}

void draw(){
  background(0);
  ellipse(x,y,50,50);
    x=x+xv;
    y=y+yv;
   yv=yv+.3;
  text(score,width/2,50);
  collision(); 
}

void mousePressed(){
  if(mouseX>x-25){
      if(mouseX<x+25){
        if(mouseY>y-25){
          if(mouseY<y+25){
    
  yv=-7;
  xv=-(mouseX-x)/5;
  score=score+1;
  }
        }
      }
  }
}

void collision(){
  if(x<25){
    xv=xv*-1;
    xv=xv*.9;
    x=25;
  }
  if(x>width-25){
    xv=xv*-1;
    xv=xv*.9;
    x=width-25;
  }
  if(y>width-25){
    y=width-25;
    yv=yv*-.8;
    score=0;
  }
  if(y<25){
    y=25;
    yv=yv*-.8;
  }
}  

