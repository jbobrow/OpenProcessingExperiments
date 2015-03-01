
int diameter = 40;
int ydistance = diameter/2;
int xdistance = diameter/2;
int speed = 5;
int ydirection = 1;
int xdirection = 1;
int count = 0;



void setup() {
  size(800, 600);
  background(201, 234, 228);
  noStroke();
}

void draw() {
  background(201, 234, 228);
  fill(238, 198, 245);
  ellipse(xdistance, ydistance, diameter, diameter);

  fill(166, 203, 196);
  rectMode(CENTER);
  rect(mouseX, 550, 150, 10);


  //Move me
  ydistance += speed*ydirection;
  xdistance += speed*xdirection;

  //Hitting the Paddle!!
  if (ydistance>=height-75 && mouseX-75 < xdistance && xdistance < mouseX+75) {
    ydirection = -ydirection;
    println("I hit the paddle");
    count = count + 1;
  }




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

textSize(32);
text("score = " + str(count), 10, 30); 
fill(0, 102, 153);

 
  

}

