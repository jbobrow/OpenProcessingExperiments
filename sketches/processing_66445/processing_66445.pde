
int movement;
int yball;

void setup() {
  size(500, 500);
  movement = 10;
  yball=10;
  frameRate = (60);
}


void draw() {

  background(240);

  fill(mouseX, mouseY, 255);
  rectMode(CENTER);
  rect(250,250 , width/2, height/2);
  println("R = " + mouseX + " G = " + mouseY + " B = 255");
  
  noStroke();
  fill(mouseX,mouseY,100);
  ellipse(width/2, yball, 100, 100);
  
  yball+=movement;
  
  if (yball > 500 || yball < 0 ){
 
  movement *=-1;
  }
}




