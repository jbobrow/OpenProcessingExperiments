
Traffic c1;
Stickman S1;

float sx = 0;
float sy = 0;
float x = 0;
float y = 0;
float speed = 5;
int score = 0;
color c = 0;
PFont font;
PImage b;


int numCars = 10;
Traffic[] cars = new Traffic[numCars];


void setup() {
  size(600, 600);
  background(50);
  frameRate(40);
  smooth();
  b=loadImage("stickman angel.png");
  font=loadFont("BlackadderITC-Regular-48.vlw");
  for (int i=0;i< cars.length; i++) {
    print(i);
    cars[i]= new Traffic();
    c1=new Traffic();
  }
  S1 = new Stickman(width/2, height-40, 10);
}


void draw() {

  float sx = width/2;
  float sy = height - 40;

  fill(50);
  rect(0, 0, 600, 600);

  fill(255, 255, 255);
  rect(width/2-20, height/2, 40, 200);
  rect(width/2-20, 0, 40, 50);

  for (int i=0;i<cars.length;i++) {
    cars[i].fall(S1.sx, S1.sy);
  }
  S1.steer();
}

class Traffic {
  color c=color(random(255), random(255), random(255));
  float x=random(600);
  float y=random(-height);

  //decides whether or not the stickman has been hit
  private void fall(float sx, float sy) {  

    //makes the cars travel down the screen
    y = y + speed;
    fill(c);
    rect(x, y, 40, 60);
    if (y>height) {
      x=random(600);
      y=random(-200);
    }
    if (dist(x, y, sx, sy)<=20) {
      noLoop();
      x=width+40;
      y=height+100;
      noLoop();
      fill(0);
      rect(width-40, height, 40, 40);
      S1.crash();
      noLoop();
    } 
    if (dist(x, y, sx-40, sy-60)<=20) {
      noLoop();
      x=width+40;
      y=height+100;
      noLoop();
      fill(0);
      rect(width-40, height, 40, 40);
      S1.crash();
      noLoop();
    }
  }
}


class Stickman {
  float sx = 0;
  float sy = 0;
  float m = 6;

  public Stickman(float sx, float sy, float m) {
    this.sx=sx;
    this.sy=sy;
    this.m=m;
  }

  //steers stickman when arrow keys pressed
  public void steer() {
    if (keyPressed) {
      if (keyCode == 38) {
        sy-=m;
      }
      if (keyCode == 37) {
        sx-=m;
      }
      if (keyCode == 39) {
        sx+=m;
      }
      if (keyCode == 40) {
        sy+=m;
      }
      //changes side when stickman goes off screen
      //edits the score and speed of the cars 
      if (sy < 0) {
        score = score + 1;
        speed = speed + 1;
        sy = height;
      }
      if (sx < 0) {
        sx = width;
      }
      if (sy > height) {
        sy = 0;
      }
      if (sx > width) {
        sx = 0;
      }
    }
    //shows current score on screen
    fill(255, 170, 170);
    ellipse(sx, sy, 20, 20);
    fill(0);                         
    text("Score: " + score, 545, 20);
  }
  //what happens when the stickman is hit
  public void crash() {
    noLoop();
    delay(10);
    c=0;
    fill(0);
    rect(0, 0, width, height);
    delay(1000);
    rect(0, 0, width, height);
    fill(255);    
    image(b, 90, 40);
    textFont(font, 48);
    textAlign(CENTER);
    fill(209, 21, 21);
    text("Final Score: " + score, width/2, height-50);
    noLoop();
  }
}




