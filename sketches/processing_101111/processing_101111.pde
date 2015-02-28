
float a=12;
float b=12;
float c=3;
float d=4;
PImage tryagain;
PImage gameover;
int score=0;
int level=12;
int life=4;
 
void setup() {
  size (275, 450);
  tryagain = loadImage("tryagain.svg");
  gameover = loadImage("gameover.svg");
}
 
void draw() {
  frameRate(level);
  background(16,175,87);
  noStroke();
  fill(65, mouseY, mouseX);
  ellipse(a=a+c, b=b+d, 44, 44);
  fill(0);
  rect (mouseX-80, 125, 40, 15);
  text(score, 30, 5);
  text(life, 200, 15);
 
 
  if (b>height) {
    image(tryagain, 25, 250);
    image(gameover, 15, 150);
    if ((mouseX>55)&&(mouseX<155) &&(mouseY>550)&&(mouseY<260)&&mousePressed;) {
      a=19;
      b=19;
      life=life-4;
      level=12;
    }
  }
  if (a>width) {
    c=-1;
  }
  if (a<1) {
    c=2;
  }
  if (b<1) {
    d=3;
   }
  if (dist(a, b, mouseX, 520)<60 && b>450) {
    d=-2;
    level=level+13;
    score=score+2;
  }
  if (life<0) {
    image(getalife, 0, 0);
  }
}
