
int circleA = 60;
int circleB = 60;
int speed = -1;
int bodyX = 150;
void setup() {
background(255);
size(300,300);
noStroke();
}

void draw() {
stroke(0);
fill(#B2B4C4); // color of the boxes
ellipseMode(CENTER);
ellipse(circleB,circleA,150,150); //alien head
fill(#07F72D);
rectMode(CENTER);
 circleA = circleA + speed;
  if (circleA > height || circleA < 0) 
  speed = speed * -1; // reverse course
  // Display the circle at x location
  // What will this do? 
  

rect(130,252,75,75);

fill(0); // eye color //black color
ellipseMode(CENTER);
ellipse(100,125,55,55); // black eye
ellipseMode(CENTER);
ellipse(150,125,55,55); // black eye
fill(#0CEDE7); // blue color
ellipseMode(CENTER);
ellipse(100,125,45,45);
ellipseMode(CENTER);
ellipse(150,125,45,45);

println ("Take me to your leader");


fill(175);
rectMode(CENTER);
fill(#10B4A8);
rect(mouseX,mouseY,50,50);

fill(0,0,255); // 100% opacity
rect(0,0,100,200);

fill(255,0,0,255); //100% opacity
rect(0,0,200,40);

fill(255,0,0,191);// 75% opacity
rect(0,50,200,40);

fill(255,0,0,127); //50% opacity
rect(0,100,200,40);

fill(255,0,0,63);// 25% opacity
rect(0,150,200,40);
circleA = circleA -2;
 circleB = circleB -2;
 bodyX = bodyX -1;

}

