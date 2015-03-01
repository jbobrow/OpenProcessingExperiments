
int diameter = 100;
int ydistance = diameter/2;
int xdistance = diameter/2;

int speed = 5;
int ydirection = 1;
int xdirection = 1;

int x=0;

void setup() {
  size(750, 600);
  background(50);
  fill(150, 150, 220);
}

void draw() {
  noStroke();
  fill(214, 239, 250);
  rect(0, 0, 1500, 50);
  fill(214, 237.5, 250);
  rect(0, 50, 1500, 50);
  fill(214, 236, 250);
  rect(0, 100, 1500, 50);
  fill(214, 234.5, 250);
  rect(0, 150, 1500, 50);
  fill(214, 233, 250);
  rect(0, 200, 1500, 50);
  fill(214, 231.5, 250);
  rect(0, 250, 1500, 50);
  fill(214, 230, 250);
  rect(0, 300, 1500, 50);
  fill(214, 228.5, 250);
  rect(0, 350, 1500, 50);
  fill(214, 227, 250);
  rect(0, 400, 1500, 50);
  fill(214, 225.5, 250);
  rect(0, 450, 1500, 50);
  fill(214, 224, 250);
  rect(0, 500, 1500, 50);
  fill(214, 221.5, 250);
  rect(0, 550, 1500, 50);
  fill(214, 220, 250);
  rect(0, 600, 1500, 50);

  fill (253, 244, 178);
  ellipse(xdistance, ydistance, diameter-50, diameter-55);
  fill(253, 242, 178);
  ellipse(xdistance, ydistance, diameter-60, diameter-60);
  fill(253, 240, 178);
  ellipse(xdistance, ydistance, diameter-65, diameter-65);
  fill(255, 238, 178);
  ellipse(xdistance, ydistance, diameter-70, diameter-70);
  fill(255, 236, 178);
  ellipse(xdistance, ydistance, diameter-75, diameter-75);
  fill(255, 234, 178);
  ellipse(xdistance, ydistance, diameter-80, diameter-80);


  fill(255, 255, 255);
  ellipseMode(CENTER);
  ellipse(mouseX, height-100, 200, 20);
  ellipse(mouseX, height-115, 70, 20);
  ellipse(mouseX-50, height-105, 50, 20);
  ellipse(mouseX+40, height-105, 50, 20);



  if (ydistance>=height-150 && mouseX-75 < xdistance && xdistance < mouseX+75) {
    ydirection = -ydirection;
    x+= 1;
  }

 PFont font;
 font = loadFont("Trebuchet-BoldItalic-48.vlw");
 fill(175, 216, 255);
 textFont(font, 32);
  text("counter = " + str(x), 10, 40); 

  //Move me
  ydistance += speed*ydirection;
  xdistance += speed*xdirection;

  //Did I hit the bottom?
  if (ydistance > height-diameter/2) {
    ydirection = -ydirection;
    println("I hit the bottom");
  }

  //Did I hit the top?
  if (ydistance < 0+diameter/2) {           
    ydirection = -ydirection;           
    println("I hit the top");
  }       

  //Did I hit the right side?       
  if (xdistance > width-diameter/2) {
    xdirection = -xdirection;
    println("I hit the right side");
  }

  //Did I hit the left side?
  if (xdistance < 0+diameter/2) {
    xdirection = -xdirection;
    println("I hit the left side");
  }
}



