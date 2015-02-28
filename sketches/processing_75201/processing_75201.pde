
float force=600;
float x=1;
float y=1;
float rx;
float ry;

PFont font;
String txt = "may the force be with you";

void setup() {
  size(600, 100);
  font = loadFont("StarJedi.vlw");
  textFont(font);
}

void draw() {

  background(0);

  fill(255);
  noStroke();
  for (float x=1; x < 600; x = x + rx) { 
    for (float y=1; y < 100; y = y + ry) {

      rx = random(10, 50);
      ry = random(10, 50);  
      ellipse(x, y, 3, 3);
    }
  }

  textSize(80);
  fill(255, 240, 0); 
  text(txt, force, 80);  
  force=force-2;
  
  if (force<-1300) {force=600;}

  
}



