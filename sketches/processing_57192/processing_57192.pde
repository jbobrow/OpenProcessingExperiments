
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
 float targetX = x;
 

 targetX += random(-8, 8);
y += random(-1, 1);
 

if (mousePressed) {
  mouthHeight = 180;
} else {
  mouthHeight = 160;
}
  
  
  //neck
  fill(150);
  rect(targetX-10, y-10, x-75, y-55);

  //head
  fill(0);
  arc(targetX, y-50, x+50, y-50, PI, TWO_PI);

  arc(targetX, mouthHeight, x-25, y-125, 0, PI);

  arc(targetX+60, y-140, x-60, y-160, 0, PI+HALF_PI);
  
  //eyes
  fill(255);
  ellipse(targetX+40, y-70, x-85, y-185);

  ellipse(targetX-35, y-80, x-65, y-165);
  

  //body
  strokeWeight(20);
  fill(50);
  rect(targetX-48, y+40, x, y-90);

  noStroke();
  fill(225);
  rect(targetX-27.5, y+100, x-40, y-170);

  //shoulders
  fill(0);
  ellipse(targetX-48, y+40, x-60, y-160);

  ellipse(targetX+52, y+40, x-60, y-160);

  //arms
  rect(targetX-150, y+35, x+20, y-190);

  rect(targetX+40, y+35, x+20, y-190);

  //hands
  ellipse(targetX-155, y+40, x-85, y-185);

  ellipse(targetX+160, y+40, x-85, y-185);

  //leg
  rect(targetX-63.5, y+150, x+30, y-140);

  ellipse(targetX+70, y+180, x-40, y-140);

  ellipse(targetX-60, y+180, x-40, y-140);

  //wheels
  fill(255);
  ellipse(targetX-60, y+180, x-70, y-170);

  ellipse(targetX-15, y+180, x-70, y-170);

  ellipse(targetX+30, y+180, x-70, y-170);

  ellipse(targetX+72.5, y+180, x-70, y-170);
  
  //beepboop lights!
   fill(random(255), random(255), random(255));
   frameRate(5);
   ellipse(targetX+23, y+115, x-90, y-190);
   ellipse(targetX+3, y+115, x-90, y-190);
   ellipse(targetX-20, y+115, x-90, y-190);

}


