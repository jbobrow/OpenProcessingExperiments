
//Homework 12
//copyright 2012 Alex Fischer ajfische

float [] times = {6.13, 6.33, 6.75, 9.58, 9.70};
String [] names = {"Cheetah", "Greyhound", "Horse", "Usain Bolt", "Cat"};
int [] topspeed = {70, 48, 39, 30, 27};
PImage [] animals;

float [] speed;

float [] x;

float y, time;

int trackLength;

void setup() {
  background (0);
  size (800, 600);
  smooth();
  frameCount = 30;
  
  trackLength = 600;
  
  time = 0;
  
  animals = new PImage [5];
  animals[0] = loadImage("Cheetah.png");
  animals[1] = loadImage("Greyhound.png");
  animals[2] = loadImage("Horse.png");
  animals[3] = loadImage("Bolt.png");
  animals[4] = loadImage("Cat.png");
  
  x = new float [5];
  
  for(int i = 0; i< x.length; i++) {
    x[i] = width/2 - 300;
  }
  y = 175;
  
  speed = new float [5];

  for(int i = 0; i < speed.length; i++) {
    speed[i] = 10.5 / times[i];
  }
}

void draw() {
  background(0);
  drawTrack();
  drawAnimals();
  moveAnimals();
}

void drawTrack() {
  noStroke();
  fill(147, 39, 39);
  rectMode(CENTER);
  rect(width/2, height/2, trackLength, 250);
  stroke(255);
  for(int i = 175; i <= 450; i+=50)
  {
    line(width/2-300, i, width/2+300, i);
  }
  
  fill(255);
  textSize(32);
  text("Usain Bolt vs. Animals in the 100m dash", 100, 50);
  
  time = (int) millis()/1000;
}

void drawAnimals() {
    imageMode(CENTER);
    float w, h;
    w = 0;
    h = 0;
    for(int i = 0; i < animals.length; i++)
    {
      w = .25*animals[i].width;
      h = .25*animals[i].height;
      image (animals[i], x[i] - 25, y + + 25+ i*50, w, h);
    }
}

void moveAnimals() {
  fill(255);

  for(int i = 0; i < speed.length; i++) {
    if(x[i] < 700 ) {
      x[i]+=speed[i];
      
      textSize(18);
      text("Timer: " + time, 100, 100);
    }
    else {
      textSize(12);
      text(i+1 + "." + names[i] + "\n   Time: " + times[i] + "s" + "\n   Top Speed: " + topspeed[i] + "mph" 
      + "\n   Avg Speed: " + round(100/times[i] *  2.23693629) + "mph", 100 + 125* i, 500);
    }
  }
}

void keyPressed() {
  if(key == TAB) {
      background (0);
  size (800, 600);
  smooth();
  frameCount = 30;
  
  trackLength = 600;
  
  time = 0;
  
  animals = new PImage [5];
  animals[0] = loadImage("Cheetah.png");
  animals[1] = loadImage("Greyhound.png");
  animals[2] = loadImage("Horse.png");
  animals[3] = loadImage("Bolt.png");
  animals[4] = loadImage("Cat.png");
  
  x = new float [5];
  
  for(int i = 0; i< x.length; i++) {
    x[i] = width/2 - 300;
  }
  y = 175;
  
  speed = new float [5];

  for(int i = 0; i < speed.length; i++) {
    speed[i] = 10 / times[i];
  }
  }
}

//http://www.letsrun.com/forum/flat_read.php?thread=3206939
//http://online.wsj.com/article/SB10001424052970204884404574364680587931684.html
//http://upload.wikimedia.org/wikipedia/commons/6/62/World_record_progression_100m_men.svg
//http://www.infoplease.com/ipa/A0004737.html

