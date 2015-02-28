
//I wanted to create a landscape of different options using both mouse and key interaction as well as sound, 
//the ideas was to create city landscapes that were related with a star, the cities grow in a random way most of the 
//times.
//there are elements (buildings, stars and planets) that will be triggered when using the mouse and others that will begin when using 
//the keys 1,2,3,. For the sound imput the key is C and if you want to save the images use the key s.
//If you want to restart from the beginning and change the color of the background use the key delete or backspace
//for chanigin the background to an image press b


//sound files
import ddf.minim.*;

//Global variables
Minim minim;
AudioSample chimes;
PImage universe;

color strokeColor = color(0, 60);
int stepX;
int stepY;
int max_distance = 500;
int value;

//setup
void setup() {
  size(1000, 700);
  colorMode(HSB, width, height, 200);
  background(random(100), random(100), 100);
  minim = new Minim(this);
  chimes = minim.loadSample("chimes.wav");
  universe = loadImage("universe.jpg");
}

//draw()
void draw(){
 
 colorMode(HSB,width,height,200);
 stepX = mouseX+10;
 stepY = mouseY+10;
   
        
     
   //for statement
   for (int gridY = 350; gridY < 700; gridY+=stepY){
     for( int gridX = 400; gridX < 700; gridX+=stepX){
       noStroke();
       fill(width, height, 300);
               
     
       
       float diameter = dist (stepX*2, stepY*2, gridX, gridY);
       diameter = diameter/max_distance * 50; 
       fill(random(width/6),height, 300);
       pushMatrix();
     
    translate(stepX, stepY, diameter*12);
    if (mousePressed) ellipse(780, 180, random(stepX/3), random(stepY/3));
   ellipse(120, 820, diameter/4, diameter);
   fill(random(width), height, random(300));
   ellipse(140, 180, diameter/3, 60);
   fill(width, random(height), 400);
   ellipse(340, 120, diameter/4, 50);
   fill(random(width), random(height), 400);
   ellipse(440, 220, diameter/2, diameter/3);
   stroke(height);
   fill(width, random(400), 300);
   
   fill(random(width), random(height), 600);
   if (mousePressed) ellipse(850, 600, random(stepX/12), random(stepY/10));
   if (mousePressed) rect(random(1000),440, random(50), random(-100));
   fill(random(80),random(0),600);
   if (mousePressed) rect(random(680), 660, random(30), random(-60));
   noFill();
   stroke(random(500),random(500),300);
   if (mousePressed) ellipse(350, 520, random(stepX/16), random(stepY/12));
   if (mousePressed) rect(random(220), 560, random(20), random(-90));
   
 popMatrix();  
     
    }
     }
   }  




//Key pressed()
void keyReleased(){
  noStroke();
  fill(random(80),random(80),600);
  if (key == '2') ellipse(random(height), random(850), 15, 15);
  if (key == '2') ellipse(random(height), random(width), 5, 5);
  noFill();
  stroke(random(80),random(80),600);
  if (key == '2') ellipse(random(height), random(width), 10, 10);
  if (key == 'b')  image(universe, 0, 0);
      
   
  if (key == DELETE || key == BACKSPACE) background(random(height));
 if (key == 's' || key == 'S') saveFrame("screenshot.png");
 if ( key == 'c') chimes.trigger();
  if ( key == 'c' ) println ("sample triggered");
 }

