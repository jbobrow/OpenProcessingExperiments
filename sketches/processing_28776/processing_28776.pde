
CrazyBall[] balls;

//variables to mess with
float cbDirection = 360;
float cbSpeed = 2;
float fadeTime = 3;

void setup() {
  //setup bacis stuff
  size(450, 450);
  background(0);
  noStroke();
  smooth(); 
  frameRate(35);

  // create alot of CrazyBalls
  balls = new CrazyBall[300];
  for (int i=0;i<balls.length;i++) {
    balls[i]= new CrazyBall(width/2, height/2, random(cbDirection), cbSpeed);
  }
}
void draw() {
  fill(0, 0, 0, fadeTime);//fill for the rect that fades stuff away
  rect(0, 0, width, height); // the rect that fades stuff away

  //updating all the CrazyBalls
  for (int i=0;i<balls.length;i++) {
    balls[i].update();
    balls[i].display();
  }
}

void rePositionAll(){
  //reposition all the CrazyBalls
  for (int i=0;i<balls.length;i++) {
    balls[i].setPos(mouseX,mouseY);
  }
}

void mouseClicked(){
  rePositionAll();
}

class CrazyBall {
  float xpos, ypos;
  color farve;
  float direction;
  float flux;
  float speed;

  CrazyBall(float myX, float myY, float myDirection, float mySpeed) {
    xpos = myX;
    ypos = myY;
    speed = mySpeed;
    direction = random(myDirection);
    farve =  color(random(255), random(255), random(255));
  }
  void update() {

    flux = random(-2, 2);
    xpos += (cos( radians( direction ) ) * speed)+flux;
    ypos += (sin( radians( direction ) ) * speed)+flux;

    if (xpos>width || xpos < 0 || ypos > height || ypos < 0) {
      speed = speed*-1;
      direction = random(360);
      farve =  color(random(255), random(255), random(255));
    }
  }
  void display() {
    fill(farve);
    ellipse(xpos, ypos, 2, 2);
  }
  void setPos(float xp, float yp) {
    xpos = xp;
    ypos = yp;
  }
}
   
