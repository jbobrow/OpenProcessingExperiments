
float mau5headX;
float mau5headY;
float eyeR;
float eyeG;
float eyeB;
//Init
void setup() {
  size(1000, 600);
  mau5headX = width/2;
  mau5headY = height/2;
  background(0);
  smooth();
}
//Draws the mau5head
void draw() {
  //Show mouse pointer location
  println (mouseX +"," + mouseY);
  
  //Head
  ellipseMode(CENTER);
  noStroke();
  fill(255, 0, 0);
  ellipse(mau5headX, mau5headY+50, 250, 250);
  
  //mouth
  noStroke();
  fill(255);
  arc(mau5headX, mau5headY+55, 200, 200, 0, PI, OPEN);
  
  //Ears
  ellipseMode(CENTER);
  noStroke();
  fill(255, 0, 0);
  ellipse(410, 255, 200, 200);
  ellipse(610, 255, 200, 200);
  
  //Eyes
  ellipseMode(CENTER);
  noStroke();
  eyeR = random(255);
  eyeG = random(255);
  eyeB = random(255);
  fill(eyeR, eyeG, eyeB);
  ellipse(550, 295, 60, 65);
  ellipse(450, 295, 60, 65);
  
}


