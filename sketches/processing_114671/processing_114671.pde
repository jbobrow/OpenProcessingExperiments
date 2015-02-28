
import ddf.minim.*;

PImage bg1, bg2, fish1, fish2, fish3, fish4, fish5, fish6, heart, rubbish, bbfish, watergrass, rubbish1, rubbish2;
float fish = 200;

Minim minim;
AudioSample eating;
AudioPlayer bgsound;


void setup() {
  size(600, 600);
  smooth();
  frameRate(30);
  
  minim = new Minim(this);
  eating = minim.loadSample("eating.mp3");
  bgsound = minim.loadFile("bgm.mp3");
  bgsound.loop();
 
  
  bg1 = loadImage("bg1.gif");
  bg2 = loadImage("bg2.gif");
  fish1 = loadImage("fish1.gif");
  fish2 = loadImage("fish2.gif");
  fish3 = loadImage("fish3.gif");
  fish4 = loadImage("fish4.gif");
  fish5 = loadImage("fish5.gif");
  fish6 = loadImage("fish6.gif");
  heart = loadImage("heart.gif");
  rubbish = loadImage("rubbish.gif");
  rubbish1 = loadImage("rubbish1.gif");
  rubbish2 = loadImage("rubbish2.gif");
  bbfish = loadImage("bbfish.gif");
  watergrass = loadImage("watergrass.gif");
  
}
 
int x1 = int(random(50,550));
int y1 = 0;
int x = int(random(50,550));
int y = 0;
int number = 5;
int count = 0;
 
void draw() {
  background(0);
  image(bg1, 0, 0);
  
  fill(0);
  textSize(15);
  text("Protect your life by hitting falling rubbish",300,20);
 
  //remain life
  remainlife();
 
  // Create Player
  player();
 
  // Falling Rubbish
  tint(255);
  image(rubbish, x, y); 
  x+=random(-10,10);
  y+=random(40);
  
  // Swimming Fishes
  fish = fish - 2; 
  if (fish < 0) { 
  fish = 600; 
  } 
  image(fish1, fish+200, 300); 
  image(fish3, fish-300, 200); 
  image(fish5, fish+10, 100);
  image(fish2, fish-60, 150); 
  image(fish4, fish-400, 350); 
  image(fish6, fish+100, 250); 
  
  // Sea Pollutants
tint(255,255,170,150);
float rubA=map(mouseX, 0, 1500, -150, -100);
image(rubbish1, rubA, 0);
tint(255,255,170);
float grassA=map(mouseX, 0, 1200, -400, -5);
image(watergrass, grassA, 0);
tint(255,255,170);
float rubB=map(mouseX, 0, 100, -150, -100);
image(rubbish2, rubB, 0);
 
 tint(255);
  // IF Hit
  if (mouseX > x-50 && mouseX < x+50 && mousePressed == true) {
    textSize(40);
    fill(0);
    text("Good Job",mouseX+50,mouseY+50);
    noStroke();
    fill(200,200,30,50);
    ellipse(x, y, 100,100);
    fill(200,100,30,50);
    ellipse(x, y, 50,50);
    x = int(random(50,550));
    y = 0;
    count++;
    eating.trigger();
  }
 
  // IF Not Hit
  if (y> height|| y1> height) {
    x = int(random(50,550));
    y = 0;
    number--;
  }
 
// IF GameOver
  if (number <= 0) {
    background(0);
    image(bg2, 0, 0);
  }
 
// Press ENTER to replay
  if (keyPressed == true) {
    number = 5;
    y = -15;
  }
}
 
// The layer
void player() {
  image(bbfish, mouseX-45, mouseY-10);
}
 
 
// Remain life
void remainlife() {
  for (int num = 0; num < number; num++) {
    image(heart, 300+50*num, 30);
  }
}


//http:////music by ProjectReign - www.youtube.com/watch?v=w18j2KO4xys

