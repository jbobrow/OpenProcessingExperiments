
//central in my final project will be the eye.
//first you have to press any key
//then you click the mouse.
//to be honest, I wanted to work this out more but because of a lack of time I am not very satisfied with the result!

//PImage varialbe
PImage eye;
color[] palette = {#8CA2A7, #7E7D7D, #007695, #04232C};
float x;
float y;

//Setup
void setup () {
size (800, 600);
noFill();
eye = loadImage("eye.jpg");
}

//Draw
void draw () {
  if(mousePressed) {
     x = random(230, 900);
     y = random(230, 1200);
     float c = random (3);
     stroke(palette[int(c)]);
   strokeWeight(2);
   ellipse(440, 250, x+20, y+20); 
 }
}

//keyboard function
void keyPressed() {
  image(eye, 0, 0);
}

