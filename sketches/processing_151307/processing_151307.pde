
void setup() {
  size(600, 600);

  rectMode(CENTER);
  noStroke();
}


void draw() {
  background(random(0, 255), random(0, 255), random(0, 255)); 
  noStroke();

  int num = 5;
  int margin = 80;

  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter
  
  
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber=circleNumber+3;

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;
      
      int asd=(circleNumber%2);
      
     if (asd==0){ 
      movingCircle2(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
     
     }
     else {
      movingCircle(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
      
     }
     
    }
  }
}//end of draw 


void movingCircle(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  stroke(128, 0, 255);
  strokeWeight(5);
  fill(255, 0, 128);
  ellipse(x, y, size, size); // circle

  stroke(0, 0, 255);
  line(x, y, tempX, tempY); // red line
}

void movingCircle2(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * cos(angle);
  float tempY = y + (size / 2) * sin(angle);

  stroke(128, 0, 255);
  strokeWeight(5);
  fill(0, 255, 255);
  rect(x, y, size, size); // circle

  stroke(255, 0, 0);
  line(x, y, tempX, tempY); // red line
}
