
int l=20;
int x=20;
int counter = 1;
int c=100;
 
void setup() {
  size(400, 400);
  background(255);
  
  rect(0, 0, width, height);
  noStroke();
}
 
  
void draw(){

   
  // Pencil
  
 strokeWeight(1);
  fill(0);
  rect(x, 30, l, l);
  fill(250, 0, 0);
  rect(x, 70, l, l);
  fill(255, 243, 0);
  rect(x, 110, l, l);
  fill(0, 255, 0);
  rect(x, 150, l, l);
  fill(0, 0, 255);
  rect(x, 190, l, l);
   
  // canc
   strokeWeight(2);
  fill(255);
  ellipse(x + 15, 350, l,l);
 
 // select
  fill(255);
  strokeWeight(2);
  stroke(0);
  changeSelector();
  
  
  // change colors
  changeColor();
  cursor(ARROW);

  if (mousePressed && mouseButton==LEFT && mouseX> 40 && mouseY > 90) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}
  
void changeColor() {
  if (counter==1) {
    stroke(0);
  }
  else if (counter==2) {
    stroke(250, 0, 0);
  }
  else if (counter==3) {
    stroke(255, 243, 0);
  }
  else if (counter==4) {
    stroke(0, 255, 0);
  }
  else if (counter==5) {
    stroke(0, 0, 255);
  }
}
void changeSelector() {
}
  
void mouseClicked() {
  if (mouseY>10 && mouseY<50 && mouseX<c) {
    counter=1;
  }
  else if (mouseY>60 && mouseY<90 && mouseX<c) {
    counter=2;
  }
  else if (mouseY>100 && mouseY<130 && mouseX<c) {
    counter=3;
  }
  else if (mouseY>140 && mouseY<170 && mouseX<c) {
    counter=4;
  }
  else if (mouseY>180 && mouseY<210 && mouseX<c) {
    counter=5;
  }
  else if (mouseY>height/1.7 && mouseY<height/1.5 + 100 && mouseX<c) {
    fill(255);
    noStroke();
    rect(0,0, 400, 400);
    ;
  }
}
