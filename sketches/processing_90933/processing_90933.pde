
//Loris Uzan
// Creative Computing
// 2/26/2013

float a=15;
float b=15;
float c=1;
float d=2;
PImage tryagain;
PImage gameover;
PImage getalife;
int score=0;
int level=120;
int life=3;

void setup() {
  size (350, 600);
  tryagain = loadImage("tryagain.png");
  gameover = loadImage("gameover.png");
  getalife = loadImage("getalife.jpg");
}

void draw() { 
  frameRate(level);
  background(255);
  noStroke();
  fill(#02B900);
  ellipse(a=a+c, b=b+d, 20, 20);
  fill(0);
  rect (mouseX-40, 550, 80, 10);
  text(score, 50, 10);
  text(life, 300,10);
  

  if (b>height) {
    image(tryagain, 75, 450);
    image(gameover, 25, 200);
    if ((mouseX>75)&&(mouseX<275) &&(mouseY>450)&&(mouseY<539)&&mousePressed) {
      a=15;
      b=15;
      life=life-1;
      level=120;
    }
  }
  if (a>width) {
    c=-1;
  }
  if (a<0) {
    c=1;
  }
  if (b<0) {
    d=2;
  }
  if (dist(a, b, mouseX, 550)<40 && b>540) {
    d=-2;
    level=level+10;
    score=score+5;
  }
  if (life<0){
    image(getalife,0,0);
  }
}



