
//Code by Joyce Shin

int x=20;

void setup(){
  size (400, 280);
  background (255);
  smooth();
}

void draw(){
//Centre circle:
  if (mouseX > 185 && mouseX < 215 && mouseY > 125 && mouseY < 155){ //if mouseX is within the values 185 and 215 and mouseY is within the values 215 and 125, then do the following 
    frameRate(30);
    fill(255,45); //
    noStroke();
    rectMode(CENTER);
    rect(200,140,x,x);
    
    noFill();
    stroke(0,0,0,x+=5);
    ellipse(200,140,x,x);
    x+=8;
    if (x>750){x=0;}
}
  noStroke();
  fill (0);
  ellipse (200, 140, 30, 30);

//Outer circle 1:
  if (mouseX > 107.5 && mouseX < 132.5 && mouseY > 97.5 && mouseY < 122.5){
    frameRate(45);
    fill(255,6);
    noStroke();
    rectMode(CENTER);
    rect(120,110,x,x);
    noFill();
    stroke(219,150,35,x+=3);
    ellipse(120,110,x,x);
    x+=5;
    if (x>690){x=0;}
}
  noStroke();
  fill (0);
  ellipse (120, 110, 25, 25);

//Outer circle 2:
  if (mouseX > 157.5 && mouseX < 182.5 && mouseY > 47.5 && mouseY < 72.5){
    frameRate(30);
    fill(255,6);
    noStroke();
    rectMode(CENTER);
    rect(170,60,x,x);
    noFill();
    stroke(229,37,94,x+=6);
    ellipse(170,60,x,x);
    x+=9;
    if (x>248){x=0;}
}
  noStroke();
  fill (0);
  ellipse (170, 60, 25, 25);

//Outer circle 3:
  if (mouseX > 217.5 && mouseX < 242.5 && mouseY > 47.5 && mouseY < 72.5){
    frameRate(37);
    fill(255,14);
    noStroke();
    rectMode(CENTER);
    rect(230,60,x,x);
    noFill();
    stroke(166,28,65,x+=16);
    ellipse(230,60,x,x);
    x+=3;
    if (x>800){x=0;}
}
  noStroke();
  fill (0);
  ellipse (230, 60, 25, 25);
  
//Outer circle 4:
  if (mouseX > 257.5 && mouseX < 292.5 && mouseY > 97.5 && mouseY < 122.5){
    frameRate(40);
    fill(255,20);
    noStroke();
    rectMode(CENTER);
    rect(280,110,x,x);
    noFill();
    stroke(89,3,75,x+=3);
    ellipse(280,110,x,x);
    x+=5;
    if (x>690){x=0;}
}
  noStroke();
  fill (0);
  ellipse (280, 110, 25, 25);

//Outer circle 5:   
  if (mouseX > 267.5 && mouseX < 292.5 && mouseY > 162.5 && mouseY < 177.5){
    frameRate(45);
    fill(255,6);
    noStroke();
    rectMode(CENTER);
    rect(280,170,x,x);
    noFill();
    stroke(219,150,35,x+=3);
    ellipse(280,170,x,x);
    x+=5;
    if (x>690){x=0;}
}
  noStroke();
  fill (0);
  ellipse (280, 170, 25, 25);

//Outer circle 6:
  if (mouseX > 217.5 && mouseX < 242.5 && mouseY > 207.5 && mouseY < 232.5){
    frameRate(30);
    fill(255,6);
    noStroke();
    rectMode(CENTER);
    rect(230,220,x,x);
    noFill();
    stroke(229,37,94,x+=6);
    ellipse(230,220,x,x);
    x+=9;
    if (x>248){x=0;}
}
  noStroke();
  fill (0);
  ellipse (230, 220, 25, 25);

//Outer circle 7:
  if (mouseX > 157.5 && mouseX < 182.5 && mouseY > 207.5 && mouseY <232.5){
    frameRate(37);
    fill(255,14);
    noStroke();
    rectMode(CENTER);
    rect(170,220,x,x);
    noFill();
    stroke(166,28,65,x+=16);
    ellipse(170,220,x,x);
    x+=3;
    if (x>800){x=0;}
}
  noStroke();
  fill (0);
  ellipse (170, 220, 25, 25);
  
//Outer circle 8:   
  if (mouseX > 107.5 && mouseX < 132.5 && mouseY > 157.5 && mouseY < 182.5){
    frameRate(40);
    fill(255,20);
    noStroke();
    rectMode(CENTER);
    rect(120,170,x,x);
    noFill();
    stroke(89,3,75,x+=3);
    ellipse(120,170,x,x);
    x+=5;
    if (x>690){x=0;}
}
  noStroke();
  fill (0);
  ellipse (120, 170, 25, 25);
  
//Inner circle 1: 
  if (mouseX > 152.5 && mouseX < 167.5 && mouseY > 117.5 && mouseY < 132.5){
    frameRate(30);
    fill(255,20);
    noStroke();
    rectMode(CENTER);
    rect(160,125,x,x);
    noFill();
    stroke(219,150,35,x+=10);
    ellipse(160,125,x,x);
    x+=5;
    if (x>250){x=0;}
}
 
  fill (0);
  ellipse (160, 125, 15, 15);
  
//Inner circle 2: 
  if (mouseX > 177.5 && mouseX < 192.5 && mouseY > 92.5 && mouseY < 107.5){
    frameRate(33);
    fill(255,40);
    noStroke();
    rectMode(CENTER);
    rect(185,100,x,x);
    noFill();
    stroke(229,37,94,x+=13);
    ellipse(185,100,x,x);
    x+=12.5;
    if (x>350){x=0;}
}
  noStroke();
  fill (0);
  ellipse (185, 100, 15, 15);

//Inner circle 3: 
  if (mouseX > 207.5 && mouseX < 222.5 && mouseY > 92.5 && mouseY < 107.5){
    frameRate(33);
    fill(255,20);
    noStroke();
    rectMode(CENTER);
    rect(215,100,x,x);
    noFill();
    stroke(166,28,65,x+=14);
    ellipse(215,100,x,x);
    x+=2.5;
    if (x>312){x=0;}
}
  noStroke();
  fill (0);
  ellipse (215, 100, 15, 15);
  
//Inner circle 4:
  if (mouseX > 232.5 && mouseX < 247.5 && mouseY > 117.5 && mouseY < 132.5){
    frameRate(30);
    fill(255,20);
    noStroke();
    rectMode(CENTER);
    rect(240,125,x,x);
    noFill();
    stroke(89,3,75,x+=10);
    ellipse(240,125,x,x);
    x+=4;
    if (x>300){x=0;}
}
  noStroke();
  fill (0);
  ellipse (240, 125, 15, 15);

//Inner circle 5:   
  if (mouseX > 232.5 && mouseX < 247.5 && mouseY > 147.5 && mouseY < 162.5){
    frameRate(30);
    fill(255,20);
    noStroke();
    rectMode(CENTER);
    rect(240,155,x,x);
    noFill();
    stroke(219,150,35,x+=10);
    ellipse(240,155,x,x);
    x+=5;
    if (x>250){x=0;}
}
 noStroke();
  fill (0);
  ellipse (240, 155, 15, 15);

//Inner circle 6: 
  if (mouseX > 207.5 && mouseX < 222.5 && mouseY > 172.5 && mouseY < 187.5){
    frameRate(33);
    fill(255,40);
    noStroke();
    rectMode(CENTER);
    rect(215,180,x,x);
    noFill();
    stroke(229,37,94,x+=13);
    ellipse(215,180,x,x);
    x+=12.5;
    if (x>350){x=0;}
}
  noStroke();
  fill (0);
  ellipse (215, 180, 15, 15);
  
//Inner circle 7: 
  if (mouseX > 177.5 && mouseX < 192.5 && mouseY > 172.5 && mouseY < 187.5){
    frameRate(33);
    fill(255,20);
    noStroke();
    rectMode(CENTER);
    rect(185,180,x,x);
    noFill();
    stroke(166,28,65,x+=14);
    ellipse(185,180,x,x);
    x+=2.5;
    if (x>312){x=0;}
}
  noStroke();
  fill (0);
  ellipse (185, 180, 15, 15);
  
//Inner circle 8:   
  if (mouseX > 152.5 && mouseX < 167.5 && mouseY > 147.5 && mouseY < 162.5){
    frameRate(30);
    fill(255,20);
    noStroke();
    rectMode(CENTER);
    rect(160,155,x,x);
    noFill();
    stroke(89,3,75,x+=10);
    ellipse(160,155,x,x);
    x+=4;
    if (x>300){x=0;}
}
  noStroke();
  fill (0);
  ellipse (160, 155, 15, 15);
}
 
 

