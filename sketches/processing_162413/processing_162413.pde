
int xpos = 100;
int ypos = 50;
int bsize = 30;
PFont font;

void setup(){
  size(800,600);
  stroke(0,102);
  background(222,222,222);
  smooth();
  
  
  font = loadFont("Helvetica-Bold-25.vlw");
  textFont(font);

  noStroke();
  fill(255);
  rect(190,10,600,580);
  
  stroke(170);
  strokeWeight(6);
  strokeJoin(ROUND);
  fill(170);
  rect(25,10,140,330);
  
  
    
   
 
  fill(255,0,0);
  stroke(255);
  strokeWeight(4);
  strokeJoin(ROUND);
  rect(xpos-70,ypos,bsize,bsize);
  fill(255,0,107);
  stroke(255);
  strokeWeight(4);
  strokeJoin(ROUND);
  rect(xpos-20,ypos,bsize,bsize);
  fill(255,0,179);
  stroke(255);
  strokeWeight(4);
  strokeJoin(ROUND);
  rect(xpos+30,ypos,bsize,bsize);
  fill(224,0,225);
  stroke(255);
  strokeWeight(4);
  strokeJoin(ROUND);
  rect(xpos+30,ypos+50,bsize,bsize);
  fill(169,0,255);
  stroke(255);
  strokeWeight(4);
  strokeJoin(ROUND);
  rect(xpos-20,ypos+50,bsize,bsize);
  fill(109,0,255);
  stroke(255);
  strokeWeight(4);
  strokeJoin(ROUND);
  rect(xpos-70,ypos+50,bsize,bsize);
  fill(67,0,255);
  stroke(255);
  strokeWeight(4);
  strokeJoin(ROUND);
  rect(xpos-70,ypos+100,bsize,bsize);
  fill(0,0,255);
  stroke(255);
  strokeWeight(4);
  strokeJoin(ROUND);
  rect(xpos-20,ypos+100,bsize,bsize);
  fill(0,108,255);
  stroke(255);
  strokeWeight(4);
  strokeJoin(ROUND);
  rect(xpos+30,ypos+100,bsize,bsize);
  fill(0,197,255);
  stroke(255);
  strokeWeight(4);
  strokeJoin(ROUND);
  rect(xpos+30,ypos+150,bsize,bsize);
  fill(0,255,253);
  stroke(255);
  strokeWeight(4);
  strokeJoin(ROUND);
  rect(xpos-20,ypos+150,bsize,bsize);
  fill(0,255,210);
  stroke(255);
  strokeWeight(4);
  strokeJoin(ROUND);
  rect(xpos-70,ypos+150,bsize,bsize);
  fill(0,255,151);
  stroke(255);
  strokeWeight(4);
  strokeJoin(ROUND);
  rect(xpos-70,ypos+200,bsize,bsize);
  fill(0,255,91);
  stroke(255);
  strokeWeight(4);
  strokeJoin(ROUND);
  rect(xpos-20,ypos+200,bsize,bsize);
  fill(88,255,0);
  stroke(255);
  strokeWeight(4);
  strokeJoin(ROUND);
  rect(xpos+30,ypos+200,bsize,bsize);
  fill(148,255,0);
  stroke(255);
  strokeWeight(4);
  strokeJoin(ROUND);
  rect(xpos+30,ypos+250,bsize,bsize);
  fill(220,255,0);
  stroke(255);
  strokeWeight(4);
  strokeJoin(ROUND);
  rect(xpos-20,ypos+250,bsize,bsize);
  fill(255,243,0);
  stroke(255);
  strokeWeight(4);
  strokeJoin(ROUND);
  rect(xpos-70,ypos+250,bsize,bsize);
  
 
  fill(255);
  stroke(255,243,0);
  rect(55,430,80,80);
  
}

void draw(){


textSize(25);
text("Color",65,35);
  
if(mousePressed){
  
  if(mouseX > 220 && mouseX < 820 && mouseY > 10 && mouseY < 580){
  float weight = dist(mouseX,mouseY,pmouseX,pmouseY);
  strokeWeight(weight);
  line(pmouseX,pmouseY,mouseX,mouseY);
  }
  
 if(mouseX > 30 && mouseX < 60 && mouseY > 50 && mouseY < 100){
   stroke(255,0,0);
   }
 if(mouseX > 80 && mouseX < 110 && mouseY > 50 && mouseY < 100){
   stroke(255,0,107);
   }
 if(mouseX > 130 && mouseX < 160 && mouseY > 50 && mouseY < 100){
   stroke(255,0,179);
   }
 if(mouseX > 130 && mouseX < 160 && mouseY > 100 && mouseY < 150){
   stroke(224,0,225);
   } 
 if(mouseX > 80 && mouseX < 110  && mouseY > 100 && mouseY < 150){
   stroke(169,0,255);
   } 
  if(mouseX > 30 && mouseX < 60  && mouseY > 100 && mouseY < 150){
   stroke(109,0,255);
   }
  if(mouseX > 30 && mouseX < 60  && mouseY > 150 && mouseY < 200){
   stroke(67,0,255);
   }
  if(mouseX > 80 && mouseX < 110  && mouseY > 150 && mouseY < 200){
   stroke(0,0,255);
   }
  if(mouseX > 130 && mouseX < 160  && mouseY > 150 && mouseY < 200){
   stroke(0,108,255);
   }
  if(mouseX > 130 && mouseX < 160  && mouseY > 200 && mouseY < 250){
   stroke(0,197,255);
   }
  if(mouseX > 80 && mouseX < 110  && mouseY > 200 && mouseY < 250){
   stroke(0,255,253);
   }
  if(mouseX > 30 && mouseX < 60  && mouseY > 200 && mouseY < 250){
   stroke(0,255,210);
   }
  if(mouseX > 30 && mouseX < 60  && mouseY > 250 && mouseY < 300){
   stroke(0,255,151);
   }
  if(mouseX > 80 && mouseX < 110  && mouseY > 250 && mouseY < 300){
   stroke(0,255,91);
   }
  if(mouseX > 130 && mouseX < 160  && mouseY > 250 && mouseY < 300){
   stroke(88,255,0);
   }
  if(mouseX > 130 && mouseX < 160  && mouseY > 300 && mouseY < 350){
   stroke(148,255,0);
   }
  if(mouseX > 80 && mouseX < 110  && mouseY > 300 && mouseY < 350){
   stroke(220,255,0);
   }
  if(mouseX > 30 && mouseX < 60  && mouseY > 300 && mouseY < 350){
   stroke(255,243,0);
   }
   
  
  //clear
  if(mouseX > 55 && mouseX <135 && mouseY >430 && mouseY <510){
    noStroke();
    fill(255);
    rect(190,10,600,580);
  
  }
 
}
}


