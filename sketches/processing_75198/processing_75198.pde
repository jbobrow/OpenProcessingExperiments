
PImage a;
PImage b;
PImage choice;
PImage life;
PImage start;
PImage which;
PImage who;


void setup() {
  size(600, 400);
  background (231, 235, 236);
  smooth();
  
  a = loadImage("a.png");
  b = loadImage("b.png");
  choice = loadImage("pro-choice.png");
  life = loadImage("prolife.png");
  start = loadImage("start.png");
  which = loadImage("which.png");
  who = loadImage("who.png");
  
  background (225, 235, 236);  
  imageMode(CENTER);
  image(start, 300, 200);
}

void draw () {
  fill(231, 235, 236);
  noStroke();
}
  
void mouseClicked() {
  if (mouseX < 400 && mouseX > 200 && mouseY > 175 && mouseY < 225) {
    background (225, 235, 236); 
    image(who, 300, 100);
  } else if (mouseX < 600 && mouseX > 0 && mouseY > 75 && mouseY < 125) {
   background (225, 265, 236); 
   image(which, 300, 80);
   image(a, 100, 200); image(life, 250, 200);
   image(b, 100, 300); image(choice, 250, 300);
   
  } 
}

