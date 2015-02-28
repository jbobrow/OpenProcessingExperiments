
PFont font;
PImage img; 

void setup() {
size(400,400);
img = loadImage ("04.png"); 
font = loadFont("Garamond-Italic-20.vlw");
textFont(font);
fill(0);
 image(img,0,0); 
}
 
void draw() {

 
String l = "burning";
text(l,random(0,400),random(0,400));
}

void keyPressed() {  
     if (key == BACKSPACE) {
       image(img, 0, 0);
       
   } 
}


