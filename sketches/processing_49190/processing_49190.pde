
float xPos = 100;
float yPos = 600;
float ySpeed = 4;

void setup() {
  size(200, 500);
  smooth();
  //lets you write to the console
  println("hello");
}

void draw() {
    
  yPos -= ySpeed;
  if (yPos < 0) {
  yPos = 600;
  }
  
  background(127);
  //limbs
  line(xPos-25, yPos+40, xPos-20, yPos+80);
  line(xPos+25, yPos+40, xPos+20, yPos+80);
  line(xPos-25, yPos, xPos-35, yPos+20);
  line(xPos+25, yPos, xPos+35, yPos+20);
  //body
  rectMode(CENTER);
  fill(random(255),random(255),random(255));
  rect(xPos,yPos, 50, 80);
  fill(200, 50, 50);
  ellipse(xPos, yPos-50, 80, 80);
  //eyes
  fill(random(255),random(255),random(255));
  ellipse(xPos-20, yPos-50, 20, 10);
  ellipse(xPos+20, yPos-50, 20, 10);
  //pupils
  fill(0);
  ellipse(xPos-20, yPos-50, 5, 5);
  ellipse(xPos+20, yPos-50, 20, 10);
  //eyepatch string
  line(xPos-36, yPos-65, xPos+10, yPos-50);
  line(xPos+30, yPos-50, xPos+40, yPos-50);
}

void mousePressed() {
  if (ySpeed > 0) {
  ySpeed = 0;
  ySpeed = 0;
  } else {
  ySpeed += 2;
  }
}


