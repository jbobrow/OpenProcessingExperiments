
boolean grab = false;
boolean lift = false;
PImage sky;
PImage [] bird;
PImage [] monk;
PImage monklift;
PImage monkfall;
int count = 0;
int frameM = 1;
int monkX = 250;
int monkY = 460;
float x = 0;
float y = 250;
Bird [] birds;


void setup() {
  size (500, 500);

  monk = new PImage[3];
  bird = new PImage[3];
  birds = new Bird[100];
  for (int i = 0; i< birds.length; i ++) {
    birds[i]= new Bird(random(100, 400), random(100, 400));
  }
  for (int i = 0; i< bird.length; i ++) {
    bird[i]= loadImage("bigbird0"+i+".png");
  }
  for (int i = 0; i<monk.length; i++) {
    monk[i] = loadImage("monk0"+ i +".png");
  }
  sky= loadImage("Cumulus_clouds_in_fair_weather.jpg");
  monklift = loadImage("monklift.png");
  monkfall = loadImage("monkfall.png");
}



void draw() {

  image(sky, 0, 0, 500, 500);
  for (int i=0; i<birds.length; i++) {
    birds[i].update();
  }
  monklift = loadImage("monklift.png");
  monkfall = loadImage("monkfall.png");
  if (count>2) {
    count = 0;
  }
  image(monk[frameM], monkX, monkY, 50, 50);

}

class Bird {
  float x;
  float y;
  float velX;
  float velY;
  float destinX;
  float destinY;
  int counter;
  int frame;
  int speedFrame;
  boolean birdPick;

  Bird( float xpos, float ypos) {
    x=xpos;
    y=ypos;
    speedFrame = int(random(2, 25));
    destinX=x;
    destinY=y;
    birdPick = boolean(int(random(2)));
  }

  void update () {

    pushMatrix();
    translate(x, y);

    if (counter%100 ==0) {
      destinX =int(random(monkX-100, monkX+100));
    }
    if (counter%60 ==0) {
      destinY =int(random(-80, 550));
    }
    x += (destinX-x)*0.01;
    y += (destinY-y)*0.01;
    if (counter%speedFrame==0) {
      frame++;
    }
    if (frame > 2) frame= 0;
    if (birdPick) {

      image(bird[frame], -50, -50, 100, 100);
    }
    popMatrix();
    counter ++;
  }
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT && monkX<475) {
      monkX+=10;
      count++;
      if (count%2 == 0) {
        frameM++;
      }
      if (frameM>1) frameM = 0;
    } 
    else if (keyCode == LEFT && monkX>25) {
      monkX-=10;
      count++;
      if (count%2 == 0) frameM++;
      if (frameM>1) frameM = 0;
    } 
    else if (keyCode == UP) {
      count++;
      if (count%2 == 0) frameM++;
      if (frameM>1) frameM = 0;
      if (count%10 == 0) lift = false;
    }
  }
}
void keyReleased() {
  frameM = 2;
}


