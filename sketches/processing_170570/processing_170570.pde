


float circleSize = 2;//sets the size of circle = to 2//sets size of circle = to 2
void sizeDifference() {
  background(random(0, 255), random(0, 255), random(0, 255));//colors are random when mouse is pressed 
  circleSize=circleSize - 80;//subtracts 80 from original circleSize=2
}//A function that allows you to localize it anywhere 

void setup() {
  size(200, 200);//sets up the size of the graph//sets up graph space
}
void draw() {
  fill(0);//sets everything draw to black
  rect(65, 80, 60, 60);//makes rectangle 
  line(65, 110, 30, 110);//creates left line
  line(125, 110, 160, 110);//creates right line
  line(95, 140, 95, 175);//creates top line 
  line(95, 80, 95, 45);//creates bottom line
  ellipse(95, 45, circleSize, circleSize);//makes bottom circle
  ellipse(30, 110, circleSize, circleSize);//makes left circle 
  ellipse(160, 109, circleSize, circleSize);//makes right circle 
  ellipse(95, 175, circleSize, circleSize);//makes top circle
  circleSize=constrain(circleSize, 0, 45);//stops circle from increasing in size 
  if (circleSize < 45) {//statement is true so action under it will happen
    circleSize = circleSize + 0.1;//makes circleSize increase
  } else if (circleSize==45) {//allows circleSize to begin in original position and then grow 
    circleSize = circleSize + 43;//size that the circleSize can grow up to
    for(circleSize=2; circleSize<45;circleSize++){//resets circles sizes
    }
  }
//when these keys are pressed it will cause action 
if (keyPressed) {
  if (key == 'r' || key == 't' || key == 'R' || key == 'T') {
     
    stroke(random(0, 255), random(0, 255), random(0, 255));//makes line colors appear random 
    ellipse(random(200), random(200), mouseX, mouseY);  } else {
    fill(0);
    rect(65, 80, 60, 60);//keeps the rectangle black if another key is pressed 
  }
}
}

void mousePressed() {//activates function when mouse is pressed 
  sizeDifference();
}






