
/* @pjs preload="Layer 1.png,Layer 2.png,Layer 3.png,Layer 4.png,Layer 5.png,Layer 6.png,Layer 7.png,Layer 8.png,Layer 9.png"; */

PFont f;

PImage alfa;
PImage bravo;
PImage charlie;
PImage delta;
PImage echo;
PImage foxtrot;

int I=0;
int X=0;
int numFrames = 9; // The number of frames
int frame = 0; // The first frame
PImage[] images = new PImage[numFrames];


void setup() {
  //The text size and font
  f = createFont("Arial",16,true);
size(500,250);

//loading background images
alfa = loadImage("mountains.png");
bravo = loadImage("sahara.png");
charlie = loadImage("city.png");
delta = loadImage("starbucks.png");
echo = loadImage("victory.png");
foxtrot = loadImage("smug.png");

//Howfast it goes
frameRate(20);

//All the animation pictures
  images[0] = loadImage("Layer 1.png");
  images[1] = loadImage("Layer 2.png");
  images[2] = loadImage("Layer 3.png");
  images[3] = loadImage("Layer 4.png");
  images[4] = loadImage("Layer 5.png");
  images[5] = loadImage("Layer 6.png");
  images[6] = loadImage("Layer 7.png");
  images[7] = loadImage("Layer 8.png");
  images[8] = loadImage("Layer 9.png");
  
}


void draw() {
//background images layered over old animation still images
   image(alfa, 0, 0);
   if (X>=60){
  image(bravo,0,0);
}
  if (X>=120){
  image(charlie,0,0);
}
if (X>=180){
  image(delta,0,0);
}
  
  X++;
//What switches out the pictures
frame++;
if (frame == numFrames) {
frame = 0;
}
image(images[frame],X,100);

//background now covers the animation entirely
if (X>=220){
  image(delta,0,0);
}
if (X>=220){
  image(echo,300,100);
}
if (X>=240){
  fill(#897D7D);
  rect(0,0,500,500);
  fill(#000000);
  rect(0,0,300,500);
  image(foxtrot,400,150);
}
if (X>=240){
  stroke(175);
  textFont(f, 20);
  fill(#8E9AFF);
  text("No Matter What Your Goal Is", 10,60);
}
if (X>=240){
  stroke(175);
  textFont(f, 20);
  fill(#8E9AFF);
  text("You'll Make It There Eventually", 10,80);
}
if (X>=240){
  stroke(175);
  textFont(f, 20);
  fill(#8E9AFF);
  text("...", 10,100);
}
if (X>=240){
  stroke(175);
  textFont(f, 20);
  fill(#8E9AFF);
  text("With Hard Work", 10,120);
}


if (X>=310){
  stroke(175);
  textFont(f, 20);
  fill(#4659FF);
  text("I Hate Work So Much, Though", 10,170);
}
if (X>=350){
  stroke(175);
  textFont(f, 20);
  fill(#4659FF);
  text("I'll Do It Anyways Because", 10,190);
}
if (X>=350){
  stroke(175);
  textFont(f, 20);
  fill(#4659FF);
  text("You Know, Reasons", 10,210);
}

}

