
import ddf.minim.*;

float xcenter;    // Mittelpunkt auf der x-Achse
float ycenter;    // Mittelpunkt auf der y-Achse
float rad = 55;   // Radius der Kreisbahn
float angle;      // aktueller Rotationswinkel
float a = 20;


Minim minim;
AudioPlayer player;
 
void setup () {
  size (550, 200);
  smooth ();
  noStroke ();
  background (76);
  noCursor();

  
  minim = new Minim (this);
  player = minim.loadFile ("ALARM.wav");
   
  // Rotationsmittelpunkt
  xcenter = width / 2;
  ycenter = height / 2;
}
 
void draw () {
  ellipse(mouseX,mouseY,10,10);
  
  fill (76, 4);
  rect (0, 0, width, height);
   
  // Verschieben des Rotationswinkels
  angle += 0.04; 
  // Berechnung der aktuellen Position
  float x = xcenter + cos (angle) * rad;
  float y = ycenter + sin (angle) * rad;
   
   float playPos = player.position ();
  float playLen = player.length ();
  float xpos = (playPos / playLen) * width;
   
  // Zeichnen des Kreises
  fill (236);
  ellipse (x, y, a, a);
  if( dist(mouseX, mouseY,x,y) < a) {
      player.play ();
  } else {
    player.pause();
  }
}


