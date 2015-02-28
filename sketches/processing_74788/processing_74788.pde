
int r = 255;
int g = 255;
int b = 255;

int s = 4;

void setup(){
 size(400, 400, P2D);
 smooth(); 
 background(200);
}

void draw(){
  noStroke();
  fill(255, 0, 0);
  rect(0, 110, 30, 30, 10);
  
  fill(255, 255, 0);
  rect(0, 140, 30, 30, 10);
  
  fill(255, 0, 255);
  rect(0, 170, 30, 30, 10);
  
  fill(0, 255, 0);
  rect(0, 200, 30, 30, 10);
  
  fill(0, 0, 255);
  rect(0, 230, 30, 30, 10);
  
  fill(0);
  rect(0, 260, 30, 30, 10);
  
  fill(255);
  rect(0, 290, 30, 30, 10);
  
  stroke(0);
  strokeWeight(1);
  fill(200);
  rect(0, 370, 30, 30, 10);
  
  fill(200);
  rect(370, 370, 30, 30, 10);
  strokeWeight(2);
  line(375, 375, 395, 395);
  line(375, 395, 395, 375);
  
  fill(0);
  ellipse(15, 15, 30, 30);
  ellipse(15, 55, 20, 20);
  ellipse(15, 85, 10, 10);
    
  if(mouseX < 30 && mouseX > 0 && mouseY < 140 && mouseY > 110 && mousePressed){
    r = 255;
    g = 0;
    b = 0;
  }
   
  if(mouseX < 30 && mouseX > 0 && mouseY < 170 && mouseY > 140 && mousePressed){
    r = 255;
    g = 255;
    b = 0;
  }
   
  if(mouseX < 30 && mouseX > 0 && mouseY < 200 && mouseY > 170 && mousePressed){
    r = 255;
    g = 0;
    b = 255;
  }
   
  if(mouseX < 30 && mouseX > 0 && mouseY < 230 && mouseY > 200 && mousePressed){
    r = 0;
    g = 255;
    b = 0;
  }
   
  if(mouseX < 30 && mouseX > 0 && mouseY < 260 && mouseY > 230 && mousePressed){
    r = 0;
    g = 0;
    b = 255;
  } 
  if(mouseX < 30 && mouseX > 0 && mouseY < 290 && mouseY > 260 && mousePressed){
    r = 0;
    g = 0;
    b = 0;
  }
    if(mouseX < 30 && mouseX > 0 && mouseY < 320 && mouseY > 290 && mousePressed){
    r = 255;
    g = 255;
    b = 255;
  }
    if(mouseX < 30 && mouseX > 0 && mouseY < 400 && mouseY > 370 && mousePressed){
    r = 200;
    g = 200;
    b = 200;
  }
     if(mouseX < 400 && mouseX > 370 && mouseY < 400 && mouseY > 370 && mousePressed){
    background(200);
  }
  
  
  if(mouseX < 30 && mouseX > 0 && mouseY < 30 && mouseY > 0 && mousePressed){
   s = 15;
  }
  if(mouseX < 30 && mouseX > 0 && mouseY < 65 && mouseY > 45 && mousePressed){
  s = 9;
  }
  if(mouseX < 30 && mouseX > 0 && mouseY < 90 && mouseY > 80 && mousePressed){
  s = 4;
  }
  
 
  if (mousePressed && pmouseX > 30){

  stroke(r,g,b);
  strokeWeight(s);
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
}
