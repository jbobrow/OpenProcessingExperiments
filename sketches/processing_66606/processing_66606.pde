
float yPos=25;
float xPos=25;

float xDirection;
float yDirection;

float circleRadius = 24;
int circleColor = 255;

float xSpeed = 3.85;
float ySpeed = 2.5;

boolean bouncingColor=false;





void setup() {
  size(400, 400);
  smooth();
  color(0);
  noStroke();
  frameRate(60);
  

}
void draw() {

  //background(120, 255, 0);//
    PImage myImage = loadImage("ahh_my_eyes400x400.jpg");
imageMode(CENTER);
image(myImage,width/2,height/2);
  fill(255, circleColor, 255);

  xPos = xPos + ( xSpeed * xDirection);
  yPos = yPos + ( ySpeed * yDirection);
  
//Bouncing part for X
  if (xPos > width-circleRadius/2 || xPos < circleRadius/2) {
    xSpeed = xSpeed * -1;
    circleColor = circleColor - 5;
  }
//Bouncing part for Y
  if (yPos > height-circleRadius/2 || yPos < circleRadius/2) {
    ySpeed = ySpeed * -1;
    circleColor = circleColor - 5;
  }
  
  ellipse(xPos, yPos, circleRadius, circleRadius);
//if the mouse is pressed downed
  if (mousePressed) {
    xPos =  mouseX;
    yPos = mouseY;
    circleColor = 255;
  }
  else {
    xPos += xSpeed;
    yPos += ySpeed;
  }
  
  if (circleColor == 255){
    bouncingColor = false;
  }

  if (circleColor == 0){
    bouncingColor = true;
  }  
  
  if (circleColor <= 0 && bouncingColor == false){
    circleColor--;
  }
//This one tells the color when it has reached 255 to start counting back
//since RGB max. # is 
  if (circleColor <= 255 && bouncingColor == true){
    circleColor++;
  }
    
 
}


//This is what allows the ball to be thrown, I had to hack it since we have not seen it.
void mouseReleased() {
  xSpeed = mouseX-pmouseX;
  ySpeed = mouseY-pmouseY;
}






