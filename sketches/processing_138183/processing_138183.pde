
//random polygons
//displays a rose after playing for some time

/*
MOUSE
position x : length
position y : thickness and number lines to be drawn
drag : draw

KEYS 
1-5 : stroke color
del, backspace : erase
s : save png

*/

//Global variables
color strokeColor = color(0, 10);
PImage fractal;

//setup()
void setup() {
 size(900, 900);
 colorMode(HSB, 360, 100, 100, 100);
 noFill(); 
 background(360);
 fractal = loadImage("music-notes-widescreen-hd-wallpaper-wallpaper-hd-music-photo-music-wallpaper.jpg");
}

//draw()
void draw() {
 if (mousePressed) {
 pushMatrix();
 translate(width/2, height/2);
 rotate(radians(25));
 stroke(random(35), 50, random(50));
 //map(value, start1, stop1, start2, stop2);
 int circleResolution = (int) map(mouseY+100, 0, height, 5, 10);
 int radius = mouseX-width/2;
 float angle = TWO_PI/circleResolution;
 
 //style
 strokeWeight(2);
 stroke(strokeColor);
 
 beginShape();
 for (int i=0; i<=circleResolution; i++) {
   float x = 0 + cos(angle*i) * radius;
   float y = 0 + sin(angle*i) * radius;
   vertex(x,y); 
 }
 endShape();
 popMatrix();
}
}

//keyPressed()

void keyReleased() {
 if (key == DELETE || key == BACKSPACE) background(360);
 if (key == 's' || key == 'S') saveFrame("screenshot.png");
 if (key == 'p') image(fractal, 0, 0, 900, 900);
 switch(key){
  case '1':
    strokeColor = color(0, 10);
    break;
  case '2':
    strokeColor = color(272, 100, 164, 60);
    break;
  case '3':
    strokeColor = color(252, 90, 71, 15);
    break;
  case '4':
    strokeColor = color(330, 40, 161, 112);
    break;
  case '5':
    strokeColor = color(352, 160, 241, 151);
    break;
 } 
}

