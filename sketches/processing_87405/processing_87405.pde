
/* @pjs preload="heman.jpeg";*/
/* @pjs preload="hemaninvert.jpg";*/
/* @pjs preload="hemancrystal.jpeg";*/
/* @pjs preload="hemanjitter.jpeg";*/
/* @pjs preload="hemanmosaic.jpeg";*/

PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;


void setup() {
  size(510, 510); 
  img = loadImage("heman.jpeg");
  img2 = loadImage("hemaninvert.jpg");
  img3 = loadImage("hemanjitter.jpeg");
  img4 = loadImage("hemanmosaic.jpeg");
  img5 = loadImage("hemancrystal.jpeg");
}

void draw() {
  float randomwidth;
  randomwidth = random(510);
  float randomheight;
  randomheight = random(510);
  float randomSize;
  randomSize = random(200);
  float randomWidth;
  randomWidth = random(80);
  float randomHeight;
  randomHeight = random(50);
  float randomH;
  randomH = random(25);
  float randomRotation;
  randomRotation = random(60);
  
if(mousePressed&&(mouseButton == LEFT)){
  background(img2);
  rotate(radians(randomRotation));
  rect(randomwidth,randomheight,randomSize + randomWidth,randomHeight + randomH);
} else if(mousePressed&&(mouseButton == RIGHT)) {
  background(img3);
  noStroke();
  rotate(radians(randomRotation));
  strokeWeight(3);
  stroke(240);
  for (int i = 0; i < 510; i = i + 5) {
    line(0, randomwidth, 510, randomheight);
  }
  for (int i = 0; i < 510; i = i + 5) {
    line(randomwidth, 510, randomheight, 0);
  }
} else if(mousePressed&&(mouseButton == CENTER)) {
  background(img4);
  fill(130, 24, 12);
  rotate(radians(randomRotation));
  ellipse(randomwidth,randomheight,randomSize + randomWidth,randomHeight + randomH);
} else if(keyPressed == true) {
  background(img5);
  int i = 0;
  stroke(100, 23, 45);
  while (i < 510) {
    line(i-10, 50, i+10, 510);
    i = i + 10;
  }
} else { 
  background(img);
  strokeWeight(1);
  stroke(240);
  for (int i = 0; i < 300; i = i + 5) {
    line(50, i, 180, i);
  }
  for (int i = 230; i < 510; i = i + 10) {
    line(200, i, 400, i);
  }
}
}



