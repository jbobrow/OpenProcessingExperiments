
/*Coloring Page: I wanted  to create a program that mimicks a
coloring book. When run, the user will find a winter scene that
they can color while listening to my rendition of Jingle Bells.

----------Controls:----------
MOUSE:
Click and hold or drag to place circles. Default color is black.

KEYS:
This is a Paint by Numbers! Press a number (1-8) and color in
the corresponding space.

Help:
'0' : color is White
'1-8' : Colors for the picuture!
'9' : Selects a random color
'S' or 's' to save a screenshot;
*/

//Global Variables
  //Audio
import ddf.minim.*;
Minim minim;
AudioPlayer jingle;
  //Image
PImage house;
float counter1 = 0;
color fillColor = color(0, 0, 0, 50);

//setup()
void setup() {
 size(650, 500);
 colorMode(HSB, 360, 100, 100, 100);
 minim = new Minim(this);
  jingle = minim.loadFile("jingle.wav");
  jingle.play();
 background(360);
house = loadImage("house.png");
  image(house, 0,0, 650, 500); 
 noStroke();
}

//draw()
void draw(){
if(mousePressed){
  pushMatrix();
  translate(random(0, 5), random(0, 5));
  fill(fillColor);
  ellipse(mouseX, mouseY, 10, 10);
popMatrix();
}
}

//keyPressed()
void keyReleased(){

 if (key == 's' || key == 'S') saveFrame("s1.png"); 
 
 switch(key){
 case '0': 
     fillColor = color(0, 0, 360, 50);
     break;
 case '1':
     fillColor = color(190, 90, 90, 50);
     break;  
 case '2':
     fillColor = color(210, 5, 100, 50);
     break;    
 case '3':
     fillColor = color(50, 30, 60, 50);
     break; 
 case '4':
     fillColor = color(40, 70, 70, 50);
     break; 
 case '5':
     fillColor = color(60, 40, 140, 50);
     break; 
 case '6':
     fillColor = color(10, 40, 100, 50);
     break; 
 case '7':
     fillColor = color(150, 75, 80, 50);
     break; 
 case '8':
     fillColor = color(150, 150, 60, 50);
     break;  
 case '9':
     fillColor = color(random(0, 360), random(0, 100), random(50, 100), 30);
     break;   
 } 
}

