
PFont font;


float circleX, circleY;
float circleRadius = 10;

float rectX = 50;
float rectY = 50;
float rectWidth = 100;
float rectHeight = 50;

float rectA = 250;
float rectB = 250;
float rectwidth = 100;
float rectheight = 50;

float speed = 10;
int level = 0;
int screen = 0;

int last_level = 10
;

void mousePressed() {
  println(mouseX + ","+mouseY);
  if (screen == 0) {
    screen = 1;


  }
}

void setup() {
  size(480, 320);
  ellipseMode(RADIUS);
  font = loadFont("harrington20.vlw");
  textFont(font);
  noStroke();
  smooth();
}

void draw() {
  background(0);


  //------------------------------------------------------screen 0


    if (screen == 0) {
    fill(140,250,90);
    text("Control a ball to avoid the obstacles", 50, 150);

    /*color yellow = color(255,255,0);
     boolean isOverYellow  = button(50, 150, "Yellow", yellow, rollOver);  
     if (isOverYellow && mousePressed) {
     background(255, 255, 0);
     }*/

  } 
  else if (screen == 1) {

    circleX = mouseX;
    circleY = mouseY;



    if ((rectCircleIntersect(rectX, rectY, rectWidth, rectHeight, circleX, circleY, circleRadius))|| (rectCircleIntersect(rectA, rectB, rectwidth, rectheight, circleX, circleY, circleRadius))== true) {

      fill(255, 50, 100);
      screen = 2;

    }
    else {
      fill(20, 240, 230);

    }
    rect(rectX, rectY, rectWidth, rectHeight);
    rect(rectA, rectB, rectwidth, rectheight);
    ellipse(circleX, circleY, circleRadius, circleRadius);
    
    rectX -= speed;
    rectA -= speed;

    if (rectX < -300) {
      rectX = width;
      rectWidth = random(50, 150);
      rectY = random(0, 480);
    }

    if (rectA < -300) {
      rectA = width;
      rectWidth = random(50, 150);
      rectB = random (0, 480);
      level++;
    }

    if ((level % 10) == 0) {
      speed += .1;
    }

    if ( level == (last_level +1)) {
      screen = 3;
    }

  }
  else if (screen == 2) {

    text("You lose.", 130,150);
    text("Play again?", 130, 200);
    reset();
    if (mousePressed) {
      screen = 0;


      // println("you lose");
      speed = 10;
    }
  }
  else if (screen == 3) {
    // you win
    text("You win.", 130,150);
    text("Play again?", 130, 200);
      reset();

    if (mousePressed) {
      screen = 1;
    }
  }

}

void reset() {
 level = 0;
speed = 10; 
rectX = width+50;
rectA = width+250;
}

boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) {

  float circleDistanceX = abs(cx - rx - rw/2);
  float circleDistanceY = abs(cy - ry - rh/2);

  if (circleDistanceX > (rw/2 + cr)) { 
    return false; 
  }
  if (circleDistanceY > (rh/2 + cr)) { 
    return false; 
  }
  if (circleDistanceX <= rw/2) { 
    return true; 
  }
  if (circleDistanceY <= rh/2) { 
    return true; 
  }

  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
  return cornerDistance <= pow(cr, 2);
}

//-------------------------------------------------------   screen 2






