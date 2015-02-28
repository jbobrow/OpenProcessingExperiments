
int pX = 300;
int pY = 300;
int mX = 300;
int mY = 300;
int weight = 1;
int difX;
int difY;
int rand = 5;
color colorVar;


void setup() {
  size(screen.width, screen.height);
  colorMode(HSB,100);
  background(100);
  smooth();
}

void draw() {
  if (mouseX==0 && mouseY==0){
     mouseX = width/2;
     mouseY = width/2;
  }
  drawLine(); 
}

void mousePressed(){
   pX = mouseX;
   pY = mouseY;
   
}

void mouseReleased(){
  fill(100, 50);
  rect(0, 0, width, height);
  
}

void drawLine() {
  mX = mouseX;
  mY = mouseY;
  //set difX and difY by using pX, pY and mX, mY
  difX = pX - mX;
  difY = pY - mY;
 
 //uses difX and difY to find the diference from one point to another point.
  weight = int(sqrt(difX * difX + difY * difY));
  
  //sets rand to a random number from 1 to 20
  //rand = int(random(1, 20));
  color colorVar = color((weight/10), 90, 90);
 
  strokeWeight(weight / 90);
  stroke(colorVar, 20);
  println(pX + " " + pY + " " + mX + " " + mY);
  
  //draws the line
  //line(pX, pY, mX, mY);
  
  //the triangle triangle
  noFill();
  triangle(pX, pY, mX, mY, pX + weight, pY - weight/2);
  noStroke();
  fill(100,1);
  rect(0, 0, width, height);
}



