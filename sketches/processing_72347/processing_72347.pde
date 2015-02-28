
int xPos;
int dir;
int myNum;

void setup(){
  xPos = 0;
  dir = 1;
  myNum = 0;
size(800,800);
background(0,204,252);
fill(255,0,0);
textSize(20);
for(int i = 0; i < 100; i++){
   text("Fuck",0,i*20);
    text("Fuck",50,i*20);
    text("Fuck",100,i*20);
    text("Fuck",150,i*20);
    text("Fuck",200,i*20);
    text("Fuck",250,i*20);
    text("Fuck",300,i*20);
    text("Fuck",350,i*20);
    text("Fuck",400,i*20);
    text("Fuck",450,i*20);
    text("Fuck",500,i*20);
    text("Fuck",550,i*20);
    text("Fuck",600,i*20);
    text("Fuck",650,i*20);
    text("Fuck",700,i*20);
    text("Fuck",750,i*20);
    text("Fuck",800,i*20);
    noFill();{
  rect(0,0,i*10,i*10);
    }
    }
}

void draw(){
  if(mouseX > 400){
    fill(255,62,197);
  } else
    fill(167,62,255);
  stroke(myNum/2);
  line(myNum,0,myNum,height);
    ellipse(xPos,0,20,20);
  xPos += dir;
  if(xPos > width){
    dir = -1;
  }
  if(xPos < 0){
    dir = 1;
  }
    ellipse(xPos,50,20,20);
  if(xPos > width){
    dir = -1;
  }
  if(xPos < 0){
    dir = 1;
  }
   ellipse(xPos,100,20,20);
  if(xPos > width){
    dir = -1;
  }
  if(xPos < 0){
    dir = 1;
  }
   ellipse(xPos,150,20,20);
  if(xPos > width){
    dir = -1;
  }
  if(xPos < 0){
    dir = 1;
  } ellipse(xPos,200,20,20);
  if(xPos > width){
    dir = -1;
  }
  if(xPos < 0){
    dir = 1;
  }
   ellipse(xPos,250,20,20);
  if(xPos > width){
    dir = -1;
  }
  if(xPos < 0){
    dir = 1;
  }
  ellipse(xPos,300,20,20);
  if(xPos > width){
    dir = -1;
  }
  if(xPos < 0){
    dir = 1;
  }
   ellipse(xPos,350,20,20);
  if(xPos > width){
    dir = -1;
  }
  if(xPos < 0){
    dir = 1;
  }
   ellipse(xPos,400,20,20);
  if(xPos > width){
    dir = -1;
  }
  if(xPos < 0){
    dir = 1;
  }
     ellipse(xPos,450,20,20);
  if(xPos > width){
    dir = -1;
  }
  if(xPos < 0){
    dir = 1;
  }
     ellipse(xPos,500,20,20);
  if(xPos > width){
    dir = -1;
  }
  if(xPos < 0){
    dir = 1;
  }
     ellipse(xPos,550,20,20);
  if(xPos > width){
    dir = -1;
  }
  if(xPos < 0){
    dir = 1;
  }
     ellipse(xPos,600,20,20);
  if(xPos > width){
    dir = -1;
  }
  if(xPos < 0){
    dir = 1;
  }
     ellipse(xPos,650,20,20);
  if(xPos > width){
    dir = -1;
  }
  if(xPos < 0){
    dir = 1;
  }
     ellipse(xPos,700,20,20);
  if(xPos > width){
    dir = -1;
  }
  if(xPos < 0){
    dir = 1;
  }
     ellipse(xPos,750,20,20);
  if(xPos > width){
    dir = -1;
  }
  if(xPos < 0){
    dir = 1;
  }
     ellipse(xPos,800,20,20);
  if(xPos > width){
    dir = -1;
  }
  if(xPos < 0){
    dir = 1;
  }
}
