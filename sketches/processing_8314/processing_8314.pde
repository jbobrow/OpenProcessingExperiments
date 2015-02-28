
int rotationb = 1;

int directionX = 3;
int directionY = -3;

int mode = 0;

float ballx = 320; //ball xaxis
float bally = 380; 
float cuex = ballx; //cuestick xaxis
float cuey = bally;
float balld = 15; //ball radius
float ballangle = 0;
float ballspeedx = 8.0;
float ballspeedy = 8.0;
float angle;
boolean rotation = true;

float pocketx = 550; //hole
float pockety = 100; 
float pocketr = 50; 

int b1x = 290;   // Button 1 x-coordinate
int b1y = 215;  // Button 1 y-coordinate
int b1w = 220;  // Button 1 width
int b1h = 50;   // Button 1 height

PFont f;
PFont f48;

void setup() {
 size(800, 480);
 smooth();
 ellipseMode(RADIUS);
 f = loadFont("ZebrawoodStd-Fill-28.vlw");
 f48 = loadFont("ZebrawoodStd-Fill-48.vlw");
 textFont(f);
 textAlign(CENTER);
}

void draw() {
 background(#317C28);
 strokeCap(ROUND);
 strokeWeight(2);
 fill(255);
 
 switch (mode) {
   case 0: modeZero(); break;
   case 1: modeOne(); break;
   case 2: modeTwo(); break;
   case 3: modeThree(); break;
   case 4: modeFour(); break;
   case 5: modeFive(); break;
   default: println("Something went wrong!");
 }
 
 if (mode == 0) {
   modeZero(); 
 } 
 else if (mode == 1) {
   modeOne();
 } 
 else if (mode == 2) {
   modeTwo();
 }
 else if (mode == 3) {
   modeThree();
 }
 else if (mode == 4) {
   modeFour();
 }
 else if (mode == 5) {
   modeFive();
 }
 else if (mode == 6) {
   modeSix();
 }
 else if (mode== 7) {
   modeSeven();
 }
}

void mousePressed() {
 switch (mode) {
  case 1: rotation = false; break;
  case 3:
    if (overButton(b1x, b1y, b1w, b1h)) {
	mode = 4;
	rotation = true;
    }
    break;
  case 4: rotation = false; break;
  case 5: rotation = false; break;
  case 6:
    if (overButton(b1x, b1y, b1w, b1h)) {
	mode = 7;
	rotation = true;
    }
    break;
  case 7: rotation = false; break;
  } 
}

void keyPressed() {
   if (mode == 0) {
   mode = 1;
 }
 if (mode == 1 && rotation == false) {
   mode = 2;
   ballangle = angle - PI;
 }
 if (mode == 4 && rotation == false) {
   mode = 5;
   ballangle = angle - PI;
 }
}

void modeZero() {
 textFont(f48);
 fill(0);
 text("Poolio", 390, 70);
 textFont(f);
 textAlign(CENTER);
 text("1. move mouse left and right", 390, 140);
 text("to rotate cuestick", 390, 170);
 text("2. click mouse to choose aim", 390, 230);
 text("3. press the space bar to shoot", 390, 290);
 fill(#6F1208);
 text("press any key to start playing!", 390, 350);
}

void modeOne() {
 pushMatrix();
 translate(cuex, cuey);
 rotate(angle);
 line(balld/2 + 13, 0, balld/2 + 200, 0);//cuestick
 popMatrix();
 
 fill(0);
 ellipse(pocketx, pockety, pocketr, pocketr); //pocket
 
 fill(255);
 ellipse(ballx, bally, balld, balld); //cueball
 if (rotation) {
   angle = map(mouseX, 20, 620, 0, PI*3); 
 }
 
 fill(0);
 text("Level 1", 70, 465);
 
 
}

void modeTwo() {
 fill(0);
 ellipse(pocketx, pockety, pocketr, pocketr); //pocket
 // Draw the ball
 pushMatrix();
 fill(255);
 translate(ballx, bally);
 rotate(ballangle);
 ellipse(0, 0, balld, balld); //ball
 popMatrix();
 // Update position and bounce off walls
 ballx += cos(ballangle) * ballspeedx;
 bally += sin(ballangle) * ballspeedy;
 checkWalls();
 
 if (circleIntersect(ballx, bally, balld, pocketx, pockety, pocketr) == true) {
  mode = 3;
 }
 
 ballspeedx *= 0.99;
 ballspeedy *= 0.99;
 
 fill(0);
 text("Level 1", 70, 465);
}

void obstacle() {
 float rectx = 100; //obstacle
 float recty = 200;
 float rectWidth = 190;
 float rectHeight = 10;
 ballspeedx *= 0.99;
 ballspeedy *= 0.99;
 
 if (ballx > rectx-balld) {
   
 if (ballx > rectx-balld) {
   directionX = -directionX;
 }

 if (bally > recty-balld) {
   directionY = -directionY;
 }
}
}
   
void checkWalls() {
 if (ballx > width-balld) {
   ballx = width-balld;
   ballspeedx *= -1;
 } else if (ballx < balld) {
   ballx = balld;
   ballspeedx *= -1;
 } else if (bally > height-balld) {
   bally = height-balld;
   ballspeedy *= -1;
 } else if (bally < balld) {
   bally = balld;
   ballspeedy *= -1;
 }
}

void modeThree() {
 fill(0);
 ellipse(pocketx, pockety, pocketr, pocketr);
 
 if (overButton(b1x, b1y, b1w, b1h) == true) {
   stroke(0);
   fill(255);
 } 
 else {
   stroke(0);
   fill(153); 
 }
 rect(b1x, b1y, b1w, b1h);
 textAlign(CENTER);
 fill(0);
 text("Go to level 2", b1x + b1w/2, b1y + 32);
 
 fill(0);
 text("Level 1", 70, 465);
 stroke(0, 0); 
}

void modeFour() {
 float rectx = 200; //obstacle
 float recty = 200;
 float rectWidth = 190;
 float rectHeight = 10;
 float ballx = 320;
 float bally = 380;
  
 stroke(0);
 fill(0);
 ellipse(pocketx-460, pockety, pocketr-10, pocketr-10);
 obstacle();
 
 fill(0);
 rect(rectx, recty, rectWidth, rectHeight);
 
 pushMatrix();
 translate(cuex, cuey);
 rotate(angle);
 line(balld/2 + 13, 0, balld/2 + 200, 0);
 popMatrix();
 
 fill(255);
 ellipse(ballx, bally, balld, balld);
 if (rotation) {
   angle = map(mouseX, 50, 620, 0, PI*3); 
 }
 fill(0);
 text("Level 2", 70, 465);
}

void modeFive() {
 float rectx = 200; //obstacle
 float recty = 200;
 float rectWidth = 190;
 float rectHeight = 10;
  
 fill(0);
 float pocketx = 90;
 
 ellipse(pocketx, pockety, pocketr-10, pocketr-10); //pocket
 
 // Draw the ball
 pushMatrix();
 fill(255);
 translate(ballx, bally);
 rotate(ballangle);
 ellipse(0, 0, balld, balld);
 popMatrix();
 
 // Update position and bounce off walls
 ballx += cos(ballangle) * ballspeedx;
 bally += sin(ballangle) * ballspeedy;
 checkWalls();
 obstacle();
 
 fill(0);
 rect(rectx, recty, rectWidth, rectHeight);
 
 if (circleIntersect(ballx, bally, balld, pocketx, pockety, pocketr) == true) {
  mode = 3;
 }
 
 ballspeedx *= 0.99;
 ballspeedy *= 0.99;
 
 fill(0);
 text("Level 2", 70, 465);
}

void modeSix() {
 fill(0);
 ellipse(pocketx-460, pockety, pocketr-10, pocketr-10);

 pushMatrix();
 translate(ballx, bally);
 rotate(ballangle);
 stroke(0, 0);
 fill(0, 0);
 ellipse(0, 0, balld, balld);
 popMatrix();
 
 if (overButton(b1x, b1y, b1w, b1h) == true) {
   stroke(0);
   fill(255);
 } 
 else {
   stroke(0);
   fill(153); 
 }
 rect(b1x, b1y, b1w, b1h);
 textAlign(CENTER);
 fill(0);
 text("Go to level 3", b1x + b1w/2, b1y + 32);
 
 fill(0);
 text("Level 2", 70, 465);
 stroke(0, 0); 
}

void modeSeven() {
 stroke(0);
 fill(0);
 ellipse(pocketx, pockety, pocketr, pocketr);
  // Draw the ball
  
 pushMatrix();
 translate(cuex, cuey);
 rotate(angle);
 line(balld/2 + 13, 0, balld/2 + 200, 0);
 popMatrix();
 
 fill(255);
 ellipse(ballx, bally, balld, balld);
 if (rotation) {
   angle = map(mouseX, 20, 620, 0, PI*3); 
 }
}

boolean overButton(int x, int y, int w, int h) {
 if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
   return true; 
 } 
 else {
   return false; 
 }
}

boolean circleIntersect(float bx, float by, float br, float px, float py, float pr) {
 if (dist(bx, by, px, py) < br-10 + pr-10) {
   return true;
 } else {
   return false;
 }
}

boolean rectCircle(float bx, float by, float br, float rx, float ry, float rw, float rh) {
 float circleDistanceX = abs(bx - rx - rw/2);
 float circleDistanceY = abs(by - ry - rh/2);
 
 if (circleDistanceX > (rw/2 + br)) {return false; }
 if (circleDistanceY > (rh/2 + br)) { return false; }
 if (circleDistanceX <= rw/2) { return true; } 
 if (circleDistanceY <= rh/2) { return true; }

 float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
 return cornerDistance <= pow(br, 2);
}

