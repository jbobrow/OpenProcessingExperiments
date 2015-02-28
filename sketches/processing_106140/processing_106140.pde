
float hourX;
float minuteX;
float secondX;
float hourY;
float minuteY;
float secondY;

void setup() {
  size(600, 150);
  noStroke();
}

void draw() {
  background(0, 201, 234);  

  hourX = map(hour(), 0, 23, 0, (width-30)); 
  minuteX = map(minute(), 0, 59, 35, (width-50)); 
  secondX = map(second(), 0, 59, 0, (width-30)); 

  //sun by hours
  fill(255, 200, 0);
  ellipse(hourX, 40, 50, 50);
  //cloud by min
  fill(255);
  drawCloud(minuteX, 60); 
  //car by sec
  drawWagon(secondX, height);
}


void drawCloud (float xPos, float yPos) {
  ellipse(xPos, yPos, 20, 20);
  ellipse(xPos-30, yPos+5, 30, 30);
  ellipse(xPos-20, yPos, 40, 40);
  ellipse(xPos-35, yPos-5, 20, 20);
  ellipse(xPos-45, yPos, 20, 20);
}

void drawWagon (float xPos, float yPos) {
  //I tried setting this up as a for loop but it messed up :/
  //this draws the grass on the wagon
  fill(39, 155, 8);
  rect(xPos+45, yPos-50, 2, 20);
  rect(xPos+40, yPos-50, 2, 20);
  rect(xPos+35, yPos-50, 2, 20);
  rect(xPos+30, yPos-50, 2, 20);  
  rect(xPos+25, yPos-50, 2, 20);
  rect(xPos+20, yPos-50, 2, 20);
  rect(xPos+15, yPos-50, 2, 20);
  rect(xPos+10, yPos-50, 2, 20);
  rect(xPos+5, yPos-50, 2, 20);

  //this draws the wagon body
  fill(255, 68, 0);
  rect(xPos, yPos-40, 50, 30);
  //this draws the large wheels
  fill(0);
  ellipse(xPos+40, yPos-10, 15, 15);
  fill(0);
  ellipse(xPos+10, yPos-10, 15, 15);
  //this draws the inner wheel
  fill(255);
  ellipse(xPos+40, yPos-10, 10, 10);
  fill(255);
  ellipse(secondX+10, yPos-10, 10, 10);
}



