
//Written by Ron Shvartsman and Nate French

PFont font;

void setup() {
  
  size(600, 400);
  background(0);
  smooth();
  font = loadFont("ArialNarrow-24.vlw");
  
}

void draw() {
  
  stroke(255);
  strokeWeight(10);
  line(width/2, 0, width/2, height);
  leftSide160();
  rightSide160();
  caption();
  
}

void rightSide160() {
  noStroke();
  if (mouseX>width/2) {

    line(width/2, 0, width/2, height);
    fill(255, 0, 0);
    ellipse(width/1.35, height/2, 100, 100); 
    textFont(font, 24); 
    text("Prediction = Right Side of Room", 320, 50);
    
  }
  else {

    fill(0);
    rect(width/2+8,25,299,50);
    fill(255);
    ellipse(width/1.35, height/2, 100, 100);
    fill(0);
    stroke(255);
    strokeWeight(10);
    line(width/2, 0, width/2, height);
    
  }
}

void leftSide160() {
  noStroke();
  if (mouseX<width/2) {

    line(width/2, 0, width/2, height);
    fill(255, 0, 0);
    ellipse(width/4, height/2, 100, 100);
    textFont(font, 24); 
    text("Prediction = Left Side of Room", 15, 50);
    
  }
  else {
    
    background(0);
    fill(255);
    ellipse(width/4, height/2, 100, 100);
    fill(0);
    stroke(255);
    strokeWeight(10);
    line(width/2, 0, width/2, height);
    
  }
}

void caption() {
  
  stroke(255,0,0);
  textFont(font, 12); 
  text("*This sketch currently has only rollover action.", 15, 350);
  text("*The final sketch will be detailed to represent Room 160 and will be able to signify what side of the room we are on based ", 15, 370);
  text(" on our neural network mechanism", 15, 380);
  
}


