
void setup() {
  size (500, 500);
  noStroke();
  smooth();
  noLoop();
  background (255, 246, 75);
  colorMode (HSB, 255);
}

void draw() {
  for (int i=10; i<300; i=i+50) {
    for (int j=30; j<500; j=j+60) {  
      rubberStamp(i, j, 10);
    }
  }
  colorMode (RGB, 255);
  fill (255, 0, 0);
  textSize (80);
  text ("A", 220, 100);
  text ("DOLPHIN", 70, 250);
  text ("PARTY", 120, 400);
}

void rubberStamp (int x, int y, int colors) {
  stroke (0);
  strokeWeight(1);
  fill (random (colors, 255), random (colors, 255), random (colors, 255));

  //dolphin
  beginShape();
  curveVertex (x, y);
  curveVertex (x, y);
  curveVertex (x+20, y-5); 
  curveVertex (x+40, y-15);
  curveVertex (x+70, y-25); 
  //topfin
  curveVertex (x+100, y-25); 
  curveVertex (x+130, y-35); 
  curveVertex (x+125, y-20); 
  //upperbody
  curveVertex (x+170, y+10);
  //tail
  curveVertex (x+200, y+45); 
  curveVertex (x+230, y+35);
  curveVertex (x+210, y+60);
  curveVertex (x+220, y+85);
  curveVertex (x+200, y+75);
  curveVertex (x+185, y+60);
  //lowerbody
  curveVertex (x+120, y+40);
  //flipper
  curveVertex (x+85, y+30);
  curveVertex (x+80, y+45);
  curveVertex (x+55, y+25);
  curveVertex (x+20, y+15);
  curveVertex (x+40, y+10);
  curveVertex (x+2, y+5);
  curveVertex (x, y);
  curveVertex (x, y);
  endShape();

  //eyeballs
  fill(255);
  ellipse (x+40, y-5, 10, 10);
  fill(0);
  ellipse (x+40, y-5, 5, 5);
}

