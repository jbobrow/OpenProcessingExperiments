
void setup() {
  size(600, 600);
  background(180);
  rectMode(CENTER);
  noStroke();
}


void draw() {
  background(180);
  noStroke();

  int num = 5;
  int margin = 80;

  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter

  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      ++circleNumber;

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;
      if (circleNumber % 2 == 1) { //Previous Version has squares in odd number places. Changed it to even places by changing "==0" to "==1"
        movingCircle(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
    } else {
      movingSquare(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
  }
}
  }
  
  if (keyPressed == true && key=='s') {
    saveFrame("yourName.jpg");
  }

}//end of draw 

// Square 
void movingSquare(float x, float y, float size, float angle) {
// Error on Above line "unexpected token:void"
  // calculate endpoint of the line
  float tempX = x + (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  stroke(0);
  strokeWeight(1);
  fill(random(250), random(250), random(250)); // Added randomized colour
  rect(x, y, size, size); // Square

  stroke(255, 0, 0);
  line(x, y, tempX, tempY); // red line
}

void movingCircle(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  stroke(0);
  strokeWeight(1);
  fill(random(250), random(250), random(250)); // Added randomized colour
  ellipse(x, y, size, size); // circle

  stroke(255, 0, 0);
  line(x, y, tempX, tempY); // red line
}

