
PImage img;

//'Mars" image taken from http://www.nerditorial.com/wp-content/uploads/2011/04/MarsSurfaceHighRes1.jpg

float x = 200; // x-coordinate
float y = 200; // y-coordinate
int bodyHeight = 100; //body height
int bodyWidth = 100; //body Width


float easing = 0.01;

void setup() {
  background(255); //background white
  size(1500, 500);
  smooth();
  img = loadImage("MarsSurfaceHighRes1.jpg");
  ellipseMode(CENTER);
rectMode(CORNER);
}

void draw() {
  background(255);
  image(img, 0, 0);
int targetX = mouseX;
x += (targetX - x) * easing;

if (mousePressed) {
bodyWidth = 120;
bodyHeight = 90;
} else {
bodyWidth = 100;
bodyHeight = 180;
}
float ny = y - bodyHeight - bodyWidth;

//BODY
strokeWeight(3);
stroke(0); //outline black
fill(200); //light grey fill
rect(x, y, bodyWidth, bodyHeight); //body of the robot

//BOTTOM
strokeWeight(3);
fill(150); //darker grey fill
strokeJoin(ROUND);
triangle(x, y + bodyHeight, x + bodyWidth, y + bodyHeight, x + bodyWidth/2, 480); //triangle bottom

//NECK
strokeWeight(3);
stroke(0); //outline black
fill(150); //darker grey fill
arc(x + bodyWidth/2, y , bodyWidth, 100, radians(180), radians(360)); //semi-circle body-neck

//Button Detail
strokeWeight(5); //button line weight
strokeCap(ROUND); //line rounded
line(x + bodyWidth - 20, 220, x + bodyWidth - 20, 250); //button detail
stroke(255, 0, 0); //button colour red
point(x + bodyWidth - 20, 260); //button detail
stroke(0, 150, 0); //button colour green
point(x + bodyWidth - 20, 270); //button detail

//Anntenna Left + Detail
strokeWeight(2);
stroke(0);//outline black
line(x + bodyWidth/2 - 150, y/2, x + bodyWidth/2, y/2); //anntenna left
strokeWeight(15);
stroke(0, 180, 200); //stroke colour blue/green
point(x + bodyWidth/2 - 150, y/2);// 

strokeWeight(2);
stroke(0); // outline black
fill(255, 200, 0); // orange/yellow colour
ellipse(x - 50, 100, 10, 30); //antenna detail left 1

strokeWeight(2);
stroke(0); // outline black
fill(100, 205, 0); // apple green colour
ellipse(x - 37, 100, 15, 40); //antenna detail left 2

strokeWeight(2);
stroke(0); // outline black
fill(255, 120, 140); // pink colour
ellipse(x - 22, 100, 14, 50); //antenna detail left 3

//Anntenna Right + Detail
strokeWeight(2);
stroke(0);
line(x + bodyWidth/2, y/2, x + bodyWidth/2 + 150, y/2); //anntenna right
strokeWeight(15);
stroke(0, 180, 200); //stroke colour blue/green
point(x + bodyWidth/2 + 150, y/2);

strokeWeight(2);
stroke(0); // outline black
fill(255, 200, 0); // orange/yellow colour
ellipse(x + bodyWidth + 50, y/2, 10, 30); //antenna detail right 1

strokeWeight(2);
stroke(0); // outline black
fill(100, 205, 0); // apple green colour
ellipse(x + bodyWidth + 37, y/2, 15, 40); //antenna detail right 2

strokeWeight(2);
stroke(0); // outline black
fill(255, 120, 140); // pink colour
ellipse(x + bodyWidth + 22, y/2, 14, 50); //antenna detail right 3

//HEAD
strokeWeight(4);
stroke(0); // outline black
fill(200); // fill lighter grey
ellipse( x + bodyWidth/2, y - 100, bodyWidth + 30, 100); //head of robot

strokeWeight(1);
fill(255); // white fill
ellipse(x + bodyWidth/2 - 40, 95, 30, 30); //left eye
ellipse(x + bodyWidth/2 + 40, 95, 30, 30); //right eye

noStroke(); // no stroke around pupil
fill(80, 0, 130, 180); //purple pupil - slightly transparent
ellipse(x + bodyWidth/2 - 40, 100, 20, 20); //left pupil
ellipse(x + bodyWidth/2 + 40, 100, 20, 20); //right pupil

strokeWeight(2);
stroke(0); //stroke black
noFill(); //no fill for smile
arc(x + bodyWidth/2, y-80, 30, 20, radians(10), radians(100)); //lopsided smile

}


