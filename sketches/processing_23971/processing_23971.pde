
//interaction !
int x;
int y;
int armDown;
int mouthY;
int mouthSizeY;


void setup () {
  println("setup has run");
  size(300,300);
  background(193,236,210);
  smooth();
  x = 50; //40
  y = 50; //45
  armDown = 65;
  mouthY = 45;
  mouthSizeY = 25;
}

void draw () {
  //println("Draw is running");
  //println(frameCount);

background(193,236,210);
x = mouseX;
y = mouseY;
armDown = mouseY+15;
mouthY = mouseY-5;
//mouthSizeY = mouseY;

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
fill(111,89,57);
stroke(66,46,18);
if (mouseY < 50) {
  armDown = mouseY+5;
} else if(mouseY < 100) {
  armDown = mouseY+15;
} else if(mouseY < 150) {
  armDown = mouseY+5;
} else if(mouseY < 200) {
  armDown = mouseY+15;
} else if(mouseY < 250) {
  armDown = mouseY+5;
} else {
  armDown = mouseY+15; 
}
triangle(x-25, y+5, x-25, y+15, x-40, armDown);
triangle(x+25, y+4, x+25, y+15, x+40, armDown);

}



