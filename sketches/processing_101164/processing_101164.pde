
void setup() {
  size(300, 800);
}

float yPos = 10;
float ySpeed = 0.001; 
float acc;

float xPos = 10;
float xSpeed = 0.001; 
float xacc;

float yPos2 = 10;
float ySpeed2 = 0.001;
float acc2;

float xPos2 = 10;
float xSpeed2 = 0.001;
float xacc2;


void draw () {
  fill(200, 200, 200);
  rect(0, 0, 300, 800);

  if (mousePressed) {
    yPos = mouseY;                    //Make the ball follow the mouse when clicked
    xPos = mouseX;
    ySpeed = (mouseY - pmouseY)/1.5;  //Making the balls speed proportionate to the mouse moving speed
    xSpeed = (mouseX - pmouseX)/1.5; 

    acc2 = ((-0.5*(yPos2 - yPos))/15) + 7;       //Hooke's Law for spring
    ySpeed2 += acc2;                      
    ySpeed2 *= 0.90;                     //Dampens the ySpeed so it doesn't move forever
    yPos2 += ySpeed2; 
    
    xacc2 = (-0.5*(xPos2 - xPos))/15;
    xSpeed2 += xacc2;
    xSpeed2 *= 0.90;
    xPos2 += xSpeed2;


    line(150, 0, xPos, yPos);            //These three lines o' code make lines that resemble springs 
    line(0, 200, xPos, yPos);            //
    line(300, 200, xPos, yPos);
    line(xPos, yPos, xPos2, yPos2);   
    fill(100, 100, 100);
    smooth();
    ellipse(xPos, yPos, 50, 50);      //Draw the Ball again
    fill(50, 50, 50);
    ellipse(xPos2, yPos2, 50, 50);
  }
  else {

    acc = (-0.5*(yPos - 200))/15;       //Hooke's Law for spring
    ySpeed += acc;                      
    ySpeed *= 0.95;                     //Dampens the ySpeed so it doesn't move forever
    yPos += ySpeed; 

    xacc = (-0.5*(xPos - 150))/15;
    xSpeed += xacc;
    xSpeed *= 0.95;
    xPos += xSpeed;

    acc2 = ((-0.5*(yPos2 - yPos))/15) + 7;       //Hooke's Law for spring
    ySpeed2 += acc2;                      
    ySpeed2 *= 0.90;                     //Dampens the ySpeed so it doesn't move forever
    yPos2 += ySpeed2; 
    
    xacc2 = (-0.5*(xPos2 - xPos))/15;
    xSpeed2 += xacc2;
    xSpeed2 *= 0.90;
    xPos2 += xSpeed2;

    smooth();
    line(150, 0, xPos, yPos);
    line(0, 200, xPos, yPos);
    line(300, 200, xPos, yPos);
    line(xPos, yPos, xPos2, yPos2);
    fill(100, 100, 100);
    ellipse(xPos, yPos, 50, 50);
    fill(50, 50, 50);
    ellipse(xPos2, yPos2, 50, 50);
  }
}



