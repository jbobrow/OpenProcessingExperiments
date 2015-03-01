

float circleWidth;
float strokeWeightValue;
float backgroundValue;
float strokeColorValue;
float angle;

void setup() {
  size(300, 300);
  circleWidth = 80;
  backgroundValue = 180;
  strokeWeightValue = 20;
  strokeColorValue = 60;
  float angleStep=180.0;
}


void draw() {
  background(backgroundValue);
  stroke(strokeColorValue);
  strokeWeight(strokeWeightValue);
  ellipse(180, 150, circleWidth, circleWidth);
  
  if(mousePressed){
     strokeColorValue = 50 + mouseY/5;
  }

}


void mousePressed() {
  println("The mouse button was pressed");
  circleWidth = 150;
}

void mouseReleased() {
  println("The mouse button was released");
  circleWidth = 50;
}

void mouseClicked() {
  println("The mouse button was clicked");
  if (backgroundValue == 120) {
    backgroundValue = 180;
  }else{
    backgroundValue = 120;
  }
}

void mouseDragged(){
  println("The mouse is being dragged");
  strokeWeightValue = mouseX/10;
  
  //Ensure that the value for stroke weight is never negative.
  if(strokeWeightValue < 0)
    strokeWeightValue = 0;
}



