
float r;
float g;
float b;
float a;
 
/*float x = 100;
float y = 100;*/
 
 
void setup() {
  size(500,500);
  background(0);
}
 
void draw() {
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  //fill(255,0,0);
  
  
if (mouseX < width/3){
  background(100,200,250);
}else if (mouseX < 2*width/3){
  background(200,100,80);
}else{
  background(40,200,50);
}

rect(mouseX,mouseY,50,50);
 
ellipseMode(CENTER);
rectMode(CENTER);
 
 
//head
rect(mouseX,mouseY-50,65,65);
 
//mouth
 
    if (mousePressed) {
  ellipse(mouseX,mouseY,100,100);
}else{
  rect(mouseX,mouseY,100,100);
}
  //rect(mouseX,mouseY,100,100);
  fill(0);
 
  rect(mouseX,mouseY,70,70);
 
//eyes
  smooth();
  fill(0,200,255);
  ellipse(mouseX-20,mouseY-70,20,20);
  ellipse(mouseX-15,mouseY-70,5,5); 
   
  ellipse(mouseX+15,mouseY-70,20,20);
  ellipse(mouseX+20,mouseY-70,5,5);
   
//teeth
  fill(225,255,mouseY);
  triangle(mouseX-35,mouseY-35,mouseX-25,mouseY+35,mouseX-15,mouseY-35);
  triangle(mouseX-15,mouseY-35,mouseX-5,mouseY+35,mouseX+5,mouseY-35);
  triangle(mouseX+5,mouseY-35,mouseX+15,mouseY+35,mouseX+25,mouseY-35);
  triangle(mouseX+25,mouseY-35,mouseX+35,mouseY+35,mouseX+35,mouseY-35);
 
//legs
fill(150,mouseX,mouseY,255);
  rect(mouseX-15,mouseY+65,10,30);
  rect(mouseX+15,mouseY+65,10,30);
 
}

