
float x = 0;
float y = 490;
float speed = 1;

void setup() {
  size(500,500);
  background(255);
  f = createFont("Bank Gothic",16,true);
  textFont(f,20);
  fill(0);
  
 }
 
void draw() {
  text("Click along the top of the screen to play!",0,490);
  noStroke();
  if(mousePressed) {
  if(mouseX > 0 && mouseY > 0 && mouseX < 50 && mouseY < 51) {
  fill(250,0,0);
  rect(0,0,50,50);
  }else{
  }
  if(mouseX > 55 && mouseY > 0 && mouseX < 105 && mouseY < 51) {
  fill(0,250,0);
  rect(55,0,50,50);
  }else{
  }
  if(mouseX > 110 && mouseY > 0 && mouseX < 160 && mouseY <51) {
  fill(0,0,250);
  rect(110,0,50,50);
  } else {
  }
  if(mouseX > 165 && mouseY > 0 && mouseX < 215 && mouseY <51) {
  fill(0,250,250);
  rect(165,0,50,50);
  } else {
  }
  if(mouseX > 220 && mouseY > 0 && mouseX < 270 && mouseY <51) {
  fill(250,0,250);
  rect(220,0,50,50);
  } else {
  }
  if(mouseX > 275 && mouseY > 0 && mouseX < 325 && mouseY <51) {
  fill(250,250,0);
  rect(275,0,50,50);
  } else {
  }
  if(mouseX > 330 && mouseY > 0 && mouseX < 380 && mouseY <51) {
  fill(0);
  rect(330,0,50,50);
  } else {
  }
  if(mouseX > 385 && mouseY > 0 && mouseX < 435 && mouseY <51) {
  stroke(250,0,0);
  line(385,0,435,50);
  line(385,50,435,0);
  noStroke();
  fill(255);
  } else {
  }
  ellipse(mouseX,mouseY,15,15);
  } else {
  }
  if(keyPressed && key == ' ') {
      background(255);
  } else {
  }
}
