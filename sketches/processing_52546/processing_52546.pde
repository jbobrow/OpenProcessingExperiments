
/*
 * Assignment    3
 * Name:         Mfon-ido Ime Akpan
 * E-mail:       makpan@brynmawr.edu
 * Course:       CS 110 - 02
 * Submitted:    1/15/2012
 This is the launching of a new ecological bicycle. The platform has lights in it and the ceiling of the room has colored flowery baloons suspended from it. Complex shape 1 is the bicycle and complex shape two is the front of the platform with the lights.
 The baloons also show randomization and some variety in size. The theme does not require a scale factor and horizon therefore they are not used. 
 */
PFont f; //variable to load text
int w; //variable for width of sketch
int h; //variable for height of ske
int x; //variables for drawing x position of different parts of sketch
int y; //variable for drawing y position of different parts of sketch
int cB = color (235, 240, 15); //background color
int cS = color (240, 154, 15, 100); //flower stroke color
float angle; //variable for determining angle of trigonometric circles
int spacingW= 30; //variable for width spacing of platform shapes
int spacingH = 40; //variable for height spacing of platform shapes


//set up canvas
void setup () {
  size (800, 600);
  background (cB);
  w = width;
  h= height;
  noStroke ();
  smooth ();
  fill (255);

  //draw platform for bike  
  stroke (0, 0, 255);
  strokeWeight (2);
  line (0, h/2+h/6, w/10-10, h/2-50);
  line (w/10-10, h/2-50, w/10-10, h/10+20);
  line (w/10-10, h/2-50, w/2+w/4+70, h/2-50);
  line (w/2+w/4+70, h/2-50, w, h/2+h/6);
  line (w/2+w/4+70, h/2-50, w/2+w/4+70, h/10+20);

  //prints the text to announce the bicycle
  f = loadFont ("TimesNewRomanPS-BoldMT-48.vlw");
  textFont(f, 32);
  text("The world's first ecofriendly bicycle!", w/8, h/5);

  //draws the flowery baloons
  for (int i=0; i<height; i++) { 
    stroke (cS);
    strokeWeight(1);
    drawCircle(int (random(width)), int(random(0, h/12)), int(random(30)));
    int radius = 5;
    float angle = 2*PI/12;
  }
}
//function for the baloons
void drawCircle (int centerw, int centerh, int radius) {
  int steps = 12;
  int size =  radius*2;
  float angle = 2*PI/steps;
  fill (random(255), random(255), random(255), 100);  
  for (int i=0; i<steps; i++) {
    float x = cos(angle*i)*radius + centerw;
    float y = sin(angle*i)*radius + centerh; 
    ellipse(x, y, size, size);
  }
  //this draws the wheels of the bicycle
  drawWheel (w/2, h/2, w/8);
  drawWheel (w/4, h/2, w/8);
}
//function for bicycle wheels
void drawWheel (int x, int y, int size) {
  int steps = 12;
  int radius = 50;
  int centerx = x;
  int centery = y;
  stroke (255, 150);
  float angle = 2*PI/steps;
  for (int i=0; i<steps; i++) {
    float xloc = cos (angle*i)*radius + centerx;
    float yloc = sin (angle*i)*radius + centery;
    strokeWeight(1);
    stroke(255);
    line (centerx, centery, xloc, yloc);
    noFill();
    strokeWeight (10);
    stroke(0);
    ellipse (centerx, centery, radius*2, radius*2);
  }
   //iteration that draws airvents on the stage
  for (int i=w/10+20; i<w-w/8-50; i+=40) {
    fill (255);
    ellipse (i, h/3+30, 10, 10);
  }
}
void draw () { 

  //calls the various functions for the sketchs theme
  drawColumns(0, 0, width/2, height/2); //draws columns of fence
  drawRows (0, 0, width/2, height/2);    //draws rows of fence
  drawTriangles (0, 0, width/2, height/2); //draws triangles in fence
  drawCircles (0, 0, width/2, height/2); //draws circles in fence
  drawBars (0, 0, width/2, height/2); //draws bicycle bars
  drawPedal (0, 0, width/2, height/2); //draws pedal
  drawSeat (0, 0, width/2, height/2); //draws seat 

  //indicates x and y position of objects in sketch
  println (mouseX + "   "+mouseY);
}

//bicycle parts
void drawBars (int xpos, int ypos, int size, int num ) {//put all into a function
  stroke (0);
  strokeWeight(10);
  smooth ();
  line (w/4+w/8-46, h/2, w/2-55, h/2);
  line (w/2-100, h/2, w/2-80, h/3-10);
  line (w/2-60, h/3-20, w/2-25, h/2-50);
  line (w/2-40, h/3-20, w/2+20, h/3-45);
  line (w/2+20, h/4, w/2-10, h/3+45);
  line (w/2+5, h/4-20, w/2+40, h/3-30);
}
//draws pedal
void drawPedal (int xpos, int ypos, int size, int  num) {
  quad (w/2-w/8, h/2+10, w/2-w/8-10, h/2+20, w/2-w/8+5, h/2+20, w/2-w/8+10, h/2+10);
}
//draws seat
void drawSeat (int xpos, int ypos, int size, int num ) {
  ellipse (w/2-80, h/3-20, 70, 10);
}


//fence columns
void drawColumns (int xcol, int ycol, int size, int num) {
  for (int xCol = h/2+h/6; xCol<=h; xCol = xCol + spacingW) {
    stroke (0, 0, 255);
    strokeWeight (4);    
    line (0, xCol, w, xCol);
  }
}
//fence rows
void drawRows (int xrows, int yrows, int size, int num) {
  for (int xRows=0; xRows<width; xRows+=spacingH) {
    stroke (255, 0, 0);
    line (xRows, h/2+h/6, xRows, h);
  }
}
//fence circles
void drawCircles (int xcir, int ycir, int size, int num ) {
  for (int xCir = 20; xCir < width; xCir+=40) {
    strokeWeight (2);
    stroke (255, 0, 0);
    ellipse (xCir, (h/2)+(h/6)+15, w/32, h/24);
  }
  for (int xCir = 20; xCir < width; xCir+=40) {
    strokeWeight (2);
    stroke (255, 0, 0);
    fill (random(255), random (255), random(255));
    ellipse (xCir, (h/2)+(h/3)+5, w/32, h/24);
  }
}

//fence triangles
void drawTriangles (int xpoint, int ypoint, int size, int num) {
  for (int xPoint = 20; xPoint<width; xPoint+=40) {
    stroke (0, 0, 255);
    triangle (xPoint, h/2+h/6+35, xPoint-10, h/2+h/6+40, xPoint+10, h/2+h/6+50);
  }
  for (int xPoint = 20; xPoint<width; xPoint+=40) {
    stroke (0, 0, 255);
    triangle (xPoint, h/2+h/6+80, xPoint-10, h/2+h/6+40, xPoint+10, h/2+h/6+50);
  }
  for (int xPoint = 20; xPoint<width; xPoint+=40) {
    stroke (0, 0, 255);
    triangle (xPoint, h/2+h/6+125, xPoint-10, h/2+h/6+135, xPoint+10, h/2+h/6+145);
  }
  for (int xPoint = 20; xPoint<width; xPoint+=40) {
    stroke (0, 0, 255);
    triangle (xPoint, h/2+h/6+175, xPoint-10, h/2+h/6+135, xPoint+10, h/2+h/6+145);
  }
}


