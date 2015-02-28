
// Week 3 Assignment
// Maureen Grant 


// declare global variables
int y = 0;
int x = 0;
int diam = 20;
int speed = 1;
int gravity = 1;
//Variable fill color
float r;
float g;
float b;
float a;
float z;


//Set up screen size and background
void setup() {
  size(200,200);
  background(0);
}

//variable squares for fill
void drawSquares(int x, int y) {
stroke(0);
//rotate(radians(45));
//rect(x+=speed,y,20,20);
//stroke(0);
//rotate(radians(45)); // tried to translate the fill 45 degrees but it translated the row
//translate (2,2);
//rotate(radians(z));
fill(r,g,b,a); //random fill color
rect(x + z,y + z,20,20); //rollover rectangle is double the size
z = random (-10, 10); //shift amount
r = random (50,255);
g = random (0);
b = random (75,255);
a = random (0,255);
}

//calling on function drawRow and adding increments of 20 to fill screen
void draw(){
  drawRow(0);
  drawRow(20);
  drawRow(40);
  drawRow(60);
  drawRow(80);
  drawRow(100);
  drawRow(120);
  drawRow(140);
  drawRow(160);
  drawRow(180);
  drawRow(200);
//up to 200 x 200 pixels

}

//Rows of squares 20 x 20
void drawRow(int x) {
  // Draw a line
  stroke(0);
  // Only one line is drawn each time through draw().
  for (int y =0; y<width; y+=20){
  rect(x,y,diam,diam); 
  }
  
// Mouse Rollovers
//when mouse enters each grid frame, it gives that same cell a random fill color

//Horizontal Row 1
if (mouseX <= 20 && mouseY <= 20){
  drawSquares(0,0);
} else {
fill(255);
}

//Horizontal Row 1
if (mouseX > 20 && mouseX < 40 && mouseY > 0 && mouseY < 20){
  drawSquares(20,0);
} else {
fill(255);
}

if (mouseX > 40 && mouseX < 60 && mouseY > 0 && mouseY < 20){
  drawSquares(40,0);
} else {
fill(255);
}

if (mouseX > 60 && mouseX < 80 && mouseY > 0 && mouseY < 20){
  drawSquares(60,0);
} else {
fill(255);
}

if (mouseX > 80 && mouseX < 100 && mouseY > 0 && mouseY < 20){
  drawSquares(80,0);
} else {
fill(255);
}

if (mouseX > 100 && mouseX < 120 && mouseY > 0 && mouseY < 20){
  drawSquares(100,0);
} else {
fill(255);
}

if (mouseX > 120 && mouseX < 140 && mouseY > 0 && mouseY < 20){
  drawSquares(120,0);
} else {
fill(255);
}

if (mouseX > 140 && mouseX < 160 && mouseY > 0 && mouseY < 20){
  drawSquares(140,0);
} else {
fill(255);
}

if (mouseX > 160 && mouseX < 180 && mouseY > 0 && mouseY < 20){
  drawSquares(160,0);
} else {
fill(255);
}

if (mouseX > 180 && mouseX < 200 && mouseY > 0 && mouseY < 20){
  drawSquares(180,0);
} else {
fill(255);
}

if (mouseX > 200 && mouseX < 220 && mouseY > 0 && mouseY < 20){
  drawSquares(200,0);
} else {
fill(255);
}


//Horizontal Row 2
if (mouseX > 0 && mouseX < 20 && mouseY > 20 && mouseY < 40){
  drawSquares(0,20);
} else {
fill(255);
}

if (mouseX > 20 && mouseX < 40 && mouseY > 20 && mouseY < 40){
  drawSquares(20,20);
} else {
fill(255);
}
if (mouseX > 40 && mouseX < 60 && mouseY > 20 && mouseY < 40){
  drawSquares(40,20);
} else {
fill(255);
}
if (mouseX > 60 && mouseX < 80 && mouseY > 20 && mouseY < 40){
  drawSquares(60,20);
} else {
fill(255);
}
if (mouseX > 80 && mouseX < 100 && mouseY > 20 && mouseY < 40){
  drawSquares(80,20);
} else {
fill(255);
}

if (mouseX > 100 && mouseX < 120 && mouseY > 20 && mouseY < 40){
  drawSquares(100,20);
} else {
fill(255);
}

if (mouseX > 120 && mouseX < 140 && mouseY > 20 && mouseY < 40){
  drawSquares(120,20);
} else {
fill(255);
}

if (mouseX > 140 && mouseX < 160 && mouseY > 20 && mouseY < 40){
  drawSquares(140,20);
} else {
fill(255);
}

if (mouseX > 160 && mouseX < 180 && mouseY > 20 && mouseY < 40){
  drawSquares(160,20);
} else {
fill(255);
}

if (mouseX > 180 && mouseX < 200 && mouseY > 20 && mouseY < 40){
  drawSquares(180,20);
} else {
fill(255);
}

if (mouseX > 200 && mouseX < 220 && mouseY > 20 && mouseY < 40){
  drawSquares(200,20);
} else {
fill(255);
}


//Horizontal row 3
if (mouseX > 0 && mouseX < 20 && mouseY > 40 && mouseY < 60){
  drawSquares(0,40);
} else {
fill(255);
}

if (mouseX > 20 && mouseX < 40 && mouseY > 40 && mouseY < 60){
  drawSquares(20,40);
} else {
fill(255);
}
if (mouseX > 40 && mouseX < 60 && mouseY > 40 && mouseY < 60){
  drawSquares(40,40);
} else {
fill(255);
}
if (mouseX > 60 && mouseX < 80 && mouseY > 40 && mouseY < 60){
  drawSquares(60,40);
} else {
fill(255);
}
if (mouseX > 80 && mouseX < 100 && mouseY > 40 && mouseY < 60){
  drawSquares(80,40);
} else {
fill(255);
}

if (mouseX > 100 && mouseX < 120 && mouseY > 40 && mouseY < 60){
  drawSquares(100,40);
} else {
fill(255);
}

if (mouseX > 120 && mouseX < 140 && mouseY > 40 && mouseY < 60){
  drawSquares(120,40);
} else {
fill(255);
}
if (mouseX > 80 && mouseX < 100 && mouseY > 40 && mouseY < 60){
  drawSquares(80,40);
} else {
fill(255);
}

if (mouseX > 100 && mouseX < 120 && mouseY > 40 && mouseY < 60){
  drawSquares(100,40);
} else {
fill(255);
}

if (mouseX > 120 && mouseX < 140 && mouseY > 40 && mouseY < 60){
  drawSquares(120,40);
} else {
fill(255);
}

if (mouseX > 140 && mouseX < 160 && mouseY > 40 && mouseY < 60){
  drawSquares(140,40);
} else {
fill(255);
}

if (mouseX > 160 && mouseX < 180 && mouseY > 40 && mouseY < 60){
  drawSquares(160,40);
} else {
fill(255);
}

if (mouseX > 180 && mouseX < 200 && mouseY > 40 && mouseY < 60){
  drawSquares(180,40);
} else {
fill(255);
}

if (mouseX > 200 && mouseX < 220 && mouseY > 40 && mouseY < 60){
  drawSquares(200,40);
} else {
fill(255);
}
//Horizontal row 4
if (mouseX > 0 && mouseX < 20 && mouseY > 60 && mouseY < 80){
  drawSquares(0,60);
} else {
fill(255);
}

if (mouseX > 20 && mouseX < 40 && mouseY > 60 && mouseY < 80){
  drawSquares(20,60);
} else {
fill(255);
}
if (mouseX > 40 && mouseX < 60 && mouseY > 60 && mouseY < 80){
  drawSquares(40,60);
} else {
fill(255);
}
if (mouseX > 60 && mouseX < 80 && mouseY > 60 && mouseY < 80){
  drawSquares(60,60);
} else {
fill(255);
}
if (mouseX > 80 && mouseX < 100 && mouseY > 60 && mouseY < 80){
  drawSquares(80,60);
} else {
fill(255);
}

if (mouseX > 100 && mouseX < 120 && mouseY > 60 && mouseY < 80){
  drawSquares(100,60);
} else {
fill(255);
}

if (mouseX > 120 && mouseX < 140 && mouseY > 60 && mouseY < 80){
  drawSquares(120,60);
} else {
fill(255);
}
if (mouseX > 80 && mouseX < 100 && mouseY > 60 && mouseY < 80){
  drawSquares(80,60);
} else {
fill(255);
}

if (mouseX > 100 && mouseX < 120 && mouseY > 60 && mouseY < 80){
  drawSquares(100,60);
} else {
fill(255);
}

if (mouseX > 120 && mouseX < 140 && mouseY > 60 && mouseY < 80){
  drawSquares(120,60);
} else {
fill(255);
}

if (mouseX > 140 && mouseX < 160 && mouseY > 60 && mouseY < 80){
  drawSquares(140,60);
} else {
fill(255);
}

if (mouseX > 160 && mouseX < 180 && mouseY > 60 && mouseY < 80){
  drawSquares(160,60);
} else {
fill(255);
}

if (mouseX > 180 && mouseX < 200 && mouseY > 60 && mouseY < 80){
  drawSquares(180,60);
} else {
fill(255);
}

if (mouseX > 200 && mouseX < 220 && mouseY > 60 && mouseY < 80){
  drawSquares(200,60);
} else {
fill(255);
}


//Horizontal row 5
if (mouseX > 0 && mouseX < 20 && mouseY > 80 && mouseY < 100){
  drawSquares(0,80);
} else {
fill(255);
}

if (mouseX > 20 && mouseX < 40 && mouseY > 80 && mouseY < 100){
  drawSquares(20,80);
} else {
fill(255);
}
if (mouseX > 40 && mouseX < 60 && mouseY > 80 && mouseY < 100){
  drawSquares(40,80);
} else {
fill(255);
}
if (mouseX > 60 && mouseX < 80 && mouseY > 80 && mouseY < 100){
  drawSquares(60,80);
} else {
fill(255);
}
if (mouseX > 80 && mouseX < 100 && mouseY > 80 && mouseY < 100){
  drawSquares(80,80);
} else {
fill(255);
}

if (mouseX > 100 && mouseX < 120 && mouseY > 80 && mouseY < 100){
  drawSquares(100,80);
} else {
fill(255);
}

if (mouseX > 120 && mouseX < 140 && mouseY > 80 && mouseY < 100){
  drawSquares(120,80);
} else {
fill(255);
}
if (mouseX > 80 && mouseX < 100 && mouseY > 80 && mouseY < 100){
  drawSquares(80,80);
} else {
fill(255);
}

if (mouseX > 100 && mouseX < 120 && mouseY > 80 && mouseY < 100){
  drawSquares(100,80);
} else {
fill(255);
}

if (mouseX > 120 && mouseX < 140 && mouseY > 80 && mouseY < 100){
  drawSquares(120,80);
} else {
fill(255);
}

if (mouseX > 140 && mouseX < 160 && mouseY > 80 && mouseY < 100){
  drawSquares(140,80);
} else {
fill(255);
}

if (mouseX > 160 && mouseX < 180 && mouseY > 80 && mouseY < 100){
  drawSquares(160,80);
} else {
fill(255);
}

if (mouseX > 180 && mouseX < 200 && mouseY > 80 && mouseY < 100){
  drawSquares(180,80);
} else {
fill(255);
}

if (mouseX > 200 && mouseX < 220 && mouseY > 80 && mouseY < 100){
  drawSquares(200,80);
} else {
fill(255);
}


//Horizontal row 6
if (mouseX > 0 && mouseX < 20 && mouseY > 100 && mouseY < 120){
  drawSquares(0,100);
} else {
fill(255);
}

if (mouseX > 20 && mouseX < 40 && mouseY > 100 && mouseY < 120){
  drawSquares(20,100);
} else {
fill(255);
}
if (mouseX > 40 && mouseX < 60 && mouseY > 100 && mouseY < 120){
  drawSquares(40,100);
} else {
fill(255);
}
if (mouseX > 60 && mouseX < 80 && mouseY > 100 && mouseY < 120){
  drawSquares(60,100);
} else {
fill(255);
}
if (mouseX > 80 && mouseX < 100 && mouseY > 100 && mouseY < 120){
  drawSquares(80,100);
} else {
fill(255);
}

if (mouseX > 100 && mouseX < 120 && mouseY > 100 && mouseY < 120){
  drawSquares(100,100);
} else {
fill(255);
}

if (mouseX > 120 && mouseX < 140 && mouseY > 100 && mouseY < 120){
  drawSquares(120,100);
} else {
fill(255);
}
if (mouseX > 80 && mouseX < 100 && mouseY > 100 && mouseY < 120){
  drawSquares(80,100);
} else {
fill(255);
}

if (mouseX > 100 && mouseX < 120 && mouseY > 100 && mouseY < 120){
  drawSquares(100,100);
} else {
fill(255);
}

if (mouseX > 120 && mouseX < 140 && mouseY > 100 && mouseY < 120){
  drawSquares(120,100);
} else {
fill(255);
}

if (mouseX > 140 && mouseX < 160 && mouseY > 100 && mouseY < 120){
  drawSquares(140,100);
} else {
fill(255);
}

if (mouseX > 160 && mouseX < 180 && mouseY > 100 && mouseY < 120){
  drawSquares(160,100);
} else {
fill(255);
}

if (mouseX > 180 && mouseX < 200 && mouseY > 100 && mouseY < 120){
  drawSquares(180,100);
} else {
fill(255);
}

if (mouseX > 200 && mouseX < 220 && mouseY > 100 && mouseY < 120){
  drawSquares(200,100);
} else {
fill(255);
}

//Horizontal row 7
if (mouseX > 0 && mouseX < 20 && mouseY > 120 && mouseY < 140){
  drawSquares(0,120);
} else {
fill(255);
}

if (mouseX > 20 && mouseX < 40 && mouseY > 120 && mouseY < 140){
  drawSquares(20,120);
} else {
fill(255);
}
if (mouseX > 40 && mouseX < 60 && mouseY > 120 && mouseY < 140){
  drawSquares(40,120);
} else {
fill(255);
}
if (mouseX > 60 && mouseX < 80 && mouseY > 120 && mouseY < 140){
  drawSquares(60,120);
} else {
fill(255);
}
if (mouseX > 80 && mouseX < 100 && mouseY > 120 && mouseY < 140){
  drawSquares(80,120);
} else {
fill(255);
}

if (mouseX > 100 && mouseX < 120 && mouseY > 120 && mouseY < 140){
  drawSquares(100,120);
} else {
fill(255);
}

if (mouseX > 120 && mouseX < 140 && mouseY > 120 && mouseY < 140){
  drawSquares(120,120);
} else {
fill(255);
}
if (mouseX > 80 && mouseX < 100 && mouseY > 120 && mouseY < 140){
  drawSquares(80,120);
} else {
fill(255);
}

if (mouseX > 100 && mouseX < 120 && mouseY > 120 && mouseY < 140){
  drawSquares(100,120);
} else {
fill(255);
}

if (mouseX > 120 && mouseX < 140 && mouseY > 120 && mouseY < 140){
  drawSquares(120,120);
} else {
fill(255);
}

if (mouseX > 140 && mouseX < 160 && mouseY > 120 && mouseY < 140){
  drawSquares(140,120);
} else {
fill(255);
}

if (mouseX > 160 && mouseX < 180 && mouseY > 120 && mouseY < 140){
  drawSquares(160,120);
} else {
fill(255);
}

if (mouseX > 180 && mouseX < 200 && mouseY > 120 && mouseY < 140){
  drawSquares(180,120);
} else {
fill(255);
}

if (mouseX > 200 && mouseX < 220 && mouseY > 120 && mouseY < 140){
  drawSquares(200,120);
} else {
fill(255);
}


//Horizontal row 8
if (mouseX > 0 && mouseX < 20 && mouseY > 140 && mouseY < 160){
  drawSquares(0,140);
} else {
fill(255);
}

if (mouseX > 20 && mouseX < 40 && mouseY > 140 && mouseY < 160){
  drawSquares(20,140);
} else {
fill(255);
}
if (mouseX > 40 && mouseX < 60 && mouseY > 140 && mouseY < 160){
  drawSquares(40,140);
} else {
fill(255);
}
if (mouseX > 60 && mouseX < 80 && mouseY > 140 && mouseY < 160){
  drawSquares(60,140);
} else {
fill(255);
}
if (mouseX > 80 && mouseX < 100 && mouseY > 140 && mouseY < 160){
  drawSquares(80,140);
} else {
fill(255);
}

if (mouseX > 100 && mouseX < 120 && mouseY > 140 && mouseY < 160){
  drawSquares(100,140);
} else {
fill(255);
}

if (mouseX > 120 && mouseX < 140 && mouseY > 140 && mouseY < 160){
  drawSquares(120,140);
} else {
fill(255);
}
if (mouseX > 80 && mouseX < 100 && mouseY > 140 && mouseY < 160){
  drawSquares(80,140);
} else {
fill(255);
}

if (mouseX > 100 && mouseX < 120 && mouseY > 140 && mouseY < 160){
  drawSquares(100,140);
} else {
fill(255);
}

if (mouseX > 120 && mouseX < 140 && mouseY > 140 && mouseY < 160){
  drawSquares(120,140);
} else {
fill(255);
}

if (mouseX > 140 && mouseX < 160 && mouseY > 140 && mouseY < 160){
  drawSquares(140,140);
} else {
fill(255);
}

if (mouseX > 160 && mouseX < 180 && mouseY > 140 && mouseY < 160){
  drawSquares(160,140);
} else {
fill(255);
}

if (mouseX > 180 && mouseX < 200 && mouseY > 140 && mouseY < 160){
  drawSquares(180,140);
} else {
fill(255);
}

if (mouseX > 200 && mouseX < 220 && mouseY > 140 && mouseY < 160){
  drawSquares(200,140);
} else {
fill(255);
}


//Horizontal row 9
if (mouseX > 0 && mouseX < 20 && mouseY > 160 && mouseY < 180){
  drawSquares(0,160);
} else {
fill(255);
}

if (mouseX > 20 && mouseX < 40 && mouseY > 160 && mouseY < 180){
  drawSquares(20,160);
} else {
fill(255);
}
if (mouseX > 40 && mouseX < 60 && mouseY > 160 && mouseY < 180){
  drawSquares(40,160);
} else {
fill(255);
}
if (mouseX > 60 && mouseX < 80 && mouseY > 160 && mouseY < 180){
  drawSquares(60,160);
} else {
fill(255);
}
if (mouseX > 80 && mouseX < 100 && mouseY > 160 && mouseY < 180){
  drawSquares(80,160);
} else {
fill(255);
}

if (mouseX > 100 && mouseX < 120 && mouseY > 160 && mouseY < 180){
  drawSquares(100,160);
} else {
fill(255);
}

if (mouseX > 120 && mouseX < 140 && mouseY > 160 && mouseY < 180){
  drawSquares(120,160);
} else {
fill(255);
}
if (mouseX > 80 && mouseX < 100 && mouseY > 160 && mouseY < 180){
  drawSquares(80,160);
} else {
fill(255);
}

if (mouseX > 100 && mouseX < 120 && mouseY > 160 && mouseY < 180){
  drawSquares(100,160);
} else {
fill(255);
}

if (mouseX > 120 && mouseX < 140 && mouseY > 160 && mouseY < 180){
  drawSquares(120,160);
} else {
fill(255);
}

if (mouseX > 140 && mouseX < 160 && mouseY > 160 && mouseY < 180){
  drawSquares(140,160);
} else {
fill(255);
}

if (mouseX > 160 && mouseX < 180 && mouseY > 160 && mouseY < 180){
  drawSquares(160,160);
} else {
fill(255);
}

if (mouseX > 180 && mouseX < 200 && mouseY > 160 && mouseY < 180){
  drawSquares(180,160);
} else {
fill(255);
}

if (mouseX > 200 && mouseX < 220 && mouseY > 160 && mouseY < 180){
  drawSquares(200,160);
} else {
fill(255);
}
//Horizontal row 10
if (mouseX > 0 && mouseX < 20 && mouseY > 180 && mouseY < 200){
  drawSquares(0,180);
} else {
fill(255);
}

if (mouseX > 20 && mouseX < 40 && mouseY > 180 && mouseY < 200){
  drawSquares(20,180);
} else {
fill(255);
}
if (mouseX > 40 && mouseX < 60 && mouseY > 180 && mouseY < 200){
  drawSquares(40,180);
} else {
fill(255);
}
if (mouseX > 60 && mouseX < 80 && mouseY > 180 && mouseY < 200){
  drawSquares(60,180);
} else {
fill(255);
}
if (mouseX > 80 && mouseX < 100 && mouseY > 180 && mouseY < 200){
  drawSquares(80,180);
} else {
fill(255);
}

if (mouseX > 100 && mouseX < 120 && mouseY > 180 && mouseY < 200){
  drawSquares(100,180);
} else {
fill(255);
}

if (mouseX > 120 && mouseX < 140 && mouseY > 180 && mouseY < 200){
  drawSquares(120,180);
} else {
fill(255);
}
if (mouseX > 80 && mouseX < 100 && mouseY > 180 && mouseY < 200){
  drawSquares(80,180);
} else {
fill(255);
}

if (mouseX > 100 && mouseX < 120 && mouseY > 180 && mouseY < 200){
  drawSquares(100,180);
} else {
fill(255);
}

if (mouseX > 120 && mouseX < 140 && mouseY > 180 && mouseY < 200){
  drawSquares(120,180);
} else {
fill(255);
}

if (mouseX > 140 && mouseX < 160 && mouseY > 180 && mouseY < 200){
  drawSquares(140,180);
} else {
fill(255);
}

if (mouseX > 160 && mouseX < 180 && mouseY > 180 && mouseY < 200){
  drawSquares(160,180);
} else {
fill(255);
}

if (mouseX > 180 && mouseX < 200 && mouseY > 180 && mouseY < 200){
  drawSquares(180,180);
} else {
fill(255);
}

if (mouseX > 200 && mouseX < 220 && mouseY > 180 && mouseY < 200){
  drawSquares(200,180);
} else {
fill(255);
}

}


