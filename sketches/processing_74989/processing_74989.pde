
int l=10;
int x=10;
int counter = 1;
int c=100;

  void setup() {
  size(600, 498);
  
  noStroke();
  rect(0, 0, 600, 498);
  fill(242, 189, 83);
  
  noStroke();
  rect(25, 25, 550, 448);
  fill(255, 240, 152);
  
  noStroke();
  rect(60, 60, 480, 378);
    
}
  
 void draw(){
 
 noStroke();
  fill(250, 188, 18);
  rect(x, 30, l, l);
  fill(152, 58, 75);
  rect(x, 70, l, l);
  fill(247, 148, 132);
  rect(x, 110, l, l);
  fill(90, 112, 142);
  rect(x, 150, l, l);
  fill(0);
  rect(x, 190, l, l);
  
  stroke(0);
  fill(255);
  rect(575, 474, 20, 20);
    

  // change colors
  changeColor();
  cursor(ARROW);
 
  if (mousePressed && mouseX > 40 && mouseY > 90) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}
   
void changeColor() {
  if (counter==1) {
    stroke(250, 188, 18);
  }
  else if (counter==2) {
    stroke(152, 58, 75);
  }
  else if (counter==3) {
    stroke(247, 148, 132);
  }
  else if (counter==4) {
    stroke(90, 112, 142);
  }
  else if (counter==5) {
    stroke(0);
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
  else if (mouseY>468 && mouseX>570) {
    noStroke();
  fill(255, 240, 152);
  rect(60, 60, 480, 378);
    ;
  }
}



