
///Eunsil Choi 09/27/2013
int abc = 125;

void setup() {
  size(500,500);
  
}

void draw() {
  background(255);
 
////////////////////////////////////////////////----------triangle
  fill(255,200,100);
  triangle(500,0,500, abc ,375,abc);
  triangle(height*.5,0,height*.5,abc,375,abc);
  triangle(0,500,abc,500,0,375);
  triangle(height*.5,height*.5,abc,height*.5,height*.5,375);
////////////////////////////////////////////////----------rectangle  
  fill(0);
  rect(0,0,height*.5,width*.5,50);
  rect(height*.5,width*.5,250,250,50);
////////////////////////////////////////////////----------move {top-left}
 if ((mouseX < width*.75) && (mouseY < height*.75)) {
    fill (120, 90, 153);
    rect(50,50,150,150,80);
    rect(300,300,150,150,80);}
    noFill();
 if ((mouseX < width*.5) && (mouseY < height*.5)) {
    fill (130, 150, 200);
    noStroke();
    rect(0,0,height*.5,width*.5);
    rect(250,250,500,500);}
 if ((mouseX <= abc) && (mouseY >= 350)) {
   fill(100,150,160);
   ellipse (400,400,30,30);
   ellipse (100,100,30,30);
   fill(220,210,190);   
   ellipse (250,250,100,100);}
 if ((mouseX > 375) && (mouseY < abc)) {
   fill(24,48,89);
   triangle (500,0,500, abc,375,abc);}
 if ((375 > mouseX) && (mouseX < 250) && (mouseY < abc)) {
   fill(12,24,36);
   triangle(height*.5,0,height*.5,abc,375,abc);}
   
 if ((mouseX > width*.5) && (mouseY < height*.5)) {  
 if (mousePressed && (mouseButton == LEFT)) {fill(50,200,120);}
  else if (mousePressed && (mouseButton == RIGHT)) {fill(255,15,120);}
  else {fill(255,200,120);}
  noStroke();
  ellipse(mouseX,mouseY,80,80);}
 
 if ((mouseX >= width*.5) && (mouseY >= height*.5)) {  
  if (mousePressed && (mouseButton == RIGHT)) {fill(50,130,120);}
  else {fill(100,200,120);}
  noStroke();
  ellipse(mouseX,mouseY,80,80);}

 if ((mouseX < width*.5) && (mouseY < height*.5)) {  
  if (mousePressed && (mouseButton == LEFT)) {fill(255,180,90);}
  else {fill(100,150,100);}
  noStroke();
  ellipse(mouseX,mouseY,80,80);}
 
}
