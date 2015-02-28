

PImage a;
PImage b;
PImage c;
PImage d;
PFont font;


void setup() {
  size(300, 400);
  cursor(HAND);
   smooth();   
   font = loadFont("Futura-Medium-48.vlw");
   textFont(font);
   a =loadImage("01.png");
   b =loadImage("02.png"); 
   c =loadImage("treat.png"); 
   d =loadImage("happy.png"); 
   
}
 
void draw(){
  //click to get him to sit
  //press a key to give him the treat!
  background(a);
  if (mousePressed ==false){
         image (c, mouseX -50, mouseY -20);
  }

if (mousePressed ==true){
  image(b,0,0);
  //mouseX, mouseY);
image(c, mouseX -50,mouseY -20);
textSize(80);
  text("sit~",115, 300);
   }
   
if (keyPressed == true) {
image (d,0,0);
textSize(50);
  text("Good Boy!",20, 350);
 }
}


