
int cSize;
color cColor;
int xPos;
int yPos;

void setup(){
 size(500,500);
 background(0); 
 fill(255,255,255,0);
 stroke(255);
 strokeWeight(3);
 xPos=width/2;
 yPos=height/2-60;
}

void draw(){
 if(mousePressed){
   if(mouseButton==LEFT){
   drawCircle();
   }else{
    drawSmallCircles(); 
   }
  }
  
  if(keyPressed){
   if(key==127){
     background(0);
   }
  }
}

void drawCircle(){
 cSize=mouseX; 
 cColor=color(mouseY/2, 0, mouseY/4);
 stroke(cColor);
 ellipse(width/2, height/2, cSize, cSize); 
}

void drawSmallCircles(){
 cSize=mouseX; 
 cColor=color(mouseY/2, 0, mouseY/4);
 stroke(cColor);
  float winkel = 2*PI/8;
    for(int i=0; i<8; i++){
     float x= cos(i*winkel)*cSize*1.5+250;
     float y = sin(i*winkel)*cSize*1.5+250;
     ellipse(x, y, cSize, cSize);
    } 
}
