
PImage img;

float x = 100;
float y = 200;
int r = 150;
int mouthHeight = 160;

float easing = 0.2;

void setup() {
  size(720, 480);
   smooth();
  noStroke();
  img = loadImage("alpine.png");
}

void draw() {
  
 image(img, 0, 0);
 int targetX = mouseX;

if (mousePressed) {
  mouthHeight = 180;
} else {
  mouthHeight = 160;
}
  
  
  //neck
  fill(150);
  rect(mouseX-10, y-10, x-75, y-55);

  //head
  fill(0);
  arc(mouseX, y-50, x+50, y-50, PI, TWO_PI);

  arc(mouseX, mouthHeight, x-25, y-125, 0, PI);

  arc(mouseX+60, y-140, x-60, y-160, 0, PI+HALF_PI);
  
  //eyes
  fill(255);
  ellipse(mouseX+40, y-70, x-85, y-185);

  ellipse(mouseX-35, y-80, x-65, y-165);
  

  //body
  strokeWeight(20);
  fill(50);
  rect(mouseX-48, y+40, x, y-90);

  noStroke();
  fill(225);
  rect(mouseX-27.5, y+100, x-40, y-170);

  //shoulders
  fill(0);
  ellipse(mouseX-48, y+40, x-60, y-160);

  ellipse(mouseX+52, y+40, x-60, y-160);

  //arms
  rect(mouseX-150, y+35, x+20, y-190);

  rect(mouseX+40, y+35, x+20, y-190);

  //hands
  ellipse(mouseX-155, y+40, x-85, y-185);

  ellipse(mouseX+160, y+40, x-85, y-185);

  //leg
  rect(mouseX-63.5, y+150, x+30, y-140);

  ellipse(mouseX+70, y+180, x-40, y-140);

  ellipse(mouseX-60, y+180, x-40, y-140);

  //wheels
  fill(255);
  ellipse(mouseX-60, y+180, x-70, y-170);

  ellipse(mouseX-15, y+180, x-70, y-170);

  ellipse(mouseX+30, y+180, x-70, y-170);

  ellipse(mouseX+72.5, y+180, x-70, y-170);
  
  //beepboop lights!
   fill(random(255), random(255), random(255));
   frameRate(5);
   ellipse(mouseX+23, y+115, x-90, y-190);
   ellipse(mouseX+3, y+115, x-90, y-190);
   ellipse(mouseX-20, y+115, x-90, y-190);

}


