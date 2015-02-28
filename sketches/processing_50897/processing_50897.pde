
float rectOne=100;
float rectTwo=0;
float x=random(5.0, 20.0);
float y=random(5.0, 20.0);
int dog = 255;
boolean a=true;
boolean b=true;
float r;
float g;
float blu;

void setup() {
  size(320, 480);
  println("Press 'a' to hide top square and 'b' to hide bottom square!");
}

void draw() {
  background(255);
  r=random(255);
  g=random(255);
  blu=random(255);

  if ((rectOne <= (rectTwo + 3)) && (rectOne >= (rectTwo-3))) {
    background(r, g, blu);
    println("x coordinates of rectangles are similar");
  }

  fill(255);
  stroke(r, g, blu);
  strokeWeight(3);
  rectMode(CENTER);
  if (a==true) {
    rect(rectOne, height/3, 75, 75);
    rectOne=rectOne+1;
  }

  if (b==true) {
    rect(rectTwo, 2*height/3, 75, 75);
    rectTwo=rectTwo+2;
  }

  if (rectOne > 350) {
    rectOne = 0;
  }
  if (rectTwo > 350) {
    rectTwo = 0;
  }
}

void keyPressed() {
  if (key=='a') {
    a=!a;
  }

  if (key=='b') {
    b=!b;
  }
}


