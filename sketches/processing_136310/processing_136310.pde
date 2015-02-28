
/*
don't worry! 
be happy!

MOUSEPRESS to start
MOUSERELEASE to stop
press S to screenshot
*/

void setup(){
  size(800, 800);
  colorMode(HSB, 360, 100, 100);
  background(random(360), random(100), 100); 
}

void draw(){
  if (mousePressed == true) {
    noStroke();
    fill(color(random(360), random(100), 100));
    ellipse(204, 226, 123, 123);
    ellipse(596, 226, 123, 123);
    arc(400, 410, 457, 400, PI/1500, PI);
 }
}

void keyPressed() {
  if (key=='s' || key=='S') saveFrame("screenshot.png");
}


