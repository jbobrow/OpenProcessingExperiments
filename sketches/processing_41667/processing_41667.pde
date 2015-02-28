
int numb = 2000;
PImage Pic;

Coldwater[] myColdwater = new Coldwater [numb]; // setting up the pixels 

void setup() {
Pic = loadImage("paint.jpg"); //background image that doubles as the source for the pixel colors
size(768,585);
smooth();
background(Pic);

for ( int wash = 0; wash<myColdwater.length; wash++) { // setting up the basis for the pixels that move across the screen
myColdwater[ wash ] = new Coldwater();
}}

void draw() {
  for ( int wash = 0; wash < myColdwater.length; wash++ ) {
    myColdwater [ wash ]. update ();
    myColdwater [ wash ]. display ();
  }}
 
 class Coldwater {
  int P1 = int (random(100,400)); // assigns coordinates for the pixels
  int P2 = int (0);
  
  int P3 = int (0);
  int P4 = int ( random (400,500));
  
  int P5 = int (random(500,600));
  int P6 = int (0);
  
 
 Coldwater() {
 }

void update() {
  P1 = P1 ;
  P2 = P2 + 1 ;
  
  P3 = P3 + 1;
  P4 = P4 ;
  
  P5 = P5;
  P6 = P6 + 1 ;
  

}

void display () {
  color swatch = Pic.get(P1,P2); // retrieves the color from the image in the background
  stroke ( swatch*3); // modifies the color from the image
  strokeWeight(1);
 
 point ( P1, P2);
 
  point( P3,P4);
  
  point(P5,P6);
  

  
  
}}

