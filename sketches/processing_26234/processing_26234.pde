
//Estelle Felix 2011



//DECLARE VARIABLES
PImage img;
float r = PI/6; // to create rotating "paintbrush" shape
int re=0; 
int gr=142;
int bl=0;
PFont f;

//INITIAL SETTINGS
void setup () {
size(1025, 750);
img = loadImage ("tree.jpg");
image(img,0,0);
f = loadFont ("AGaramondPro-Regular-48.vlw");

smooth ();

}


//REPEAT
void draw (){
stroke (0); 
fill (0, 142, 0);
rect (20, 10, 40, 40);
fill (193, 0, 0);
rect (20, 60, 40, 40);
fill (255);
rect (20, 110, 40, 40);
fill (240, 133, 235);
rect (20, 160, 40, 40);

textFont (f, 24);
fill (255);
text ("Summer", 70, 40);
text ("Autumn", 70, 90);
text ("Winter", 70, 140);
text ("Spring", 70, 190);
text ("Click on a season above and drag mouse to create foliage", 70, 675);
text ("Press any key to clear tree", 70, 700);
}


//Activate paint function
void mouseDragged (){ 

pushMatrix ();
translate (mouseX, mouseY);
rotate (r);
noStroke();
ellipseMode(CENTER);
fill (re, gr, bl, 100);
ellipse (30, 0, random (4, 30), random (30,4));
popMatrix ();
r += PI/90;
}

//Activate change in colour
void mousePressed(){
  if (mouseX < 60 && mouseY < 50){
  re= 0;
  gr= 142; 
  bl= 0;
  }
  
 if (mouseX <60 && mouseY <100 && mouseY > 50){
  re = 193;
  gr = 0;
  bl = 0;
 }
  
 if (mouseX <60 && mouseY <150 && mouseY > 100){
  re = 255;
  gr = 255;
  bl= 255;
 }
 
 if (mouseX <60 && mouseY <200 && mouseY > 150){
   re = 240;
   gr = 133;
   bl = 235;
}}



void keyPressed(){
  image(img,0,0);
}

//EVENT HANDLERS


//CUSTOM FUNCTIONS




