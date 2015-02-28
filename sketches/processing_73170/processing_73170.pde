
 /* @pjs preload= "giraffe1.png" */
/* @pjs preload="giraffeskeleton.jpg"*/

import ddf.minim.*;
Minim minim;
AudioSnippet snip;
PImage giraffe;
PImage giraffeSkeleton;
float xPosition = 150;
float yPosition = 140;
int xRayCorner = 120;
String s = "<---PUSH";


void setup() {
  size(600, 600);
  minim = new Minim(this);
  snip = minim.loadSnippet("xray_cackle_unnngh.mp3");
  giraffe = loadImage("giraffe1.png");
  giraffeSkeleton = loadImage("giraffeskeleton.jpg");
  frameRate(100);
}
void draw() {
  // println(mouseX+"\t"+ mouseY);
  background(255);
  drawXRayMachine();
  drawGiraffe();
  if (mouseX>120&&mouseX<140&&mouseY>525&&mouseY<550&&mousePressed) {
    drawGiraffeXRay();
    drawBackgroundFreakout();
  }
  else{snip.pause();}
}

void drawXRayMachine() {
  fill(255);
  strokeWeight(15);
  rect(xRayCorner, xRayCorner, 290, 400);//machine
  fill(150);
  rect(xRayCorner, xRayCorner+400, 290, 30);//control panel
  fill(255, 0, 0);
  strokeWeight(5);
  ellipse(xRayCorner+10, xRayCorner+415, 20, 20);//button
  fill(0);
  text(s, xRayCorner+30, xRayCorner+410, 100, 100);//activate
}
void drawGiraffe() {
  image(giraffe, xPosition, yPosition);
}
void drawGiraffeXRay() {
  image(giraffeSkeleton, xPosition+random(6), yPosition);
}  

void drawBackgroundFreakout() {
  background(random(255));
 snip.play();
  for (float x = 0;x<width;x=x+random(40)) {
    for (float y = 0; y<height;y=y+random(30)) {
      for (float z = random(6); z<10; z=z+40) {
        for (float a = random(6);a<10;a = a+50) {
          strokeWeight(.1);
          fill(random(100, 255), random(100, 255), 0);
          ellipse(x, y, z, a);
        }
      }
    }
  }
  drawXRayMachine();
  drawGiraffeXRay();
}


