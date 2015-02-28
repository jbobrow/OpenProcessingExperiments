

/* very first sketchs tests avec Pierre
*/
import fullscreen.*;
import japplemenubar.*;
import processing.video.*;
//import processing.opengl.*;

//MovieMaker mm; // Declare MovieMaker opbject
FullScreen fs; 

// variables 
float rayon;
float rayonbase;


void setup(){
size(600,600);
frameRate(30);
smooth();
  // Create the fullscreen object
  fs = new FullScreen(this);
  // enter fullscreen mode
  fs.enter();
//mm = new MovieMaker (this, width, height, "drawing2.mov",25, MovieMaker.MOTION_JPEG_B, MovieMaker.HIGH);
}

void draw(){
 //noStroke();
rectMode(CORNER);
//background(25,25,0);

fill(25,25,4,2);
rect(0,0,width,height);
rayon=dist(mouseX, mouseY, (width-mouseX)/2, (height-mouseY)/2) /8;
float vert = rayon*2.5;
fill(255-(vert/2),55-(rayon/4),rayon);
ellipse(mouseX,mouseY,rayon+rayonbase,rayon+rayonbase);
ellipse(width-mouseX,mouseY,rayon+rayonbase,rayon+rayonbase);
ellipse(mouseX,height-mouseY,rayon+rayonbase,rayon+rayonbase);
ellipse(width-mouseX,height-mouseY,rayon+rayonbase,rayon+rayonbase);
stroke(128,rayon,vert);
strokeWeight(random(1,4));
strokeJoin(ROUND);
//saveFrame("image_###.png"); enregistre une image de la fenetre
//mm.addFrame(); // ajoute les pixels de la fenêtre à la video
}
void keyPressed() {
  if (key == ' ') {
    saveFrame("image_###.png"); //enregistre une image de la fenetre
   println("1 image enregistrée :");
   // mm.finish();  // Finish the movie if space bar is pressed!
  }
   if (key == 'a') {
    rayonbase = rayonbase+10;
    if (rayonbase >= (width/2)) {rayonbase = (width/2);}
    }
   if (key =='z'){
   background(255);
    }
  println("touche pressée :" + key);
}
void keyReleased() {
if (key=='a'){
rayonbase=0;}
  println("touche relachée :" + key);
}

