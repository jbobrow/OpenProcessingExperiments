
int xPos=0;
int yPos=0;

void setup(){
  size(400,400);
  smooth();
  background(94,185,240);
  noStroke();
}


void draw(){
  yPos=mouseY;
  if(yPos<10){
    rectMode(CENTER);
    rect(200,200,400,400);
    fill(1,0,95);
  }
  else if(yPos<20){
    rectMode(CENTER);
    rect(200,200,350,350);
    fill(2,0,137);
  }
   else if(yPos<30){
    rectMode(CENTER);
    rect(200,200,300,300);
    fill(3,2,165);
  }
   else if(yPos<40){
    rectMode(CENTER);
    rect(200,200,250,250);
    fill(4,2,211);
  }
   else if(yPos<50){
    rectMode(CENTER);
    rect(200,200,200,200);
    fill(3,0,255);
  }
   else if(yPos<60){
    rectMode(CENTER);
    rect(200,200,150,150);
    fill(57,97,247);
  }
   else if(yPos<70){
    rectMode(CENTER);
    rect(200,200,100,100);
    fill(86,161,250);
  
  
  }
}
