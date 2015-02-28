
void setup() {
  smooth();
  size(500, 500);
  fill(150, 150, 150);
  rect(0, 0, width, height);
  noStroke();
}
int counter = 1;


void draw() {

  stroke(1);
  strokeWeight(1);

  fill(0); 
  rect(10, 10, 40, 40);
  fill(150, 150, 150);
  rect(60, 10, 40, 40);
  fill(255, 0, 0);
  rect(110, 10, 40, 40);
  fill(0, 0, 255);
  rect(160, 10, 40, 40);
  fill(0, 255, 0);
  rect(210, 10, 40, 40);
  fill(255);
  rect(260, 10, 40, 40);
  fill(220, 255, 255);
  rect(450, 10, 40, 40);
  fill(0);
  strokeWeight(2);
  line(455, 15, 485, 45);
  line(455, 45, 485, 15);




  // selector
  fill(255);
  strokeWeight(2);
  stroke(0);
  changeSelector();


  // draw
  changeColor();
  cursor(ARROW);
  strokeWeight(12);
  if (mousePressed && mouseButton==LEFT && mouseX> 40 && mouseY > 90) {
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
  if (mouseX>10&& mouseX<50 && mouseY<40) {
    counter=1;
  } 
  else if (mouseX>60 && mouseX<100 && mouseY<40) {
    counter=2;
  } 
  else if (mouseX>110 && mouseX<150 && mouseY<40) {
    counter=3;
  } 
  else if (mouseX>160 & mouseX<200 && mouseY<40) {
    counter=4;
  } 
  else if (mouseX>210 && mouseX<250 && mouseY<40) {
    counter=5;
  } 
  else if (mouseX>260 && mouseX<300 && mouseY<40) {
    counter=6;
  } 
  else if (mouseX>450 && mouseX<490 && mouseY<40) {
    fill(150, 150, 150);
    noStroke();
    rect(5, 60, 500, 500);
    ;
  }
}


