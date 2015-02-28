
float xPos;   //declaring position to program
float yPos;  //declare speed always
float speed = 20;
boolean moveLeft, moveRight, moveUp, moveDown = false; //declaring it's zero in order to triger it "true"
 
 
void setup() {
 
  size(800, 500);
  background(0, 10);
  noStroke();
  smooth();
  xPos = 100;
  yPos = 100;
  speed = 2;
}
 
 
void draw() {
  moon();
  move();
  circle();
   
   
}
//draw the ellipse
void moon()
{
  ellipse(xPos, yPos, 30, 30);
  ellipse(xPos+650, yPos+250, 300, 300);
  ellipse(xPos+100, yPos+80, 50, 50);
  ellipse(xPos, yPos+150, 40, 40);
  ellipse(xPos+200, yPos+50, 100, 100);
  ellipse(xPos+300, yPos+100, 20, 20);
  ellipse(xPos+400, yPos+150, 10, 10);
  ellipse(xPos-100, yPos+200, 5, 5);
  ellipse(xPos+100, yPos+250, 10, 10);
 
 
 
}
 
//key control
void keyPressed() {   
  if (keyCode == LEFT) {
    moveLeft = true;
  }
  if (keyCode == RIGHT) {
    moveRight = true;
  }
  if (keyCode == UP) {
    moveUp = true;
  }
  if (keyCode == DOWN) {
    moveDown = true;
  }
  
  }
 
void keyReleased() {
 
  if (keyCode == LEFT) {
    moveLeft = false;
  }
  else if (keyCode == RIGHT) {
    moveRight = false;
  }
  else if (keyCode == UP) {
    moveUp = false;
  }
  else if (keyCode == DOWN) {
    moveDown = false;
  }
}

void move() {
  if (moveUp) {
    yPos -= speed;
  }
  if (moveDown) {
    yPos += speed;
  }
  if (moveRight) {
    xPos += speed;
  }
  if (moveLeft) {
    xPos -= speed;
  }
}
void circle() {
  if (mousePressed) {
    fill(random(255),random(255),random(255));
  }
  else {
    fill(random(255),random(255),random(255));
  }
  ellipse(mouseX, mouseY, 2, 2);
}




