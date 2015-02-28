
float d = 50;
float center = 150;
int opacity = 255;
float dd = 70;
float ddd = 100;
float dddd = 30;

void setup() {
  size (400, 400);
  smooth();
  noStroke();
  frameRate (5);
}

void draw() {
  background(90);
  //pink
  fill(#F7A7A7);
  ellipse(70, 130, random(100), random(100));
  //orange
  fill(#F3B795);
  ellipse(100, 320, random (50), random(50));
  //yellow
  fill(#F2DF70);
  ellipse(340, 90, random(20), random (20));
  //green
  fill(#C1D667);
  ellipse(220, 200, random(100), random(200));
  //blue
  fill(#A5DAD5);
  ellipse(300, 320, random (30), random (30));
  //purple
  fill(#AA91DB);
  ellipse(200, 50, random (40), random(40));
}

void mousePressed() {

//pink
 if(mouseX>=70 && mouseX<=130 && mouseY>=100 && mouseY<=height/2){
    fill(#CE8484, 255);
    frameRate (10);
    ellipse(70, 130, 300, 100);
    ellipse(70, 130, 100, 300);
 }
}

