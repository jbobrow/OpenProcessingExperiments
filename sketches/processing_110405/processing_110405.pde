
float x = 250, y = 250;
float a=random(-1, 1);
int c=100;
int d=-100;
int e=100, f=-100, g=100, h=-100,m=100, n=-100,o=100,p=-100;
int i=0, j=0;
int pgrade=0, mgrade=0;
int score=pgrade+mgrade;
float  xSpeed=random(2, 4);
float  ySpeed=random(2, 4);
PImage img;
PImage imgp;
PImage imgb;
PFont font;
import ddf.minim.*;
AudioPlayer player;
Minim minim;//audio context

void setup() {
  
  minim = new Minim(this);
  player = minim.loadFile("08 - Tanoshii Hitotoki(1).mp3", 2048);
  player.loop();

  size(800, 600);
  noStroke();  
  noCursor();
  img=loadImage("background.jpg");
  image(img, 0, 0);
  imgp=loadImage("background2.jpg");
  imgb=loadImage("a.png");
}

void draw() {

  if (keyCode==ENTER) {

    image(imgp, 0, 0);

    fill(255);
    float mx1=constrain(mouseX, 30, 770);
    rect(mx1-30, 470, 100, 10);
    rect(mx1-30, 30, 100, 10);

    float my1=constrain(mouseY, 25, 470);
    rect(30, my1-30, 10, 100);
    rect(760, my1-30, 10, 100);

    image(imgb, x, y, 80, 80);
    x = x + xSpeed;
    y = y + ySpeed;


    if (x > width-70 || x < -5 ) {
      score = score - 30;
      xSpeed = -xSpeed ; 
      i++;
    }

    if (y>470||y<0) {
      score = score - 30;
      ySpeed = -ySpeed;
      i++;
    }

    
    if (i>=5) {
     
     textFont(createFont("SynchroLET",50));
     text("GAME OVER!", 490, height-30);
     xSpeed=0;
     ySpeed=0;
     x= 400;
     y= 300;
     
         font=loadFont("HeartAttack-48.vlw");
    textFont(font, 45);
    fill(252, 252, 20);
    text("Press 'ENTER' to start the game", c, d);
    c=80;
    d=140;

    textFont(createFont("Dialog", 20));
    text("Control the net with your mouse, ", e, f);
    e=450;
    f=200;
    text("up and down, left and right.",m,n);
    m=460;
    n=230;
    text("You only have 5 chances.",o,p);
    o=470;
    p=260;
    text("So don't let it run away!", g, h);
    g=480;
    h=290;
     }
     

    if (mouseX-50<=x && mouseX+50>=x && 20<y && y<30 &&ySpeed<0 ) {
      ySpeed = -ySpeed;
      score = score + 10;
    }
    if (y<=405 && y>=395 && mouseX-50<=x && mouseX+50>=x && ySpeed>0 ) {
      ySpeed=-ySpeed;
      score = score + 10;
    }
    if (x>=15 && x<=30 && y<=mouseY+50 && y>=mouseY-50 && xSpeed<0) {
      xSpeed= -xSpeed;
      score = score + 10;
    }
    if (x>=690 && x<=700 && y<=mouseY+50 && y>=mouseY-50 &&xSpeed>0) {
      xSpeed= -xSpeed;
      score = score + 10;
    }

    textFont(createFont("SynchroLET",30));
    fill(255);
    text("Score: "+score, 80, height-30);
    textFont(createFont("SynchroLET", 25));
  }
  else {
    font=loadFont("HeartAttack-48.vlw");
    textFont(font, 45);
    fill(252, 252, 20);
    text("Press 'ENTER' to start the game", c, d);
    c=80;
    d=140;

    textFont(createFont("Dialog", 20));
    text("Control the net with your mouse, ", e, f);
    e=450;
    f=200;
    text("up and down, left and right.",m,n);
    m=460;
    n=230;
     text("You only have 5 chances.",o,p);
    o=470;
    p=260;
    text("So don't let it run away!", g, h);
    g=480;
    h=290;
  }
}

void keyPressed() {
  if (keyPressed==true) {
    x=random(230, 270);
    y=random(230, 270);
    i=0;
    j=0;
    score = 0;
    if (a>0) {
    }
    else {
    }
    xSpeed=random(2, 4);
    ySpeed=random(2, 4);
  }
}


