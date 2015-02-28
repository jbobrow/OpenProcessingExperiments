

float circleX = 0;
float circleY = 0;
float circleW = 50;
float circleH = 100;
float circleStroke = 255;
float circleFill = 0;
float backgroundColor = 255; 
float change = 0.5;

void setup () {
  size (500,500);
  
}

void draw (){
  background (255);
  stroke(0);
  fill (175);
  ellipse (circleX,circleY,50,50);
  
  circleX = circleX + 1;
  circleY = circleY + 3;
  circleW = circleW + change;
  circleH = circleH - change;
  circleStroke = circleStroke - change;
  circleFill = circleFill + change;
}



