
float lineX = 50;
float lineY = 50;

float myX;
float myY;

float colour = 10;

void setup() {
  background(0);
  smooth();
  size(800, 800);
  colorMode(HSB);
  myX = width/2;
  myY = height/2;
}

void draw() {


  fill(0, 0, 0, 15);
  //rect(-10,-10,820,820);
  //  myX = myX+5-(mouseX+myX)/50.0;
  //  myY = myY+5-(mouseY+myY)/50.0;
  myX = myX + random(-20, 20)/10;
  myY = myY + random(-20, 20)/10;

  if (dist(mouseX, mouseY, myX, myY) <80 ) {
    //myX = myX+5-(mouseX-myX)/50.0;
    //myY = myY+5-(mouseY-myY)/50.0;
    myX = myX + (myX - mouseX) / 15;
    myY = myY + (myY - mouseY) / 15;
  }

  ellipse(myX, myY, 100, 100);


  if (mousePressed) {
    myX = mouseY;
    myY = mouseX;
  }



//  translate(myX, myY);
//  rotate(radians(30)); 
  ellipse(myX, myY, lineX, lineY);
  ellipse(myY, myX, lineX, lineY);
  strokeWeight(7);

  if (colour <255) {
    colour = colour + 0.05;
  } 
  else { 
    colour = 0;
  }

  stroke(colour, 200, 200, 75);

  if (mousePressed && (mouseButton == LEFT)) {
    lineX = lineX+2;
    lineY = lineY+2;
    translate(myX, myY);
    rotate(PI/10);
  } 
  else if (mousePressed && (mouseButton == RIGHT)) {
    lineX = lineX-5;
    lineY = lineY-5;  
    translate(myX, myY);
    rotate(PI/-5);
  }
}




void keyPressed()
{
  //    background(0);
}
