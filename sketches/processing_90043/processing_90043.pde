
//Lauren Lee
//Creative Computing
//HW 3 Table Division
//2/17/13

//Table
void setup(){
  size(500, 500);
}

//Dividers
void draw(){
  background(255);
  stroke(255);
  strokeWeight(8);

 
  //Bottom Left
 fill(162,255,225);
 rect(0,250,250,250);
 if((mouseX>0) && (mouseX<220) && (mouseY>260) && (mouseY<500)) {
   noStroke();
   fill(203,255,238);
   rect(5,255,60,243);
   rect(125,255,60,243);
   
  fill(0,255,172);
  ellipse(mouseX, mouseY, 70,70);
  stroke(255,255,255,mouseX+50);
  strokeWeight(3);
  noFill();
  ellipse(mouseX, mouseY, mouseX, mouseX);
  ellipse(mouseX, mouseY, mouseX-20, mouseX-20);
  ellipse(mouseX, mouseY, mouseX-30, mouseX-30);
  ellipse(mouseX, mouseY, mouseX-45, mouseX-45);
  ellipse(mouseX, mouseY, mouseX-80, mouseX-80);
   
 }
 
 //Top Left
 fill(244,255,162);
 stroke(255);
 strokeWeight(8);
 rect(0,0,250,250);
 noStroke();
 if((mouseX>0) && (mouseX<220) && (mouseY>0) && (mouseY<220)) {
   fill(255,255,255,60);
   rect(20,20,210,210);
   rect(50,50,150,150);
   rect(70,70,110,110);
   fill(mouseX, mouseX, mouseY);
   ellipse(mouseX, mouseY,70,70);
   fill(mouseY, mouseY, mouseX,200);
   ellipse(mouseX, mouseY, 50,50);
   fill(mouseX, mouseX, mouseY,120);
   ellipse(mouseX, mouseY, 30,30);
   fill(mouseY, mouseY, mouseX,100);
   ellipse(mouseX, mouseY, 10,10);
 }
 
 //Top Right
 stroke(255);
 strokeWeight(8);
 fill(162,234,255);
 rect(250,0,250,250);
 if((mouseX>270) && (mouseX<500) && (mouseY>0) && (mouseY<260)) {
   fill(mouseX, mouseX, mouseY,80);
   rect(250,0,250,250);
   noStroke();
   fill(255);
   ellipse(mouseX,mouseY,70,70);
 }
 
//Bottom right
stroke(255);
strokeWeight(8);
fill(219,248,255);
rect(250,250,250,250);
if((mouseX>275) && (mouseX<500) && (mouseY>275) && (mouseY<500)) {
  fill(255,255,255,80);
rect(250,250,250,250);
  strokeWeight(3);
  line(mouseX, mouseY, 250,250);
  line(mouseX, mouseY, 250,500);
  line(mouseX, mouseY, 250,375);
  line(mouseX, mouseY, 375, 250);
  line(mouseX, mouseY, 375, 500);
  line(mouseX, mouseY, 500, 250);
  line(mouseX, mouseY, 500,500);
  line(mouseX, mouseY, 500, 375);
  
  fill(36,213,255);
  noStroke();
  ellipse(mouseX, mouseY, 70, 70);
  
}

//Button
  if(mousePressed==true) {
   noStroke();
    fill(255,255,255,100);
    ellipse(250,250,500,500);
  }
}


