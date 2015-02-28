
// import the minim file for audio file
import ddf.minim.*;
// Gloabal variables
// declare a PImage variable type
Minim minim;
AudioPlayer Primavera;
PImage spring;
color[] Ellipses = {#A3588B,#F693EB,#31D9EA,#F09864, #FFD367};
color[] palette = Ellipses;
String hw=" Hello Spring!";

// set up the screen,load an image file from HDD amd the mp3 file

void setup() {
  size(960,600);
  minim= new Minim(this);  
  Primavera= minim.loadFile("Primavera.mp3");
  Primavera.play();
  spring = loadImage("Spring.jpg");   
}

//draw the shapes I want to see on the screen

void draw() {
  
  image(spring, 0, 0);

//mouse input
int x;
int y;
x=mouseX+5;
y=mouseY+5;

// the condition for mouse input
if(mousePressed){
   
for(int a=10; a< width; a+=x){
for(int b=10;  b< height; b+=y){

     fill(palette[int(random(0, 5))]);
     noStroke();
     ellipse( random(a), random(b), random(30), random(30));
     rect( random(a), random(b), random(15), random(15));
     point(random(a), random(b));
   }
}  

// adding the place and the type of text
fill(#A3588B);
textSize(35);
textAlign(CENTER);
text(hw, 800, 550);
}
}

