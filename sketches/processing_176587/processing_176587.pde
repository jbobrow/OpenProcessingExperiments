
//Pressing "1" and "2" will change the color (it is quite subtle, but it does change), pressing "DELETE" or "BACKSPACE" will clear the sketch and change the background to black and "S" will screenshot the sketch.
//As a side note, this might take some time to load (about 30 seconds on some occasions) so just give it a minute before putting down that it doesn't work.
//Also, do not press "3" as it will freeze up the sketch (you can close it and re-run it, but if "3" is pressed nothing will happen on the screen).

//Global variables
color strokeColor = color(0, 20);
float counter = 0;
color[] palette = {#1B2C35, #A3BFC6, #FF005D, #222A30, #293A42};
PImage door;
//setup
void setup(){
  door = loadImage("doors.png");
 size(1280, 720);
 background(palette[0]);
}

//draw
void draw(){
  image(door, 0, 360);
  //-Mouse Imput-
if(mousePressed) {
 pushMatrix();
 translate(width/2, height/2);
 //map(value, start1, stop1, start2, stop2);
  int circleResolution = (int)map(mouseY+100, 0, height, 2, 10);
  int radius = mouseX-width/2;
  float angle = TWO_PI/circleResolution;
  
  strokeWeight(2);
  stroke(strokeColor);
  
  for (int i=0; i<=circleResolution; i++) {
    float x = 0 + cos(angle*i) * radius;
    float y = 0 + sin(angle*i) * radius;
    vertex(x, y);
     ellipse(x, y, y, x);
  }
  popMatrix();
}
}
//---keyPressed---
void keyReleased() {
 if (key == DELETE || key == BACKSPACE) background(0);
  if (key == 's' || key == 'S') saveFrame("screenshot.png");
 
 switch(key){
      case '1' : 
      strokeColor = color(192, 100, 64, 10);
      break;
      case '2' : 
      strokeColor = color(30, 94, 98, 10);
      break;
      case '3' :
      strokeColor = color(271, 100, 100, 10);
 while(counter < 6000){
   stroke(palette[int(random(1, 5))]);
   strokeWeight(int(random(1, 10)));
   fill(palette[int(random(1, 5))]);
   float x = random(width); 
   float y = random(height);
   float r = random(10, 80);
   rect(x, y, r, r);
    triangle(x, y, r, x, y, r);
   ellipse(x, y, r, r);
   counter += random(-1, +2);
    } 
   }
 }



