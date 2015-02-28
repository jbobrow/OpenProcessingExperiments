
float px, py, px2, py2;
float angle, angle2;
float radius = 20;
float frequency = 5;
float frequency2 = 5;
float x, x2;
int randomRed=0; //Global variable- Int-color
int randomBlue=0; //Global variable- Int-color
int randomGreen=0; //Global variable- Int-color
int randomBlack=0;
float c1=0;
float d1=0;
float c2=0;
float d2=600;
float c3=200;
float d3=0;
float c4=200;
float d4=600;
float randomDec=0;
float e3=0;
float f3=0;
float e4=0;
float f4=0;
float growingRadiuse2=600;
float growingRadiusf2=600;
boolean boolGrowing=false;
float growingFont=1;

void setup() {
  size(1200, 600);
  background(0);
}


void draw() {
  smooth();
  //Draw dots throughout the page with a changing font if mouse clicked
  for (int a = 0; a< width/2; a++) {
    randomBlack=int(random(50));
    stroke(randomBlack); 
    if (boolGrowing==true) {
      if (growingFont<5) {
        growingFont++;
      }
      else {
        growingFont=1;
      }
    }
    strokeWeight(growingFont); 
    px2 = width/8 + cos(radians(angle2))*(radius/2);
    py2 = 75+(.54*a) + sin(radians(angle2))*(radius/2);
    point(a+mouseX, py2+mouseY);
    angle2 -= frequency2;
    rotate(.9);
  }

  //Draw differing curves on the top left of the screen with changing color
  for (int b=0;b<600;b++) {
    randomRed=int(random(255));
    randomGreen=int(random(255));
    randomBlue=int(random(255));
    c1=random(300);
    d1=random(400);
    c2=random(300);
    d2=random(400);
    c3=random(300);
    d3=random(400);
    c4=random(300);
    d4=random(400);
    randomDec=random(.2);
    strokeWeight(.5);
    rotate(randomDec);
    fill(255, 25);
    bezier(c1, d1, c2, d2, c3, d3, c4, d4);
  }

  //Draw curves eminating from the bezier curves with changing locations based on the mouse
  if (growingRadiuse2<1200) {
    growingRadiuse2++;
  }
  else {
    growingRadiuse2=600;
  }
  if (growingRadiuse2<1200) {
    growingRadiusf2++;
  }
  else {
    growingRadiusf2=600;
  }
  e3=random(200);
  f3=random(100);
  e4=random(200);
  f4=random(200);
  randomRed=int(random(255));
  randomGreen=int(random(255));
  randomBlue=int(random(255));
  stroke(randomRed,randomGreen,randomBlue);
  curve(mouseX, mouseY, growingRadiuse2, growingRadiusf2, e3, f3, e4, f4);
}

void mouseClicked() {
  boolGrowing=!boolGrowing;
}
