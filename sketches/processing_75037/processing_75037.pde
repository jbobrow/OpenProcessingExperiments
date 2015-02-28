
int r=35;
int space=5;
int d=20;
int x,y,xl,yl,xline,yline,tool,col=0;
void setup() {
  size(500, 500);
  background(150);
}
void draw() {
  //icone strumenti
  strokeWeight(1);
  stroke(0);
  fill(255);
  rect(20, 20, r, r);
  rect(20+r+space, 20, r, r);
  rect(20, 20+r+space, r, r);
  rect(20+r+space, 20+r+space, r, r);
  
  // palette colori
  fill(255,255,0);
  rect(width-20-r*2-space*2, 20, r, r);
  fill(0,240,255);
  rect(width-20-r-space, 20, r, r);
  fill(255,0,255);
  rect(width-20-r*2-space*2, 20+r+space, r, r);
  fill(0);
  rect(width-20-r-space, 20+r+space, r, r);
  
  //disegni icone
  fill(255);
  rect(20+r+space, 20+r+space, r, r);
  line(30,30,45,45);
  rect(30,30+r+space,15,15);
  fill(0);
  ellipse(38+r+space,38,15,15);
  text("canc",r*2-space,r*2+space*2);
 
 if(mousePressed && mouseX>20 && mouseX<r+20 && mouseY>20 && mouseY<r+20){
   tool=0;
 }
 if(mousePressed && mouseX>20+r+space && mouseX<space+r*2+20 && mouseY>20 && mouseY<r+20){
   tool=1;
 }
 if(mousePressed && mouseX>20 && mouseX<r+20 && mouseY>20+r+space && mouseY<r*2+space+20){
   tool=2;
 }
 if(mousePressed && mouseX>20+r+space && mouseX<space+r*2+20 && mouseY>20+r+space && mouseY<r*2+space+20){
   background(150);
 }
 
 //selezione colori
 if(mousePressed && mouseX>width-20-r*2-space*2 && mouseX<width-20-r-space && mouseY>20 && mouseY<r+20){
   col=1;
 }
 if(mousePressed && mouseX>width-20-r-space && mouseX<width-20 && mouseY>20 && mouseY<r+20){
   col=2;
 }
 if(mousePressed && mouseX>width-20-r*2-space*2 && mouseX<width-20-r-space && mouseY>space+r+20 && mouseY<space*2+r*2+20){
   col=3;
 }
 if(mousePressed && mouseX>width-20-r-space && mouseX<width-20 && mouseY>space+r+20 && mouseY<space*2+r*2+20){
   col=0;
 }
  //colori
  if(col==0 &&mousePressed; ){
    stroke(0);
    fill(0);
  }
  if(col==1 &&mousePressed; ){
    stroke(255,255,0);
    fill(255,255,0);
  }
  if(col==2 &&mousePressed; ){
    stroke(0,255,255);
    fill(0,255,255);
  }
  if(col==3 &&mousePressed; ){
    stroke(255,0,255);
    fill(255,0,255);
  }
  
  //strumenti
  if(tool==0 && mousePressed){
    line(mouseX,mouseY,pmouseX,pmouseY);
  }
  if(tool==1 &&mousePressed;){
    strokeWeight(10);
    line(mouseX,mouseY,pmouseX,pmouseY);
       
  }
  if(tool==2 && mousePressed){
    strokeWeight(30);
    fill(150);
    stroke(150);
    line(mouseX,mouseY,pmouseX,pmouseY);  
  } 
}
