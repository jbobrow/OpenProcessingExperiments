
//Week 4 Interactive Project
//Mouse/Keyboard input
//Has two bursts points of light , rectangle shapes, 
//a static line from the center with two static ellipses.
//Color changes from Green (Key 1) to Blue (Key 2) to 
//Gold (Key 3).  Key 4 changes the blackground to Black. 
//Keys 's' and 'S' saves to "screenshot.png".
//Follow the line or go anywhere
//I tried a vertex but it overwhelmed the screen.


/*
MOUSE
position x : length
position y : thickness and number lines to be drawn
drag : draw

KEYS
1-3 : stoke color
del, backspace : erase
s : save png3

*/

//Global Variable

color strokeColor = color(0,10);

//setup()

void setup(){
 size (720,720);
 colorMode(HSB,360,100,100,100);
 noFill();
 background (360);
  strokeWeight (20);
  text ("Hello",50,250);
 }
 
//draw()

void draw(){
if(mousePressed) {
 pushMatrix();
 translate(width/2,height/2);
 //map(value, start1, stop1, start2, stop2);
 int circleResolution = (int)map(mouseY+100, 0, height, 2, 10);
 int radius = mouseX-width/2;
 float angle = PI/circleResolution;
 
 //style
 //strokeWeight (.5);
 stroke(strokeColor);
 
 
 beginShape();
 for (int i=0; i<=circleResolution; i++){
  float x = 0 + cos(angle*i) * radius;
  float y = 0 + sin(angle*i) * radius;
 // vertex (x,y); 
 
    strokeWeight (3);
   ellipse (-230,200,width/8,height/8); 
    ellipse (-230,125,width/12,height/12);
    strokeWeight (2);
     line (300,-250,-300,250);
   strokeWeight (.55);
  rect(x+250,y-40,x,y);
 strokeWeight (4);
   point(x-150,y-150);
   point(x+50,y+250);
 }
 endShape();
 popMatrix();
}
}
//keyPressed()
void keyPressed(){
 if (key == DELETE || key == BACKSPACE)background(360);
 if (key == 's' || key == 'S') saveFrame("screenshot.png");
 
 switch (key){
  case '1':
 strokeColor = color(#ACEDB0);
break;
case '2':
 strokeColor = color(192,100,64,10);
break;
case '3':
 strokeColor = color(52,100,71,10);
break;
case '4':
 background (0);
break;
 }
 
 }

