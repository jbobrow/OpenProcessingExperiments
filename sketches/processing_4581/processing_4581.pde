
/**  Jeff Hendrickson Sept 09
      Arc Painter 2   using random arcs to paint an abstract.
      */
int x = 350;
int y = 250;
int w = 100;
int h = 700;


void setup() {
size(600,400);  // w x h
background(255);
smooth();
//noStroke();
}
void draw()  {
for (int i =1; i<10; i++) {  //larger numbers make more varied angles
  stroke(random(100, 255), random(100, 170), random(40, 120), random(60, 110));
  strokeWeight(random(.5, 30));
  noFill();
  arc(x+75, y+75, w+35, h+35, PI, TWO_PI-PI/2);  //top left
  x +=random(-20,20);
  y +=random(-20,20);
  w +=random(-20,20);
  h +=random(-20,20);

}
for (int i =1; i<30; i++) {  //larger numbers make more varied angles
  stroke(random(100, 210), random(10, 30), random(10, 100), random(60, 110));
  strokeWeight(random(.5, 24));
  noFill();
  arc(x+300, y+300, w+40, h+40, 0, PI/2);  //bottom right
  x +=random(-20,20);
  y +=random(-20,20);
  w +=random(-20,20);
  h +=random(-20,20);

}


for (int i =1; i<80; i++) {  //larger numbers make more varied angles
  stroke(random(2, 20), random(10, 110), random(100, 200), random(60, 110));
  strokeWeight(random(.5, 14));
  noFill();
  arc(x+200, y+200, w-50, h-50, TWO_PI-PI/2, TWO_PI);  //top right
  x +=random(-20,20);
  y +=random(-20,20);
  w +=random(-20,20);
  h +=random(-20,20);

}
for (int i =1; i<40; i++) {  //larger numbers make more varied angles
  stroke(random(100, 178), random(2, 4), random(20, 40), random(60, 110));
  strokeWeight(random(.5, 14));
  noFill();
  arc(x, y, w, h, PI/2, PI);  //bottom left
  x +=random(-20,20);
  y +=random(-20,20);
  w +=random(-20,20);
  h +=random(-20,20);

}

if (millis() >= 10000) {
  noLoop();
}
}
void mousePressed()  {
  save("arcpainter_100.png");
}

