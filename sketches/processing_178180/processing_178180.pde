
// Working with sound and images.
// Assignment 15, final project.
// 12/17/2014, author: Betina
// Theme: 'Nothing else matters.'
// The theme integrates sound, images and text. 


// Import sound library.
import ddf.minim.*;

// Initialize sound, image, color and boolean variable.
Minim minim;
AudioPlayer sound_1;
AudioPlayer sound_2;
PImage visual2_Image;
color[] mycolor = { #DE7979, #B20E0E, #ED2B2B, #270606, #641414, #C70EE0,#5F1F05, #C920E0};
float a = 0.0;
float inc = TWO_PI/25.0;
boolean someMode = false;

// Setup() settings.
void setup(){
   size(800, 700);
   colorMode(HSB, width, height, 100);
   minim = new Minim(this);
   sound_1 = minim.loadFile("ass15_sound1_short.mp3");
   sound_1.loop();
   sound_2 = minim.loadFile("ass15_sound2_short.mp3");
   visual2_Image = loadImage("ass15_visual2.png");
}

// Loop on graphic (sine functions), sound, image (one static image) and text.
// The center of the coordinate system for the sine functions depends on the 
// mouse pointer input.
// Calls myBackground().
void draw(){
   if (someMode == true) {
     myBackground();
     image(visual2_Image, 50, 220);
     for (int i = 0; i < 800; i=i+2) {
       fill(#073EDE, 50);
       stroke(58,89,i);
       fill(mouseY, mouseX, 75);
       fill(mycolor[int(random(0,7))], 50);
       pushMatrix();
       translate(mouseX, mouseY);
       if (mousePressed == true) {
         textAlign(LEFT);
         textSize(140);
         fill(#C70EE0, 75);
         textSize(140);
         text("YOU.", -120, +200);
         sound_1.close();
         sound_2.loop();
       }
       else {
         tint(199, 14, 224, 126);
         arc(-i, -i, 50+sin(a)*40.0, i,radians(0), radians(360));
         arc(+i, -i, 50+sin(a)*40.0, i,radians(0), radians(360));
         arc(-i, +i, 50+sin(a)*40.0, i,radians(0), radians(360));
         arc(+i, +i, 50+sin(a)*40.0, i,radians(0), radians(360)); }
     popMatrix();
     a = a + inc;
     }
   }
}

// Interaction with app user via mouse.
// MouseMove() starts the app and displays some text.
void mouseMoved() {
   someMode = true;
   fill(255,75);
   textSize(140);
   textAlign(LEFT, BOTTOM);
   text("Nothing", 38, 200);
   text("else", 38, 450);
   text("matters.", 38, 680);
}

// Called from draw(). Changes coordinate center randomly
// and displays image multiple times if mouse is pressed.
void myBackground() {
   background(10,89,63);
   for (int l=0; l<80; l++){
     pushMatrix();
     translate(random(width), random(height));
     textAlign(CENTER);
     textSize(random(20,80));
     fill(#F8FC0F, 50);
     if (mousePressed == true){
       image(visual2_Image, -150, -150, 400, 200);
       }
     else {
     background(0,0,0);   
     }
     popMatrix();
   }
}

// After the 'x' or 'X' key pressed the app will be stopped and the audio player closed. 
void keyReleased(){
  if (key == 'x' || key == 'X') 
        {
          noLoop();
          sound_1.close();
          sound_2.close();
        }
}
 

