
  void setup() {
  size (500, 500);
  noStroke();
  smooth();
  noLoop();
  colorMode (RGB, 500);
}

void draw() {
  //gradient
  for (int i = 0; i < 500; i++) {
    for (int j = 0; j < 500; j++) {
      strokeWeight (2);
      stroke(0, i, j);
      point(i, j);
    }
  }
  //dots
  fill(500, 40);
  noStroke();
  for (int i=1; i<1000; i=i+20) {
    for (int j=1; j<1000; j=j+20) {
      ellipse (i, j, 50, 50);
    }
  }

  //stamped!
  rubberStamp (250, 60, 490);
  rubberStamp(80, 105, 0); 
  rubberStamp (50, 350, 450);
  rubberStamp (-20, -40, 80);
  rubberStamp (-150, 225, 100);
  rubberStamp (420, 185, 150);
  rubberStamp (-160, 40, 280);
  rubberStamp (-180, 400, 490);
  rubberStamp (275, 370, 410);
  rubberStamp (390, 15, 10);
  rubberStamp (400, 320, 60);

  noStroke();
  fill (0, 250);
  rect (40, 430, 425, 55);
  fill(500, 150);
  ellipse (250, 250, 300, 300);
  ellipse (250, 250, 250, 250);
  ellipse (250, 250, 200, 200);
  
  rubberStamp (135, 240, 200);

  textSize(14);
  fill(500);
  text ("Dolphins navigate through the use of echolocation, a skill", 50, 450);
  text ("that is also used to communicate to other dolphins.", 50, 475);
}

void rubberStamp (int x, int y, int colors) {
  stroke (0);
  fill (random (0, 500),0 , colors );
  strokeWeight(1);

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
  fill(500);
  ellipse (x+40, y-5, 10+(.02*colors), 10+(.01*colors));
  fill(0);
  ellipse (x+40, y-5, 5, 5);
}
                                                
