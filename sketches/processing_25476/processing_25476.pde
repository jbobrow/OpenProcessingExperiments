
int x;
int y;
int armDown;
int mouthY;
int mouthSizeY;
PImage bg;
String r = "";
int speed;


void setup () {
  println("setup has run");
  size(300,300);
  background(193,236,210);
  smooth();
  x = 50; //40
  y = 250; //45
  armDown = y+15;
  mouthY = y-5;
  mouthSizeY = y-25;
  bg = loadImage("wallpaper.jpg");
  speed = 0;
}

void draw () {
  //println("Draw is running");
  //println(frameCount);

background(193,236,210);
x = mouseX;
//y = mouseY;
armDown = y+15;
mouthY = y-5;
mouthSizeY = y;

image(bg, 0, 0, 428, 300);

//face
fill(111,89,57);
stroke(66,46,18);
rect(x-25, y-30, 50, 60);

//eyes
fill(0);
ellipse(x-12, y-15, 8, 8);
ellipse(x+12, y-15, 8, 8);

fill(255);
ellipse(x-11, y-16, 3.5, 3.5);
ellipse(x+11, y-16, 3.5, 3.5);

//mouth
fill(174,48,48);
//float mouthSizeY = map(mouseY,0,300,7,30);
if(mousePressed == true) {
  mouthSizeY = 10;
  } else {
  mouthSizeY = 25;
  }
rect(x-10, mouthY, 20, mouthSizeY);

//RAH
PFont font;
font = loadFont("Helvetica-48.vlw");
textFont(font);
String r = "RAHHH !!!";
if(mousePressed == true) {
  r = "RAHHH !!!";
  } else {
  r = "";
}
fill(174,60,80);
text(r, 40, 50);

//teeth
  //top
fill(255);
triangle(x-9, mouthY, x-3, mouthY, x-7, mouthY+5);
triangle(x-3, mouthY, x+3, mouthY, x-1, mouthY+5);
triangle(x+3, mouthY, x+10, mouthY, x+6, mouthY+5);
  //bottom
triangle(x-9, mouthY+mouthSizeY, x-3, mouthY+mouthSizeY, x-7, mouthY+mouthSizeY-5);
triangle(x-3, mouthY+mouthSizeY, x+3, mouthY+mouthSizeY, x-1, mouthY+mouthSizeY-5);
triangle(x+3, mouthY+mouthSizeY, x+10, mouthY+mouthSizeY, x+6, mouthY+mouthSizeY-5);

//legs
fill(111,89,57);
stroke(66,46,18);
rect(x-20, y+30, 15, 18);
rect(x+5, y+30, 15, 18);

//arms

if (mousePressed == true) {
    armDown = y+5;
  }   
fill(111,89,57);
stroke(66,46,18);
if (y < 50) {
  armDown = y+5;
} else if(y < 100) {
  armDown = y+15;
} else if(y < 150) {
  armDown = y+5;
} else if(y < 200) {
  armDown = y+15;
} else if(y < 250) {
  armDown = y+5;
} else {
  armDown = y+15; 
}
triangle(x-25, y+5, x-25, y+15, x-40, armDown);
triangle(x+25, y+4, x+25, y+15, x+40, armDown);

y -= speed;
if (y<100) {
    speed *= -1;
  } else if (y>249) {
    speed = 0; 
}
  

  
  
}

void keyPressed() {
  if(speed == 0) {
    speed = 10;
  } 
  
}




