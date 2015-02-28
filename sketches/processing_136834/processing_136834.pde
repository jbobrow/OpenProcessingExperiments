
float lineX = 450;
float lineY = 450;
int radius = 400;
int angle = 0;
int red = 0;
int blue = 0;
int i = 0;
int s = 0;
int a = 100;

void setup(){
  background(0);
  size (800, 800);
  frameRate(30);
  fill(25);
  ellipse(width/2, height/2, 700, 700);
}

void draw(){
//getting the lines to draw in random lengths and angles away from the mouse
 if ((mousePressed)){
   i = random(-100, 100);
   s = random(-100, 100);
   a = random(50, 100);
   strokeWeight(random(.5, 2));
   stroke(red, 0, blue, a);
 line(mouseX, mouseY, mouseX+i, mouseY+s);
 
 red= floor(random(250));
 blue= floor(random(250));
 }
}




