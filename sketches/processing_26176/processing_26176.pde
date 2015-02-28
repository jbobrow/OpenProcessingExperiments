
//variables
float speed = 10;
int cy;
PFont font1;
String storedKeys = "";
float [] colours = new float [3];
PImage info;



void setup () {
  size (800,800);
  font1 = loadFont ("FelixTitlingMT-150.vlw");
 background (255);
 info = loadImage ("info.png");
}

 

void draw () {
mouseattributes();
fade();
instructions ();
smooth ();
noStroke();
image (info, 0,0);}

void instructions(){
if (mouseX < 50 && (mouseY <50)){
fill(0);
textFont(font1, 25);
text ( "Arrow Keys: Draw from corners",0,350);
text( "Left Mouse: Draw from Edges" ,0, 375);
text ( "Type and Right mouse: Randomly prints words" ,0, 400);
text( "Shift: Clear Canvas", 0,425);
text( "Move up and down to change Font Size", 0,450);}}
 
 
void mousePressed () {
 if (mouseButton == RIGHT) {

   for (int n=0; n<3; n++) //picking random colour
 {
   float r = random (0,255);
 colours [n] = r; //storing colours
 }
stroke(colours[0], colours[1], colours[2]); //filling with random colour

 line (400,0,mouseX,mouseY);
 line (0,400,mouseX,mouseY);
 line (800,400,mouseX,mouseY);
 line (400,800,mouseX,mouseY);}}

void keyPressed () {
  //key
storedKeys += key;
println(storedKeys);

if (key == CODED) { 
if (keyCode == UP){
   fill(235,206,255);
triangle (mouseX, mouseY, mouseX+20, mouseY+20, 0, 0);}}

if (keyCode == DOWN){
   fill(255,206,249); 
triangle (mouseX, mouseY, mouseX+20, mouseY+20, 800, 800);
}

if (keyCode == RIGHT){
   fill(206,255,252);
triangle (mouseX, mouseY, mouseX+20, mouseY+20, 800, 0);}

if (keyCode == LEFT){
 fill(212,255,206); 
triangle (mouseX, mouseY, mouseX+20, mouseY+20, 0, 800);}

if (key == CODED) { 
 
if (keyCode== SHIFT){setup();}
} }




void mouseattributes (){
  
  if (mouseY <160) {
textFont(font1, 20);}

 if (mouseY > 160 && (mouseY <320)) {
  textFont(font1, 50);
}

 if (mouseY > 320 && (mouseY <480)) {
textFont(font1, 70);
}

if (mouseY > 480 && (mouseY <640)) {
  textFont(font1, 100);
}

 if(mouseY > 640 && (mouseY <800)) {
  textFont(font1, 150);
}}


void mouseClicked() {
   for (int n=0; n<3; n++) //picking random colour
 {
   float r = random (0,255);
 colours [n] = r; //storing colours
 }
fill(colours[0], colours[1], colours[2]); //filling with random colour

float x= random (0,800); //random position for words
float y = random (0,800);
  
 text (storedKeys, x, y);
 
 storedKeys =""; }
 
 void fade (){ 
   //fading background
  if (frameCount % 20 == 0) {
    // Draw a transparent white rectangle
      fill(255, 10);
    rect(0, 0, width, height);}  }
 
 
 






