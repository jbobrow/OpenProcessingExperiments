
float posX,posY,posY1;

void setup(){
size(800,400);
}



void draw(){
prepareWindow();
whileLoopPattern();
forLoopPattern();
}

void prepareWindow(){
fill(0);
rect(0,0,400,400);
fill(255);
rect(400,0,400,400);
}

void whileLoopPattern(){
 int posX=0;
 int posY=0;
 while(posX<width/2) {
   fill(255,0,0);
   rect(posX,0,10,10);
   rect(posX,height-10,10,10);
   posX= posX+10;
 } 
 while(posY<height) {
   fill(255,0,0);
   rect(0,posY,10,10);
   rect(width/2,posY,10,10);
   posY= posY+10;
 } 
}

void forLoopPattern(){
  fill(0,0,255);
  int posY=0;
  for(int posX=width/2; posX<width; posX=posX+10){
    posY=posY+10;
    ellipse(posX,posY,10,10);
     ellipse(width-posX+width/2,posY,10,10);
  }

  
}




