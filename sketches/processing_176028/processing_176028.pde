
//Week 15 Final Project: 

//press keyboard to draw colorful star. By press the case 1, 2, 3, 4, 5 can switch 5 different colors.
//press 's' or 'S' to print the screen and save a png file.

//Declare a PImage variable type
PImage starry;

//Import 'Minim' library files
import ddf.minim.*;

//Declare global variables
Minim minim;
AudioPlayer song;

//setup()
void setup() {
  size (1200, 720);
  colorMode(HSB, 360, 100, 100);
  background(200, 320, 8);
  starry = loadImage("starry.jpg");
         image(starry, 0, 0);
  minim = new Minim(this);  
  song = minim.loadFile("xmassong.mp3");
  song.play();  
  
  // working with text();
fill(10, 10, 80, 180);
textSize(32);
textAlign(CENTER); 
text("Merry Christmas & Happy New Year.", 420, 220);

fill(10, 10, 90, 150);
textSize(16);
textAlign(CENTER); 
text("Press Key 1, 2, 3, 4, 5, to draw your own starry night!", 280, 670);

}



//Global Variables
color fillColor = color(100, 120, 360, 10);
void keyPressed(){
switch(key) {
        case '1':
    fillColor = color(10, 20, 90, 20);
    break;
        case '2':
    fillColor = color(170, 90, 60, 15);
    break;
        case '3':
    fillColor = color(113, 9, 89, 14);
    break;
        case '4':
    fillColor = color(45, 55, 109, 15);
    break;
        case '5':
    fillColor = color(16, 51, 89, 20);
    break;

  }
}

void draw() {
 
 //draw big star
   float counter = 0;
 if (keyPressed) {
   fill(fillColor);
 noStroke();
 strokeWeight(0);
   float x = 0;
   float y = 0;
   x = random(width);
   y = random(height);
   triangle(x-50, y-30, x, y-30, x-25, y);
   triangle(x-25, y-45, x, y-10, x-50, y-10);
   counter++;

      if (key == 's' || key == 'S') saveFrame("screenshot.png");
   }
  

}


