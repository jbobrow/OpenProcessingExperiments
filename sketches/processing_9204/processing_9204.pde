
/*you can do this:
int circleX = 100;
int circleY = 100;

void setup () {    
    size(200,200);
 
}

void draw () {
  background(100);
  stroke(255);
  fill(0);
  ellipse(pmouseX, pmouseY, circleX,circleY);
  
  circleX = circleX + 1;
  
}
or you can do this:  */

float circleX = 0;
float circleY = 0;
float circleW = 50;
float circleH = 100;
float circleStroke = 255;
float circleFill = 0;
float background = 255;
float change = 0.5;

void setup () {    
    size(200,200);
    smooth();
}

void draw () {
  background(255);
  stroke(circleStroke);
  fill(circleFill);
  ellipse(circleX,circleY, circleW,circleH);
  
  circleX = circleX + change;
  circleY = circleY + change;
  circleW = circleW + change;
  circleH = circleH + change;
  circleStroke = circleStroke + change;
  circleFill = circleFill + change;

  
}


