
/* @pjs font="font1.ttf"; */
int myState = 0 ;
int x = 0 ;
PFont font ;
PImage gaby ;
float y;
 
void setup() {
  size(500, 500) ;
 
 
 
font = createFont("font1.ttf", 60);
textFont(font);
textAlign(CENTER, CENTER);
gaby = loadImage("gaby.jpg");

 
 
}
 
 
void draw() {
   
 switch(myState) {
    
   
   case 0:
   image(gaby, 0, 0, width, height);
   background(#FFFFFF);
     image(gaby, x, random(6), 500, 500);
    
     x = x + 1;
     if (x > 10) {
       x = 1;
     }
       
      textFont(font, 55);
      fill(#000000);
      text("Shake it like a polaroid pickcha!", 250, 450);

 
}
}


