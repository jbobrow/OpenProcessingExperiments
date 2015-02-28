

float x = 60;
float y = 440;
float easing = 0.02;

int eyeSize = 20;
int colour = 255;
int arm = 150;

PImage landscape;
PFont font;

void setup() {
smooth();
size(400,320);
noStroke();
fill(0);

//background
landscape = loadImage("sky.jpg");
smooth();

//font
font = loadFont("Serif-50.vlw");
textFont(font);
}



void draw() {
  
//eye and arm movements on mouse click
  
int targetX = mouseX;
x += (targetX - x) * easing;

if (mousePressed) {
  eyeSize = 20;
  arm = 150;
  
} else {
  eyeSize = 10;
  arm = 90;
  
}

float ny = y - eyeSize - arm;
  
  
  
// background image
image(landscape, 0, 0);

//font
textSize(50);
text("robofly",230,280);


// Robot head

fill(0);
rect(mouseX + 25,mouseY + 30,50,20);
ellipse(mouseX + 50,mouseY + 30,40,40);

//Robot eyes

stroke(0);
strokeWeight(0);
fill(170,30,140);
ellipse(mouseX + 40,mouseY + 30,eyeSize,eyeSize);
ellipse(mouseX + 60,mouseY + 30,eyeSize,eyeSize);

// Robot mouth

fill(colour);
arc(mouseX + 50,mouseY + 42,15,10,0,180);

// Robot body outer rectangle

strokeWeight(3);
fill(0,188,222);
rect(mouseX + 25,mouseY + 55,50,20);

// Robot upper rectangle

strokeWeight(1);
fill(170,30,140);
rect(mouseX + 20,mouseY + 50,60,5);

// Robot arm rectangles

fill(0);
strokeWeight(3);
rect(mouseX + 75,mouseY + 60,5,10);
rect(mouseX + 20,mouseY + 60,5,10);

// Robot inner body rectangle

strokeWeight(0);
fill(255,255,255);
rect(mouseX + 30,mouseY + 60,40,10);

// Robot legs

fill(0);
rect(mouseX + 30,mouseY + 75,10,15);
rect(mouseX + 60,mouseY + 75,10,15);

// Robot feet

triangle(mouseX + 35,mouseY + 85,mouseX + 45,mouseY + 95,mouseX + 25,mouseY + 95);
triangle(mouseX + 65,mouseY + 85,mouseX + 75,mouseY + 95,mouseX + 55,mouseY + 95);

// Robot arm lines

strokeWeight(2);
line(mouseX + 80,mouseY + 65,mouseX + arm,mouseY + 55);
line(mouseX + 80,mouseY + 65,mouseX + arm,mouseY + 70);
line(mouseX + 20,mouseY + 65,mouseX + 10,mouseY + 45);

}







