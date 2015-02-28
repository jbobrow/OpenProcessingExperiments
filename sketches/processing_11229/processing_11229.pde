
color c = color(255);
boolean selected;

float movingX=0;

void setup(){
  size(800,600);
  noStroke();
  rectMode(CORNER);
  ellipseMode(CENTER);
}

void draw(){
  background(c);
  fill(0,255,0);
  selected = false;

// performing all my tests
  circleBtn(movingX,300, 150);
  circleBtn(400,100, 50);
  rectBtn(50,200,50,50);
  rectBtn(350,400,20,90);

// changing background color
  if(selected == true){
    c = color(255,0,0);
  }
  else{
   c = color(255); 
  }
  movingX = movingX +5;
}

void circleBtn(float xpos, float ypos, float d){
  // if mouse is inside circle, change selected to true
  if(dist(xpos, ypos, mouseX, mouseY) < d/2){
    selected = true;
  }
  ellipse(xpos, ypos, d, d);
}

void rectBtn(float xpos, float ypos, float w, float h){
 if(mouseX>xpos && mouseY>ypos && mouseX<xpos+w && mouseY<ypos+h){
  selected = true;
 }
 rect(xpos, ypos, w, h);
}

