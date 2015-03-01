
float posX;
float posY;
float ySpeed = 0;
float xSpeed = 0;
float ballDiameter = 40;
float ballRadius = ballDiameter/2;
 
void setup() {
  
  size (1000,800);

  fill (0);
  ellipseMode(CENTER);
  smooth();
  noStroke();
  posX = width/2;
  posY = height/2;
}
 
void draw() {
  mouseChecks();
  boundaryChecks();
  updateBall();
  
  println(mousePressed);
}
 
void mouseChecks() {
  if (mousePressed) {
    
    if (mouseX > posX - ballDiameter && mouseX < posX + ballDiameter && mouseY > posY - ballDiameter && mouseY < posY + ballDiameter){
       posX = mouseX;
       posY = mouseY;
       ySpeed = mouseY - pmouseY;
       xSpeed = mouseX - pmouseX;
    }
       
  }
}
 
void boundaryChecks() {
  if (posY >= height - ballRadius) {
    posY = height - ballRadius;
    ySpeed = -ySpeed/1.15;
  }
  if (posY <= ballRadius) {
    posY = ballRadius;
    ySpeed = -ySpeed/1.35;
  }
  if (posX >= width - ballRadius) {
    posX = width - ballRadius;
    xSpeed = -xSpeed/1.10;
  }
  if (posX <= ballRadius) {
    posX = ballRadius;
    xSpeed = -xSpeed/1.10;
  }
}
 
void updateBall() {

  background(255); 
  ellipse (posX, posY, ballDiameter, ballDiameter);
  ySpeed = ySpeed += 0.2;
  xSpeed = xSpeed/1.005;
  posY += ySpeed;
  posX += xSpeed;
}

