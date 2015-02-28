
PImage [] fight = new PImage [2];
int s;
int m;
int h;
PImage a;
PImage b;
PImage c;
int x;
int y;
PFont font;

void setup() {
  size(800, 600);
  smooth();
  background(255);
  s = second();
  m = minute();
  h = hour();
  font = loadFont("RosewoodStd-Regular-48.vlw");
  fight[0] = loadImage ("ryuguile1 copy.png");
  fight[1] = loadImage ("ryuguile2.png");
  c = loadImage ("f16minussky.png");
}

void draw() {
  background(255);
  for (int y = 0; y<height; y = y+1){
    stroke(#6AA4FF-y/2);
    line(0,y,width,y);//sky
  }
  s = second();
  m = minute();
  h = hour();  
  image (c, 0, 0, width, height);//plane and ground
  noStroke();
  fill(#7C7A5F);
  fill(50);
  ellipse (width/2-100, height-80, 150, 30);//shadow
  ellipse(width/2, height-80, 200, 30);//shadow
  ellipse (width-125, height-135, 150, 20);// shadow of crate
  ellipse(0, height-50, 225, 5);//shadow of fence
  filter (BLUR, 2);
  image (fight[s%2], width/4, height/4);//s%2 changes the image every 2 seconds
  stroke(255);
  fill(255);
  rect (450, 50, 300, 25);
  fill(#F5C400);
  textAlign(CENTER);
  textFont (font, 50);
  text("ROUND", width/2, 115);//minute
  textFont(font, 80); 
  text (m, width/2, 175);//minute
  fill(#F0DC02);
  textFont (font, 100);
  text (s, width/8, 200);//hit counter
  fill(#FF0303);
  textFont (font, 50);
  text("HIT!", width/6+75, 200);//hit counter
  textFont (font, 35);
  text ("SCORE", 100, 45);//hour
  text (h, 200, 45);//hour
  fill(#DECC00);
  textAlign(LEFT);
  text ("RYU", 50, 100);
  textAlign(RIGHT);
  text ("GUILE", width-50, 100);
  fill(#FF0303);
  rect (50, 50, 300, 25); //Ryu's health bar...stays full. Boss.
  rect (450, 50, 300-s*5, 25);//Guile's health bar dropping every second
  fill (229, random (10, 200));
  text ("PRESS START", 700, 25);
  noStroke();
  fill(50); 
  fill(#835F28);
  noStroke();
  rect (width-200, height-280, 150, 150);//crate outside
  fill(#674209);
  rect (width-190, height-270, 130, 130);//crate inside
  stroke(#432A05);
  for (int j = width-180; j<width-60; j=j+15) {
    line (j, height-270, j, height-140);//lines on crate
  }
  noStroke();
  fill(50);
  ellipse(100, height-50, 50, 20);
  rect(90, height/3+50, 20, height/2);//fencepost
  ellipse(100, height/3+50, 19, 10);
  stroke(75);
  noFill();
  rect(0, height/3+75, 90, 250);
  for (int i = height/3+75; i<height-70; i =i+25) {
    line (0, i, 90, i);//fence
  }
  for (int j =0; j<90; j = j+25) {
    line(j, height/3+75, j, height-75);//fence
  }
}


