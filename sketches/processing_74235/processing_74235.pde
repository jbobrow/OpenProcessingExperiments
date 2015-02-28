
int d=30;
int x=25;
int counter = 1;
int a=100;

void setup() {
  size(500, 500);
  background(255);
}

 
 
void draw() {
 
  stroke(1);
  strokeWeight(1);
  
  //Pennelli
  fill(0);
  ellipse(x, 30, d, d);
  fill(150, 150, 150);
  ellipse(x, 70, d, d);
  fill(255, 0, 0);
  ellipse(x, 110, d, d);
  fill(0, 0, 255);
  ellipse(x, 150, d, d);
  fill(0, 255, 0);
  ellipse(x, 190, d, d);
  
  // Reset
  fill(255);
  ellipse(x, height/1.5, d, d);

 // selezione
  fill(255);
  strokeWeight(2);
  stroke(0);
  changeSelector();
 
 
  // disegno
  changeColor();
  cursor(ARROW);
  strokeWeight(20);
  if (mousePressed && mouseButton==LEFT && mouseX> 70 && mouseY> 5) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}
 
 
 
 
 
 
void changeColor() {
  if (counter==1) {
    stroke(0);
  }
  else if (counter==2) {
    stroke(150, 150, 150);
  }
  else if (counter==3) {
    stroke(220, 0, 0);
  }
  else if (counter==4) {
    stroke(0, 0, 220);
  }
  else if (counter==5) {
    stroke(0, 210, 0);
  }
  else if (counter==6) {
    stroke(255);
  }
}
void changeSelector() {
}
 
void mouseClicked() {
  if (mouseY>10 && mouseY<50 && mouseX<a) {
    counter=1;
  }
  else if (mouseY>60 && mouseY<90 && mouseX<a) {
    counter=2;
  }
  else if (mouseY>100 && mouseY<130 && mouseX<a) {
    counter=3;
  }
  else if (mouseY>140 && mouseY<170 && mouseX<a) {
    counter=4;
  }
  else if (mouseY>180 && mouseY<210 && mouseX<a) {
    counter=5;
  }
  else if (mouseY>220 && mouseY<270 && mouseX<a) {
    counter=6;
  }
  else if (mouseY>height/1.7 && mouseY<height/1.5 + 100 && mouseX<a) {
    fill(255);
    noStroke();
    rect(0,0, 500, 500);
    ;
  }
}
