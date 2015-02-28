
float xpos;
float ypos;

float xZiel;
float yZiel;
float durchmesser = 40;

//monster1
int x = 300;
int speedX = 0;
int y = 0;
int speedY = 2;

//---monster2
int x2 = 550;
int speedX2 = 0;
int y2 = 0;
int speedY2 = 6;

//---monster3
int x3 = 700;
int speedX3 = 0;
int y3 = 0;
int speedY3 = 1;

PImage b;
PFont font;

boolean gameState = true;

void setup() {

  size(900, 400);

  smooth();

  xpos = 0;
  ypos = height/2;

  xZiel = xpos;
  yZiel = ypos;

  b = loadImage("sfondo.jpg");

  //font = loadFont ("Serif-130.vlw");
  //textFont(font, 30);
}

//-----ballon
void draw() {

  background(200);

  // draw background
  image(b, 0, 0);

  if (dist(xpos, ypos, x, y) < 50 || dist(xpos, ypos, x2, y2) < 50 || dist(xpos, ypos, x3, y3) < 50) {
    gameState = false;

    fill(60);

    textSize(150);
    text("game over", 120, height/2);
    textSize(30);

    text("Press mouse left to restart", 400, 300);
  }
  if (gameState == true) {
    float xd = xZiel - xpos;
    float yd = yZiel - ypos;
    xpos = xpos + xd / 30;
    ypos = ypos + yd / 30;

    // BALLON
    fill(0);
    noStroke();
    ellipse(xpos, ypos, 40, 40);

    fill(250, 50, 120);

    triangle(xpos-3, ypos+50, xpos+6, ypos+30, xpos+10, ypos+50);
    ellipse (xpos, ypos, durchmesser+20, durchmesser+40);

    fill(255);
    strokeWeight(1);
    ellipse(xpos, ypos-10, 15, 15);
    ellipse(xpos+13, ypos-10, 15, 15);
    fill(0);
    ellipse(xpos, ypos-10, 5, 5);
    ellipse(xpos+13, ypos-10, 5, 5);
    fill(255);

    ellipse(xpos+5, ypos+20, 15, 20);
    noFill();
    stroke(0);
    curve(xpos, ypos+150, 50, xpos+900, xpos, ypos+50, ypos, 2);
    // END BALLON
  }
  else {
    // BALLON
    fill(0);
    noStroke();
    ellipse(xpos, ypos, 40, 40);

    fill( 0);




    fill(255);
    strokeWeight(1);
    ellipse(xpos, ypos-10, 20, 20);
    ellipse(xpos+18, ypos-10, 15, 15);
    fill(0);
    ellipse(xpos, ypos-10, 5, 5);
    ellipse(xpos+18, ypos-10, 5, 5);
    fill(255);


    noFill();
    stroke(0);
    curve(xpos*2, ypos+150, 50, xpos+90, xpos, ypos, ypos, 2);





    // END BALLON
  }

  if (gameState == true) {
    //-----you win 

    if (xpos > 890) {


      fill(200);

      textSize(150);
      text("you win", 200, height/2);
      textSize(30);
      text("press Enter to play again", 400, 300);
    }

    if (keyPressed && key == ENTER) {

      xpos = 0;
      ypos = height/2;
      xZiel = xpos;
      yZiel = ypos;
    }




    //------

    //--monster1

    fill(0);
    stroke(0);
    smooth();
    ellipse(x-15, y-20, 10, 20);
    ellipse(x+20, y-20, 10, 20);
    ellipse(x, y, 80, 50);
    ellipse(x, y+30, 100, 80);
    fill(255);
    //..denti
    ellipse(x-15, y+65, 5, 20);
    ellipse(x+20, y+65, 5, 20);
    //... 
    ellipse(x-10, y, 40, 40);
    ellipse(x+30, y, 30, 30);
    fill(0);

    //----monster2

    ellipse( x2, y2, 100, 60);

    fill( 250);
    ellipse( x2-13, y2-15, 30, 20);
    //occhi

    fill(250);
    ellipse( x2+15, y2-15, 30, 20);


    fill( 250);
    strokeWeight(9);
    ellipse( x2, y2+15, 110, 30);

    strokeWeight(2);
    fill(250, 250, 250);
    triangle(x2-48, y2+10, x2-23, y2+5, x2-28, y2+40);
    triangle(x2-23, y2+5, x2+2, y2+1, x2-8, y2+50);
    triangle(x2+2, y2+1, x2+27, y2+2, x2+12, y2+50);
    triangle(x2+27, y2+4, x2+47, y2+5, x2+37, y2+40);

    strokeWeight(5);
    fill(0);
    line( x2, y2-60, x2, y2-30);
    ellipse( x2, y2-60, 10, 10);

    //--------monster3

    strokeWeight(6);
    line( x3, y3, x3+80, y3);
    line( x3, y3-20, x3+90, y3+20);
    line( x3+10, y3-10, x3+70, y3+30);
    line( x3+10, y3-40, x3+80, y3+40);
    line( x3+40, y3-50, x3+40, y3+50);
    line( x3+50, y3-50, x3+30, y3+50);
    line( x3+60, y3-55, x3+20, y3+45);
    line( x3+70, y3-40, x3+10, y3+40);
    line( x3+80, y3-45, x3, y3+35);
    line( x3+85, y3-45, x3-10, y3+30);
    line( x3+90, y3-40, x3-20, y3+25);

    fill(0);
    ellipse( x3+60, y3+10, 70, 70);
    fill(250, 250, 250);
    ellipse( x3+60, y3+20, 40, 40);
    fill(0);
    ellipse( x3+60, y3+20, 10, 10);
    fill(250, 250, 250);
    ellipse( x3+95, y3+20, 30, 30);
    fill(0);
    ellipse( x3+95, y3+20, 2, 2);



    //...movimento 
    if (x >=200 || x < 15) {
      speedX= speedX * -1;
    }

    if (y >=400 || y < 0) {
      speedY= speedY * -1;
    }

    x = x + speedX;
    y = y + speedY;
    //_______

    if (x2 >=200 || x < 15) {
      speedX2= speedX2 * -1;
    }

    if (y2 >=400 || y2 < 0) {
      speedY2= speedY2 * -1;
    }

    x2 = x2 + speedX2;
    y2 = y2 + speedY2;
    //-------------------

    if (x3 >=200 || x3 < 15) {
      speedX3= speedX3 * -1;
    }

    if (y3 >=400 || y3 < 0) {
      speedY3= speedY3 * -1;
    }

    x3 = x3 + speedX3;
    y3 = y3 + speedY3;



    //---------pupille
    //monster1



    int x1 = 1;
    int speedX1 = 8;
    int y1 = 1;
    int speedY1 = 3; 


    ellipse(x+20, y+2, 10, 10);
    ellipse(x-20, y, 15, 15);
    fill(255);

    if (x >=WIDTH|| x1 < 2) {
      speedX1= speedX1 * -1;
    }

    if (y1 >=width || y1 < 1) {
      speedY1= speedY1 * -1;
    }

    x1 = x1 + speedX1;
    y1 = y1 + speedY1;


    //--monster2

    //____pupilla dx fill(0);


    int x4 = 1;
    int speedX4 = 8;
    int y4 = 1;
    int speedY4 = 3; 


    ellipse( x2+15, y2-8, 10, 20);
    ellipse(x2-15, y2-8, 10, 20);

    fill(255);

    if (x4 >=WIDTH|| x4 < 1) {
      speedX4= speedX4 * -1;
    }

    if (y4 >=width || y4 < 1) {
      speedY4= speedY4 * -1;
    }

    x4 = x4 + speedX4;
    y4 = y4 + speedY4;
  }
}
//---------restart if you lose

void mousePressed() {
  if (gameState == false) {
    gameState = true;
    xpos = 0;
    ypos = height/2;

    xZiel = xpos;
    yZiel = ypos;
  }
}


//------------luftbaloon

void mouseDragged () {
  xZiel = mouseX;
  yZiel = mouseY;
}


